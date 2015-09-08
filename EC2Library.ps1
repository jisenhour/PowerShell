function Get-EC2Tags () 
#takes an instance ID and returns all tag keys, and values
{
    $InstanceID = $args[0]
    $Instance = Get-EC2Instance $InstanceID
    $Instance.Instances | Select-Object  @{Name='Key'; Expression={ [string]::Join(", ", $_.Tag.Key) } }, @{Name='Value'; Expression={ [string]::Join(", ", $_.Tag.Value) } }
}


function Get-EC2LaunchTime()
#Takes an instance ID, and returns launch time
{
    $InstanceID = $args[0]
    $Instance = Get-EC2Instance $InstanceID
    $Instance.Instances | Select-Object LaunchTime
}


function Get-EC2IPData()
#Takes an instance id and returns private, and public IP addresses
{
    $InstanceID = $args[0]
    $Instance = Get-EC2Instance $InstanceID 
    $Instance.Instances | Select-Object  PrivateIPAddress, PublicIPAddress
}

function Get-EC2InstancesInSubnet()
#Takes a subnet ID and returns the name and id of all instances in it
{
    $SubnetID = $args[0]
    (Get-EC2instance).Instances | Where-Object{$_.SubnetId -eq $SubnetID} | Select-Object InstanceID,  @{Name='Key'; Expression={ [string]::Join(", ", $_.Tag.Key) } }, @{Name='Value'; Expression={ [string]::Join(", ", $_.Tag.Value) } }
}



