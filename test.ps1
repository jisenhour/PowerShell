Function Get-ELBNameFromInstance($InstanceID)
{
    $ELBArray = Get-ELBLoadBalancer

    Foreach($LoadBalancer in $ELBArray)
    {
        $ELBName = $LoadBalancer.LoadBalancerName
        $Instances = $LoadBalancer.Instances
        foreach($instance in $Instances)
        {
            $STRInstance =  $instance.
            if( $STRinstance -eq $InstanceID)
            {
                return $ELBName
                exit
            }
        }
    }


}


 $test = Get-ELBNameFromInstance "i-b8e99e4f"
