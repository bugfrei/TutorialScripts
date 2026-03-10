 # This script generates the destination URL for the Cloud Transport Management (CTM) based on the choosed targeted Cloud Foundry org and space. 
 # It uses the `cf` CLI to retrieve the API endpoint, org, and space information, constructs the URL, and copies it to the clipboard.
 
# Run this script or directly the line anywhere in the terminal to generate the URL and copy it to the clipboard. Make sure you have the `cf` CLI installed and configured properly.
# You must logged in to the Cloud Foundry using `cf login --sso` before running the script.
 
 cf target -o (cf orgs | Select-Object -Skip 3 | fzf);  $t = cf target; $api = ($t | Select-String 'API endpoint').ToString().Split()[-1]; $org = ($t | Select-String '^org:').ToString().Split()[-1]; $space = ($t | Select-String '^space:').ToString().Split()[-1]; if($api -match 'api\.cf\.([^.]+)(?:-[0-9]+)?\.hana\.ondemand\.com'){ $region=$matches[1] }; $url = "https://deploy-service.cf.$region.hana.ondemand.com/slprot/$org/$space/slp"; Write-Host $url -ForegroundColor Red; Set-Clipboard $url

