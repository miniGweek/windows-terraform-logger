Function Terraform-Init() {
       
    $stopwatch = (Start-UPoshTerraformLogging)

    terraform init | Tee-Object -FilePath  (Get-UPoshLogFileName) -Append
    
    Stop-UPoshTerraformLogging $stopwatch
   
}