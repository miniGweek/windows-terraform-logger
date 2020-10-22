Function Terraform-Plan {
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

    terraform plan $listArgs | Tee-Object -FilePath (Get-UPoshLogFileName) -Append

    $stopwatch.Stop();
    Get-EndTimeMessage $MyInvocation.MyCommand  | Tee-Object -FilePath (Get-UPoshLogFileName) -Append

    "Command duration " + $MyInvocation.MyCommand + " : " + $stopwatch.ElapsedMilliseconds |  Tee-Object -FilePath (Get-UPoshLogFileName) -Append
}