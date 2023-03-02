# TODO - install check winget

$Software = @(
    'firefox'
    'thunderbird'
    'vscode'
    'brave'
    'discord'
    # Add for wps office as it should have also ID provided (so many options)
)

$SoftwareSettings = @{}

Foreach($AppName in $Software) {
    if ($AppName in $SoftwareSettings) {
        # Make better for different settings in time
        winget install $AppName --silent --source winget --id $SoftwareSettings[$AppName].Id
    } else {
        winget install $AppName --silent --source winget
    }
}
