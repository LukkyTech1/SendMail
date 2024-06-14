<#PSScriptInfo
.VERSION 1.0
.AUTHOR MrPowerShell
#>

# SMTP instellingen
$smtpServer = "smtp.yourserver.com"
$port = 587
$username = "yourusername@yourdomain.com"
$topsecret = "yourpassword" # nooit wachtwoorden op deze manier opslaan, dit is alleen voor voorbeeld.
$password = ConvertTo-SecureString $topsecret -AsPlainText -Force
$psCred = New-Object System.Management.Automation.PSCredential -ArgumentList ($username, $password)

# Adressen
$from = "yourusername@yourdomain.com"
$to = "recipient@domain.com"

# Bericht
$subject = "Test Email"
$body = @"
<html>
<head>
    <title>Test E-mail</title>
</head>
<body>
    <h2>Dit is een test e-mail.</h2>
    <p>Status Server: Up</p>
    <p>Servernaam: TestServer01</p>
    <p>Datum/Tijd: $(Get-Date)</p>
    <p>Mogelijke oorzaak: Geen</p>
    <p>Bedrijfsnaam: 1485 Architecten</p>
    <p>Laatste wijziging: $(Get-Date)</p>
</body>
</html>
"@

# E-mail versturen
Send-MailMessage -From $from -To $to -Subject $subject -Body $body -BodyAsHtml -SmtpServer $smtpServer -Credential $psCred -Port $port

Write-Output "E-mail is verstuurd naar de servicedesk."

