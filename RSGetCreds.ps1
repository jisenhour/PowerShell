#get cookie container from authentication $cookieContainer
 
    $createDeploymentRequest = [System.Net.WebRequest]::Create("https://my.rightscale.com/api/credentials.xml")
    $createDeploymentRequest.Method = "GET"
    $createDeploymentRequest.CookieContainer = $cookieContainer
    $createDeploymentRequest.Headers.Add("X_API_VERSION", "1.5");


    [System.Net.WebResponse] $createDeploymentResponse = $createDeploymentRequest.GetResponse()
    $createDeploymentResponseStream = $createDeploymentResponse.GetResponseStream()
    $createDeploymentResponseStreamReader = New-Object System.IO.StreamReader -argumentList $createDeploymentResponseStream
    [string]$createDeploymentResponseString = $createDeploymentResponseStreamReader.ReadToEnd()