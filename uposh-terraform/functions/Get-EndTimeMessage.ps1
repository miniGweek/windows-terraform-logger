Function Get-EndTimeMessage($command) {
    $currentTimeStamp = Get-Date -Format "dd/MM/yyyy hh:mm:ss fff";
    $startMessage = "Command End  - " + $command + " at " + $currentTimeStamp;
    return $startMessage;
}