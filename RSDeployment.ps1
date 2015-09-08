#get cookie container from authentication $cookieContainer
    $deploymentName = "Deployment for API Sandbox"
    $deploymentDescription = "Sandbox for Miscellaneous API Tests"
    $postString = "deployment[name]=""$deploymentName""&deployment[description]=$deploymentDescription"
    $postBytes = [System.Text.Encoding]::UTF8.GetBytes($postString)
    $createDeploymentRequest = [System.Net.WebRequest]::Create("https://my.rightscale.com/api/deployments.xml")
    $createDeploymentRequest.Method = "POST"
    $createDeploymentRequest.CookieContainer = $cookieContainer
    $createDeploymentRequest.Headers.Add("X_API_VERSION", "1.5");

    $createDeploymentRequestStream = $createDeploymentRequest.GetRequestStream()
    $createDeploymentRequestStream.Write($postBytes, 0, $postBytes.Length)
    $createDeploymentRequestStream.Close()
    [System.Net.WebResponse] $createDeploymentResponse = $createDeploymentRequest.GetResponse()
    $createDeploymentResponseStream = $createDeploymentResponse.GetResponseStream()
    $createDeploymentResponseStreamReader = New-Object System.IO.StreamReader -argumentList $createDeploymentResponseStream
    [string]$createDeploymentResponseString = $createDeploymentResponseStreamReader.ReadToEnd()