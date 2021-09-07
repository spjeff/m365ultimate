<#
.DESCRIPTION
	Loads all Microsoft 365 cloud PowerShell modules in a single window.  No more wasted time jumping between download pages and locating various Install-Module from each product team.  Collected all here centrally to provide M365 admins with a single PowerShell PS1 to install and import every command they might need.  Enables cloud admin productivity to quickly access every command.  Cheers.

	* Based on https://docs.microsoft.com/en-us/microsoft-365/enterprise/connect-to-all-microsoft-365-services-in-a-single-windows-powershell-window
	* Extended with additional community modules
	* Extended with optional modules
	* Comments and suggestions always welcome.
	* Please use issues panel at the Github page https://github.com/spjeff/m365ultimate/issues
	
.NOTES  
	File Name:  M365Ultimate.ps1
	Author   :  Jeff Jones  @spjeff
	Version  :  1.2
	Modified :  2021-09-07

.LINK
	https://github.com/spjeff/m365ultimate
#>

Start-Transcript

# PowerShell must be configured to run signed scripts for Skype for Business Online and the Security & Compliance Center. Run the following command in an elevated PowerShell session (a PowerShell session that you Run as administrator).
Set-ExecutionPolicy "RemoteSigned"

# Azure Active Directory (from https://docs.microsoft.com/en-us/microsoft-365/enterprise/connect-to-microsoft-365-powershell)
#REM Install-Module -Name "AzureAD"
Install-Module -Name "AzureADPreview"

# Azure Active Directory License (from https://github.com/nicolonsky/AzureADLicensing)
Install-Module -Name "AzureADLicensing"

# Exchange Online (from https://docs.microsoft.com/en-us/powershell/exchange/exchange-online-powershell-v2?view=exchange-ps#install-and-maintain-the-exo-v2-module)
Install-Module -Name "ExchangeOnlineManagement"

# MS Online (from https://docs.microsoft.com/en-us/powershell/module/msonline/?view=azureadps-1.0)
#DEPRECATED Install-Module -Name "msonline"

# SPO SharePoint Online (from https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-online/connect-sharepoint-online)
Install-Module -Name "Microsoft.Online.SharePoint.PowerShell"

# PNP Patterns and Practice (from https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets)
Install-Module -Name "SharePointPnPPowerShellOnline"

# Teams (from https://docs.microsoft.com/en-us/microsoftteams/teams-powershell-install)
Install-Module -Name "MicrosoftTeams"

# Data Gateway (from https://docs.microsoft.com/en-us/powershell/gateway/overview?view=datagateway-ps)
Install-Module -Name "DataGateway"

# PowerBI (from https://docs.microsoft.com/en-us/powershell/power-bi/overview?view=powerbi-ps)
Install-Module -Name "MicrosoftPowerBIMgmt"
Install-Module -Name "MicrosoftPowerBIMgmt.Admin"
Install-Module -Name "MicrosoftPowerBIMgmt.Capacities"
Install-Module -Name "MicrosoftPowerBIMgmt.Data"
Install-Module -Name "MicrosoftPowerBIMgmt.Profile"
Install-Module -Name "MicrosoftPowerBIMgmt.Reports"
Install-Module -Name "MicrosoftPowerBIMgmt.Workspaces"

# PowerApps (from https://docs.microsoft.com/en-us/power-platform/admin/powerapps-powershell#powerapps-cmdlets-for-app-creators-preview)
# includes PowerAutomate "MS Flow" (from https://docs.microsoft.com/en-us/power-platform/admin/powerapps-powershell#power-automate-commands)
Install-Module -Name "Microsoft.PowerApps.Administration.PowerShell"
Install-Module -Name "Microsoft.PowerApps.PowerShell" -AllowClobber
Install-Module -Name "Microsoft.PowerApps.Checker.Power"

# PowerApps XRM (from https://docs.microsoft.com/en-us/powershell/powerapps/overview)
Install-Module -Name "Microsoft.Xrm.OnlineManagementAPI"
Install-Module -Name "Microsoft.Xrm.Tooling.CrmConnector"
Install-Module -Name "Microsoft.Xrm.Tooling.PackageDeployment"

# Skype for Business (from https://www.microsoft.com/en-us/download/confirmation.aspx?id=39366)
$sbFile = "SkypeOnlinePowerShell.exe"
$sbUrl  = "https://download.microsoft.com/download/2/0/5/2050B39B-4DA5-48E0-B768-583533B42C3B/$sbFile"
Invoke-WebRequest -Uri $sbUrl -OutFile $sbFile
Start-Process $sbFile

# MS Graph (from https://github.com/microsoftgraph/msgraph-sdk-powershell)
Install-Module "Microsoft.Graph"

Stop-Transcript
