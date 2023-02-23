function handler($context, $inputs) {
# Original hostname generated during deployment 
$old_name = $inputs.resourceNames[0] 
# Custom properties from design canvas 
$new_name = $inputs.customProperties.newname
# Action inputs required for vCenter Server connectivity 
$vc_URL = $inputs.vcURL
$vc_USR = $context.getSecret($inputs.vcUser)
$vc_PWD = $context.getSecret($inputs.vcPassword)
# Connect to vCenter Server using URL and User credentials
Connect-VIServer -Server $vc_URL -User $vcUser -Password $vc_PWD -force
# Get $old_name vm from Vcenter
$vm = Get-VM $old_name
#notify 
Write-Output ("Found VM object for $old_name")
Write-Output $vm
# Create output entry visible in Action Runs logs
Write-Output ("Setting machine name from " + $old_name + " to " + $new_name)
# rewrite VM name to new name
$vm | Set-VM -Name $new_name -Confirm:$false 
# Get $new_name vm from Vcenter
$vm = Get-VM $new_name
#notify that new_name exists
Write-Output ("Found VM object for $new_name")
Write-Output $vm
# Disconnect from vCenter Server
Disconnect-VIServer -Server $vc_URL -Confirm:$false    
    
}









