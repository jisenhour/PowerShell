$CredentialName = "TestCred2"
$CredentialValue = "NewValue"
$postString = "credential[name]=$credentialName&credential[value]=$credentialValue"
$postBytes = [System.Text.Encoding]::UTF8.GetBytes($postString)

$createCredentialRequest = [System.Net.WebRequest]::Create("https://my.rightscale.com/api/credentials/240835003")
$createCredentialRequest.Method = "PUT"
$createCredentialRequest.CookieContainer = $cookieContainer
$createCredentialRequest.Headers.Add("X_API_VERSION", "1.5")


$createCredentialRequestStream = $createCredentialRequest.GetRequestStream()
$createCredentialRequestStream.Write($postBytes, 0, $postBytes.Length)
$createCredentialRequestStream.Close()





[System.Net.WebResponse] $createCredentialResponse = $createCredentialRequest.GetResponse()
$createCredentialResponseStream = $createCredentialResponse.GetResponseStream()

