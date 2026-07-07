# User Management

## Overview

In this lab, I learnt the fundamentals of Microsoft Graph user management using PowerShell. I practised creating users, retrieving user information, and understanding the properties required when managing Microsoft Entra users through Microsoft Graph.

## What I Learnt

### Creating a User
I learnt how to create a new user using the `New-MgUser` cmdlet.

While creating a user, I learnt that some properties are mandatory, including:

- `DisplayName`
- `UserPrincipalName`
- `MailNickname`
- `AccountEnabled`
- `PasswordProfile`

Without these required properties, the user cannot be created successfully.

### Retrieving Users
I learnt how to retrieve user information using the `Get-MgUser` cmdlet.

For example:

```powershell
Get-MgUser
```

I also learnt how to retrieve a single user or limit the number of results returned.

### Working with Properties

I learnt that every user returned by Microsoft Graph is an object that contains many properties.

I practised displaying only the information I needed using commands such as:

```powershell
Select-Object
```

and

```powershell
Format-List
```

instead of displaying every available property.

### Using Variables
I also learnt how to store user objects in variables so that they can be reused later in a script.

This makes scripts easier to read and avoids running the same command multiple times.

## Skills Demonstrated
- Connecting to Microsoft Graph
- Creating Microsoft Entra users
- Retrieving user information
- Understanding mandatory user properties
- Working with PowerShell objects
- Using variables in PowerShell