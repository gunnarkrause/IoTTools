$certPath ="XXX.pem"
$certKeyPath ="XXX.key"
$deviceId = ""
$deviceId = $args[0]
$subject = '/CN=' + $deviceId + '/O=NAME/C=DE'

openssl genrsa -out $deviceId".key" 2048
Write-Output  $deviceId".key" + " Done"

openssl req -new -subj $subject -out $deviceId".csr" -key $deviceId".key"
Write-Output  $deviceId".csr" + " Done"

openssl x509 -req -in $deviceId".csr" -CA $certPath -CAkey $certKeyPath -CAcreateserial -out $deviceId".crt" -days 3650 -sha256
Write-Output  $deviceId".crt" + " Done"

Write-Output $deviceId

