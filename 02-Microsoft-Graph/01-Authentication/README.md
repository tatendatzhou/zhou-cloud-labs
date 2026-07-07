# Microsoft Graph Authentication

## Overview

In this lab, I learnt about Microsoft Graph authentication. It demonstrates my ability to connect to Microsoft Graph, verify the connection, and disconnect when my work is completed.

## What I Learnt

Before doing anything in Microsoft Graph, you need to authenticate using `Connect-MgGraph`. In most cases, this command alone is not enough. Depending on the task you want to perform, you must connect with the appropriate permission scopes.

For example:

```powershell
Connect-MgGraph -Scopes "User.ReadWrite.All"
```

This scope allows you to create and manage users.

If you only want to read group information, you can use:

```powershell
Connect-MgGraph -Scopes "Group.Read.All"
```

Choosing the correct scope is important because Microsoft Graph only grants the permissions that you request and that have been consented to.

I also learnt that after connecting, I should verify the session by running:

```powershell
Get-MgContext
```

This allows me to confirm:

- I am signed in with the correct account.
- I am connected to the correct Microsoft Entra tenant.
- I have the required permission scopes.

Finally, once I have completed my work, I disconnect from Microsoft Graph to end the session.

```powershell
Disconnect-MgGraph
```