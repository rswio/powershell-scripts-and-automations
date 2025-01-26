# Define email parameters
$server="mailserver.domain.com"
$port=25 # Default SMTP port is 25 for non-encrypted and 587 for encrypted
$username="username"
$password="password"
$from="sender@domain.com"
$to="recipient@domain.com"
$subject="Email with attachment"
$body="This is the body of the email."

# Create a new email message
$message=New-Object System.Net.Mail.MailMessage($from, $to, $subject, $body)

# Create SMTP client and send the email
$client=New-Object System.Net.Mail.SmtpClient($server, $port)

# Enable SSL and set credentials
$client.EnableSsl=$false

$client.Credentials=New-Object System.Net.NetworkCredential($username, $password)
$client.Send($message)

# Clean up resources
$attachment.Dispose()
$message.Dispose()
