# Paste this function into your PowerShell Core, to be able to call it. 
# Alternatively, you can dot-source the file in your current session: . ./urlgenerator.ps1
# You can also add it to your profile ($profile) to have it available in every session.
#
# IT MUST BE THE POWERSHELL CORE - NOT WINDOWS POWERSHELL
# Install PowerShell Core with : Choco install powershell-core -y
#
# Usage:
# urlgen -Copy
#   This will generate the URL for the selected Cloud Foundry app/service, and copy it to the clipboard.
# ug -SelectTarget
#   This will prompt you to select a Cloud Foundry org and space before generating the URL
# ug -Copy -SelectTarget
#   This will prompt you to select a Cloud Foundry org and space before generating the URL, and then copy the generated URL to the clipboard.
# ug -ProjectPath "C:\path\to\project"
#   This will use the specified project path instead of the current directory to look for manifest files

# The Script was optimized for use on Mac with the Arc Browser and installed Arc-CLI
# If you want to use it on Windows, you might want to replace the "arc-cli new-tab" command with "Start-Process" or "Invoke-Item" to open the URL in the default browser.

# The Scripts needs the "fzf" command line tool to work, which can be installed on Windows using Scoop or Chocolatey, and on Mac using Homebrew. It is used to provide a fuzzy search interface for selecting the Cloud Foundry app and manifest ID/service name.

# You must logged in to the Cloud Foundry using `cf login --sso` before running the script.

## <summary>
## Generates the URL for a given Cloud Foundry app and a manifest ID or service name.
## </summary>
## <param name="ProjectPath">The path to the project. If not provided, the current directory will be used.</param>
## <param name="Copy">If set, the generated URL will be copied to the clipboard
## <param name="SelectTarget">If set, the user will be prompted to select a Cloud Foundry org and space before generating the URL.</param>
function urlgen {
    [CmdletBinding()]
    [Alias("ug")]
    param(
        $ProjectPath = "",
        [Switch] $Copy,
        [Switch] $SelectTarget
    )

    # Prüfen ob eingeloggt in cf
    $cfOutput = cf apps 2>&1
    if ( [bool] ($cfOutput -match "token") ) {
        Write-Host "Login required" -ForegroundColor Red
        cf login --sso
    }

    if ($ProjectPath -eq "") {
        $ProjectPath = (Get-Location).Path
    }
    if ($SelectTarget) {
        $org =  (cf orgs | Select-Object -Skip 3 | fzf --prompt "Select Org")
        cf target -o $org
        $spaces = (cf spaces | Select-Object -Skip 3)
        if ($spaces.Count -gt 1) {
            $space = $spaces | fzf --prompt "Select Space"
            cf target -s $space
        }
    }

    # TEST - DELETE THIS
    #$ProjectPath = "/Users/carstenschlegel/Coding/Projekte/Hauptprojekte/Codiac/Tests/versuch2"

    $manifests = (dir "$ProjectPath/app/*/webapp/manifest.json" | ForEach-Object { $id=(Get-Content $_ -Raw | ConvertFrom-Json -AsHashtable).'sap.app'.id; [pscustomobject]@{ id = $id; urlid = $id.Replace(".","") } } )
    if (!($manifests -is [array])) {
        $manifests = @($manifests)
    }
    $services = ((cds compile srv --to json | ConvertFrom-Json).definitions.PSObject.Properties.name)
    $services | ForEach-Object {
        if ($_ -match ".*Service") {
            $manifests += [pscustomobject]@{ id = $_; urlid = $_.Replace(".","") }
        }
    } 
    $apps = (cf apps | Select-Object -Skip 3 | ForEach-Object { $cols = $_ -split '\s{2,}'; if ($cols[3]) { [pscustomobject]@{ name=$cols[0]; started=$cols[1]; route=$cols[3] } } })
    $apps = $apps | Where-Object { $_.name -notmatch ".*-srv" }

    if ($apps.Count -eq 1) {
        $selApp = $apps[0].name
    }
    elseif ($apps.Count -eq 0) {
        Write-Host "No Cloud Foundry Apps found!" -ForegroundColor Red
        return
    }
    else {
        $selApp = $apps.name | fzf --prompt "Select Cloud Foundry App"
    }
    if ($selApp -ne "") {
        $app = $apps | Where-Object { $_.name -eq $selApp }
        if ($manifests.Count -eq 1) 
        { 
            $selid = $manifests[0].id
        }
        elseif ($manifests.Count -eq 0) 
        { 
            Write-Host "No Manifest-File in project found!" -ForegroundColor Red
            return
        }
        else 
        { 
            $selid = $manifests.id | fzf --prompt "Select Manifest ID" 
        }
        
        if ($selid -ne "") {
            if ($services -contains $selid) {
                $serviceElements = $selid.Replace("Service","").Split(".")
                $serviceElements[0] = $serviceElements[0].ToLower()
                if ($serviceElements.Count -eq 1) {
                    $a = Read-Host "Open Metadata? (Y/n)"
                    if ($a -ne "N") {
                        $finalUrl = "https://$($app.route)/odata/v4/$($serviceElements -join "/")/`$metadata"                
                    }
                    else {
                        $finalUrl = "https://$($app.route)/odata/v4/$($serviceElements -join "/")"                
                    }
                }
                else {
                    $finalUrl = "https://$($app.route)/odata/v4/$($serviceElements -join "/")"                
                }
                if ($Copy) {
                    $finalUrl | scb
                }
                else {
                    if ((get-command arc-cli -ErrorAction SilentlyContinue).Count -eq 0) {
                      Start-Process $finalUrl
                    } else {
                      arc-cli new-tab $finalUrl
                    }
                }
                return $finalUrl
            }
            else {
                $manifest = $manifests | Where-Object { $_.id -eq $selid }
                $finalUrl = "https://$($app.route)/app/$($manifest.urlid)/index.html"
                if ($Copy) {
                    $finalUrl | scb
                }
                else {
                    if ((get-command arc-cli -ErrorAction SilentlyContinue).Count -eq 0) {
                      Start-Process $finalUrl
                    } else {
                      arc-cli new-tab $finalUrl
                    }
                }
                return $finalUrl
            }
        }
    }
}
