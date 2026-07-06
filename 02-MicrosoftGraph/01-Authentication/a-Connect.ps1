# ============================================================
# Script Name : Connect.ps1
# Description : Connects to Microsoft Graph using delegated permissions.
#
# Requirements:
# - Microsoft Graph PowerShell SDK installed
# - Internet connection
# - Valid Microsoft 365 account
#
#
# Author      : Tatenda Zhou
# ============================================================
#
#Connect to Microsoft Graph
Connect-MgGraph `
-Scopes User.ReadWrite.All, Group.ReadWrite.All
