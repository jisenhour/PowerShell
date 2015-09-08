$URI = "http://10.2.31.135/DataCatalogService.svc?wsdl"
$WebServiceObject = New-WebServiceProxy -Uri $URI 
$ScreenStatusArray = Get-Content C:\DefScreenStatus\ScreenStatusValuesLT.txt
foreach ($ScreenStatus in $ScreenStatusArray) 
{
    $WebServiceObject.BuildDefaultScreenStatus($ScreenStatus) 
    $ScreenStatus

}