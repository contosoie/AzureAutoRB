param ([object]$WebHookData)

$WebhookName    =   $WebhookData.WebhookName
$WebhookHeaders =   $WebhookData.RequestHeader
$WebhookBody    =   $WebhookData.RequestBody


$Inputs = ConvertFrom-JSON $webhookdata.RequestBody

$vmname = $inputs.vmname
$OS = $inputs.OS
$publicfacing = $inputs.publicfacing
$machinesize = $inputs.machinesize
$machinetier = $inputs.machinetier
$appid = $inputs.appid
$owneremail = $inputs.owneremail
$cloud = $inputs.cloud

write-output "Deploying Azure VM"
if($cloud -eq "Azure")
{
.\TR_Build_VM.ps1 `
		-VMName $vmname `
		-OS $os `
		-AppId $appid `
		-MachineSize $machinesize `
		-OwnerEmail $owneremail `
		-machinetier $machinetier `
		-publicfacing $publicfacing
}

write-output "Deploying AWS VM"

if($cloud -eq "AWS")
{
   .\TR_Create_AWS_VM.ps1 `
		-VMName $vmname `
		-OS $os `
		-AppId $appid `
		-OwnerEmail $owneremail
}
