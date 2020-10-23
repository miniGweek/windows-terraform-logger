function Start-UPoshTerraformLogging() {
   
    $callstack = Get-PSCallStack;
    $callerFunction = $callstack[1].FunctionName;
    $currentDir = Get-Location

    $stopwatch = [system.diagnostics.stopwatch]::StartNew()

    "Command running in directory " + $currentDir.Path | Tee-Object -FilePath (Get-UPoshLogFileName) -Append
    
    Get-StartTimeMessage $callerFunction | Tee-Object -FilePath (Get-UPoshLogFileName) -Append

    return $stopwatch
}

function Stop-UPoshTerraformLogging($stopwatch) {
    
    $callstack = Get-PSCallStack;
    $callerFunction = $callstack[1].FunctionName;
    $currentDir = Get-Location

    Get-EndTimeMessage $callerFunction | Tee-Object -FilePath  (Get-UPoshLogFileName) -Append
    
    "Command finished in directory " + $currentDir.Path | Tee-Object -FilePath (Get-UPoshLogFileName) -Append

    "Command duration " + $callerFunction + " : " + $stopwatch.ElapsedMilliseconds |  Tee-Object -FilePath  (Get-UPoshLogFileName) -Append
}