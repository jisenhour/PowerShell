function Set-TrustedHostsFromAmazon()
{
    #Prereq is that AWS Credentails are already loaded for this session
    
    
    #Enable PS remoting starts the winrm services which enables the wsman provider
    Enable-PSRemoting
    Clear-Item WSMan:\localhost\Client\TrustedHosts

    $IPAddresses = $(Get-EC2Instance).Instances | Select-Object PrivateIPAddress
    
    foreach($IPAddress in $IPAddresses)
    {
            $Filter = New-Object Amazon.EC2.Model.Filter

            $Filter.Name = "private-ip-address"
            $Filter.Value = [string] $IPAddress.privateipaddress
            $Instance = Get-EC2Instance -Filter $Filter
            $InstanceName = $Instance.instances.tags[0].value
            $InstanceName = $InstanceName.Replace(" ", ".")

    }
}

   Set-TrustedHostsFromAmazon