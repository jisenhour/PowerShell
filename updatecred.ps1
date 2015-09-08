$CredentialName = "TestCred1"
$CredentialValue = "NewValue"
$postString = "credential[name]=$credentialName&credential[value]=$credentialValue"
$postBytes = [System.Text.Encoding]::UTF8.GetBytes($postString)

$createCredentialRequest = [System.Net.WebRequest]::Create("https://my.rightscale.com/api/credentials/240764003?credential[name]=TestCred1&credential[value]=InsertValue")
$createCredentialRequest.Method = "PUT"
$createCredentialRequest.CookieContainer = $cookieContainer
$createCredentialRequest.Headers.Add("X_API_VERSION", "1.5")


$createCredentialRequestStream = $createCredentialRequest.GetRequestStream()
$createCredentialRequestStream.Write()
$createCredentialRequestStream.Close()





[System.Net.WebResponse] $createCredentialResponse = $createCredentialRequest.GetResponse()
$createCredentialResponseStream = $createCredentialResponse.GetResponseStream()

