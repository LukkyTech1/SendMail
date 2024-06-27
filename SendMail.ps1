<#PSScriptInfo
.VERSION 1.0
.AUTHOR Luka Meester
#>

#Password
$username = "powershell2@sunnus.nl"
$topsecret = "8lRiHzXc" #
$password = ConvertTo-SecureString $topsecret -AsPlainText -Force
$psCred = New-Object System.Management.Automation.PSCredential -ArgumentList ($username, $password)

#SMTP Settings
$smtp = "smtp.sunnus.nl"
$port = 587

#Address
$to = "177972@student.horizoncollege.nl" # aanpassen!
$from = "powershell2@sunnus.nl"

#Message
$subject = "Storing op server: Test"
$html = Get-Content -path "$PSScriptRoot\Template.html" | Out-String
$html = $html.ToString().Replace("{{status}}", "Up")

#Send MailMessage
Send-MailMessage -Body $html -BodyAsHtml -To $to -Subject $subject -SmtpServer $smtp -From $from -Credential $psCred -Port $port
