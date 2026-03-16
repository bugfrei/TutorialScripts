# SUPORTIS SAP BTP Tutorial – Helper Scripts

This repository contains PowerShell helper scripts used in the  
**SUPORTIS SAP BTP End-to-End Tutorial Series**.

These scripts are optional but highly recommended to simplify repetitive tasks during development and deployment.

All scripts are designed for **PowerShell Core** and are mainly optimized for macOS, but can also be adapted for Windows environments.

---

## 📦 Included Scripts

---

### 1️⃣ install_node_modules.ps1

Installs all required Node modules for the complete MTA project.

This script:

- Installs Node modules in the project root
- Installs Node modules in all UI apps
- Installs Node modules in the App Router
- Ensures a consistent dependency setup before building

Why use it?

Instead of manually navigating into multiple folders and running `npm install`, this script automates the process from the project root.

Typical use case:

- Before running `mbt build`
- After pulling changes from Git
- After cloning the repository

---

### 2️⃣ urlgenerator.ps1

Generates ready-to-use URLs for deployed services and UI applications.

Optimized for:

- macOS
- Arc Browser
- PowerShell Core

Features:

- Builds service URLs based on Cloud Foundry output
- Builds application URLs (App Router based)
- Uses `fzf` (fuzzy finder CLI tool) for interactive selection
- Copies the final URL directly to the clipboard

Requirements:

- `fzf` must be installed
- Cloud Foundry CLI must be available

Typical use case:

- Quickly open deployed services
- Generate OData URLs
- Open deployed UI apps without manual URL construction

---

### 3️⃣ destinationurlgen.ps1

Generates the correct destination URL for SAP Cloud Transport Management (CTM).

This script:

- Reads current Cloud Foundry target
- Extracts Org and Space information
- Converts API URL to correct deploy-service format
- Outputs the correct destination URL
- Copies the result to clipboard

Important:

Ensure that the generated URL does NOT contain `cfapps`.
If necessary, remove `apps` from the domain.

Typical use case:

- Creating Destinations for CTM
- Configuring multi-system landscape (DEV → QS → PROD)

---

### 4️⃣ cft.ps1 (Cloud Foundry Target)

Interactive Cloud Foundry target switcher.

This script:

- Lists available Cloud Foundry organizations
- Lists spaces within the selected organization
- Uses `fzf` for interactive selection
- Automatically executes:
  
### tinysample.ps1

Creates a tiny sample Files in an empty CDS Project (`cds init --nodejs`). Just execute this PowerShell script in the root of your empty CDS project.


# Important Cloud Foundry CLI Commands
[important-cf-commands.md](important-cf-commands.md)

# Example GitHub Actions Workflow File
[example_github_workflow.yaml](example_github_workflow.yaml)

# Example Git Config File
[gitconfig.md](gitconfig.md)


# YouTube Playlist for the SUPORTIS SAP BTP Tutorial Series

Part 1: BTP MTA Deploy & Config - Part 1: Series Overview
New Link when uploaded

Part 2: BTP MTA Deploy & Config – Part 2: BTP Preparation
New Link when uploaded

Part 3: BTP MTA Deploy & Config – Part 3: CAP Backend & UI Apps
New Link when uploaded

Part 4: BTP MTA Deploy & Config – Part 4: CAP Cloud Configuration
New Link when uploaded

Part 5: BTP MTA Deploy & Config – Part 5: Manual Cloud Deployment to BTP
New Link when uploaded

Part 6: BTP MTA Deploy & Config – Part 6: Security + Hybrid Mode
New Link when uploaded

Part 7: BTP MTA Deploy & Config – Part 7: Launchpad Configuration
New Link when uploaded

Part 8: BTP MTA Deploy & Config – Part 8: CI/CD and Cloud Transport
New Link when uploaded

Part 9: BTP MTA Deploy & Config – Part 9: GitHub Actions CI/CD
New Link when uploaded

