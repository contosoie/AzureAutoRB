param ([string]$vmname,[string]$location,[string]$resourcegroup)

write-output "Deploying AV"
Set-AzureRmVMExtension -ResourceGroupName $resourcegroup -VMName $VMname -Name 'SymantecAV' -Publisher 'Symantec' -ExtensionType 'SymantecEndpointProtection' -TypeHandlerVersion '12.1' -Location $location 