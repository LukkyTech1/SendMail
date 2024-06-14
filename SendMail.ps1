<#PSScriptInfo
.VERSION 1.0
.AUTHOR Luka Meester
#>

param (
    [string]$Status,
    [string]$Servernaam,
    [string]$DatumTijd,
    [string]$Oorzaak,
    [string]$Bedrijfsnaam,
    [string]$LaatsteWijziging
)

# SMTP server instellingen
$smtpServer = "smtp.yourserver.com"
$smtpFrom = "no-reply@yourdomain.com"
$smtpTo = "servicedesk@yourdomain.com"
$messageSubject = "Storingsmelding: $Servernaam"

# HTML template inlezen
$templatePath = "C:\Path\To\Your\template.html"
$htmlTemplate = Get-Content -Path $templatePath -Raw

# HTML template invullen met de parameters
$htmlContent = $htmlTemplate -replace "{{Status}}", $Status `
                                -replace "{{Servernaam}}", $Servernaam `
                                -replace "{{DatumTijd}}", $DatumTijd `
                                -replace "{{Oorzaak}}", $Oorzaak `
                                -replace "{{Bedrijfsnaam}}", $Bedrijfsnaam `
                                -replace "{{LaatsteWijziging}}", $LaatsteWijziging

# E-mail bericht opstellen
$mailMessage = @{
    From       = $smtpFrom
    To         = $smtpTo
    Subject    = $messageSubject
    Body       = $htmlContent
    BodyAsHtml = $true
    SmtpServer = $smtpServer
}

# E-mail versturen
Send-MailMessage @mailMessage

Write-Output "E-mail is verstuurd naar de servicedesk."

# Test het script door het aan te roepen met parameters
# .\SendMail.ps1 -Status "Down" -Servernaam "Server01" -DatumTijd "2024-05-22 10:00" -Oorzaak "Netwerkfout" -Bedrijfsnaam "1485 Architecten" -LaatsteWijziging "2024-05-22 09:50"
