# Location to place in: ~\Documents\PowerShell

$ESC = [char]27

function Prompt
{
    $LocationName = (Get-Item .).Name

    if ((Get-Location).Path -eq "/home/$($env:UserName)")
    {
        $LocationName = "~"
    }

    $UserAtDomain = ""
    if ($env:COMPUTERNAME -ne $env:USERDOMAIN)
    {
        $UserAtDomain = $env:USERDOMAIN + "\"
    }

    "$ESC[38;2;255;0;200m[" + $env:COMPUTERNAME + "]38;2;255;200;0m[" + $UserAtDomain + $env:UserName + "]$ESC[0m " + $LocationName + " > "
}