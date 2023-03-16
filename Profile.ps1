# FOR PS 7.3 (a.k.a. - Powershell)
# For example, the PowerShell console supports the following basic profile files. The profiles are listed in precedence order. The first profile has the highest precedence.
#
#     All Users, All Hosts
#         Windows - $PSHOME\Profile.ps1
#         Linux - /usr/local/microsoft/powershell/7/profile.ps1
#         macOS - /usr/local/microsoft/powershell/7/profile.ps1
#     All Users, Current Host
#         Windows - $PSHOME\Microsoft.PowerShell_profile.ps1
#         Linux - /usr/local/microsoft/powershell/7/Microsoft.Powershell_profile.ps1
#         macOS - /usr/local/microsoft/powershell/7/Microsoft.Powershell_profile.ps1
#     Current User, All Hosts
#         Windows - $HOME\Documents\PowerShell\Profile.ps1
#         Linux - ~/.config/powershell/profile.ps1
#         macOS - ~/.config/powershell/profile.ps1
#     Current user, Current Host
#         Windows - $HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
#         Linux - ~/.config/powershell/Microsoft.Powershell_profile.ps1
#         macOS - ~/.config/powershell/Microsoft.Powershell_profile.ps1


# FOR PS 5.1 (a.k.a. - Windows Powershell)
# For example, the $PROFILE variable has the following values in the Windows PowerShell console.
#
#     Current User, Current Host - $PROFILE
#     Current User, Current Host - $PROFILE.CurrentUserCurrentHost
#     Current User, All Hosts - $PROFILE.CurrentUserAllHosts
#     All Users, Current Host - $PROFILE.AllUsersCurrentHost
#     All Users, All Hosts - $PROFILE.AllUsersAllHosts



$ESC = [char]27

function Prompt {
    $LocationName = (Get-Item .).Name

    if ((Get-Location).Path -in "/home/$($env:UserName)", "C:\Users\$($env:UserName)") {
        $LocationName = "~"
    }

    $UserAtDomain = ""
    if ($env:COMPUTERNAME -ne $env:USERDOMAIN) {
        $UserAtDomain = $env:USERDOMAIN + "\"
    }

    # $PSVersionTable.PSVersion.Patch - might add for PS 7.3 as for PS 5.1 it does not exist
    "$ESC[38;2;0;204;34m[$($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor)]$ESC[38;2;255;0;200m[" + $UserAtDomain + $env:UserName + "]$ESC[0m " + $LocationName + " > "
}