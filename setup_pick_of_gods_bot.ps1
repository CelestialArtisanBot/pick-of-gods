# Define parameters for email and password
param (
    [Parameter(Mandatory=$true)]
    [string]$Email,
    [Parameter(Mandatory=$true)]
    [string]$Password
)

# Set project directory
$projectDir = "C:\PickOfGodsBot"
$logDir = "$projectDir\logs"

# Create logs directory if it doesn’t exist
if (-not (Test-Path $logDir)) {
    New-Item -Path $logDir -ItemType Directory -Force
}

# Function to write logs
function Write-Log {
    param ($Message, $Level = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-ddTHH:mm:ssZ"
    $logMessage = "[$timestamp] $Level`: $Message"
    Add-Content -Path "$logDir\setup.log" -Value $logMessage
    if ($Level -eq "ERROR") { Add-Content -Path "$logDir\error.log" -Value $logMessage }
}

# Log the start of the setup
Write-Log "Starting setup for Pick-Of-Gods-Bot with Email: $Email"
Write-Log "Password received (hidden for security)"

# Create credentials file
New-Item -Path "$projectDir\credentials.txt" -ItemType File -Force
Add-Content -Path "$projectDir\credentials.txt" -Value "Email: $Email"
Add-Content -Path "$projectDir\credentials.txt" -Value "Password: [hidden]"

# Log completion
Write-Log "Setup complete! Check credentials.txt for details."