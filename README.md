# Stop/Start AZ AKS Cluster

Azure automation account powershell runbook to start and stop AKS clusters on a schedule

## Setup
---

1. Login to the [azure portal](https://portal.azure.com)
2. Navigate to automation accounts
3. Select create
![automation_account_create](./docs/images/1.png)
4. Make sure system assigned is ticked
![automation_account_create](./docs/images/2.png)
5. Once create add a new runbook
![automation_account_create](./docs/images/3.png)
6. Copy the contents of [runbook.ps1](./runbook.ps1) into the code editor
![automation_account_create](./docs/images/4.png)
7. Setup schedules to start and stop your clusters
![automation_account_create](./docs/images/5.png)
8. To start the cluster user `Start` and to stop use `Stop`.
![automation_account_create](./docs/images/6.png)
9. Ensure the automation account managed identity has permission to manage cluster power
