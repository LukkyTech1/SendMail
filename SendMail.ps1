<#PSScriptInfo
.VERSION 1.0
.AUTHOR Niels
#>
 
#Password
$username = "powershell2@sunnus.nl"
$topsecret = "8lRiHzXc" #never store passwords like this.
$password = ConvertTo-SecureString $topsecret -AsPlainText -Force
$psCred = New-Object System.Management.Automation.PSCredential -ArgumentList ($username, $password)
 
#SMTP Settings
$smtp = "smtp.sunnus.nl"
$port = 587
 
#Address
$to = "175723@student.horizoncollege.nl" # aanpassen!
$from = "powershell2@sunnus.nl"
 
#Message
$subject = "Storing op server: Test"
$html = Get-Content -path "C:\Users\niels\sendmail opdracht\mail.html"
 
#Send MailMessage
Send-MailMessage -Body ($html | Out-String) -BodyAsHtml -To $to -Subject $subject -SmtpServer $smtp -From $from -Credential $psCred -Port $port
