Param(
  [Parameter(Mandatory=$true)]
  [ValidateSet("Start", "Stop")]
  [String]$Action,

  [Parameter(Mandatory=$true)]
  [String]$Subscription,

  [Parameter(Mandatory=$true)]
  [String]$ResourceGroupName,

  [Parameter(Mandatory=$true)]
  [String]$ClusterName
)

# Ensures you do not inherit an AzContext in your runbook
Disable-AzContextAutosave -Scope Process | Out-Null

# Set AzureContext
try {
  $AzureContext = (Connect-AzAccount -Identity).context
} catch {
  Write-Output "There is no system-assigned user identity. Aborting.";
  exit
}

$AzureContext = Set-AzContext -Subscription $Subscription -DefaultProfile $AzureContext -ErrorAction Stop

# Stop or start the target cluster

If ($Action -eq "Stop") {
	Stop-AzAksCluster -ResourceGroupName $ResourceGroupName -Name $ClusterName -NoWait
} ElseIf ($Action -eq "Start") {
	Start-AzAksCluster -ResourceGroupName $ResourceGroupName -Name $ClusterName -NoWait
}
