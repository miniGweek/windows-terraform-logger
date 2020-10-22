Function Terraform-GetUpdate {
    Param(
        [Parameter(
            Mandatory = $False,
            ValueFromRemainingArguments = $true,
            Position = 0
        )][string[]]
        $listArgs
    )
    
    $stopwatch = [system.diagnostics.stopwatch]::StartNew()

    Get-StartTimeMessage $MyInvocation.MyCommand | Tee-Object -FilePath (Get-UPoshLogFileName) -Append

    terraform get -update | Tee-Object -FilePath (Get-UPoshLogFileName) -Append
    Terraform-Init

    $stopwatch.Stop();
    Get-EndTimeMessage $MyInvocation.MyCommand | Tee-Object -FilePath (Get-UPoshLogFileName) -Append

    "Command duration " + $MyInvocation.MyCommand + " : " + $stopwatch.ElapsedMilliseconds |  Tee-Object -FilePath (Get-UPoshLogFileName) -Append
}