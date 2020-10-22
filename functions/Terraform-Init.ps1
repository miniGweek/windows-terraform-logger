Function Terraform-Init() {
       
    $stopwatch = [system.diagnostics.stopwatch]::StartNew()
    
    Get-StartTimeMessage $MyInvocation.MyCommand | Tee-Object -FilePath (Get-UPoshLogFileName) -Append
    
    terraform init | Tee-Object -FilePath  (Get-UPoshLogFileName) -Append
    
    $stopwatch.Stop();
    Get-EndTimeMessage $MyInvocation.MyCommand | Tee-Object -FilePath  (Get-UPoshLogFileName) -Append
    
    "Command duration " + $MyInvocation.MyCommand + " : " + $stopwatch.ElapsedMilliseconds |  Tee-Object -FilePath  (Get-UPoshLogFileName) -Append
}