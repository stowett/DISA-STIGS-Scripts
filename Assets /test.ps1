<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Susan Towett
    LinkedIn        : linkedin.com/in/stowett/
    GitHub          : github.com/stowett
    Date Created    : 2026-03-31
    Last Modified   : 2026-03-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .STIG-ID-WN11-AU-000500.ps1 
#>

# Run PowerShell as Administrator

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$name = "MaxSize"
$value = 0x8000  # 32768 in decimal (32 KB)

# Create the key if it doesn't exist
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the DWORD value
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force
