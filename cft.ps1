# Change the current org and space in Cloud Foundry CLI using fzf for selection.
# Run this script or directly the line inside your PowerShell.

# CLI Tool fzf is required for this script to work. You can install it from

cf target -o (cf orgs | Select-Object -Skip 3 | fzf --prompt "Select target");  $sp = (cf spaces | Select-Object -Skip 3); if ($sp.Count -gt 1) { $sp = ($sp | fzf); cf target -s $sp }
