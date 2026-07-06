# ============================================================
# Script Name : VerifyConnection.ps1
# Description : Displays information about the current Microsoft Graph session.
#
# Requirements:
# - Active Microsoft Graph connection
#
# Author      : Tatenda Zhou
# ============================================================
#
#Verify Connection
Get-MgContext |
Select-Object Account,Scopes,AuthType |
Format-Table -AutoSize