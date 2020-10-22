Function Get-StartTimeMessage($command) {
   
    $currentTimeStamp = Get-Date -Format "dd/MM/yyyy hh:mm:ss fff";
    $startMessage = "Command Start - " + $command + " at " + $currentTimeStamp;
    return $startMessage;
}