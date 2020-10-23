Function Terraform-Plan {
    Param(
        [Parameter(
            Mandatory = $False,
            ValueFromRemainingArguments = $true,
            Position = 0
        )][string[]]
        $listArgs
    )
    
    $stopwatch = (Start-UPoshTerraformLogging)

    terraform plan $listArgs | Tee-Object -FilePath (Get-UPoshLogFileName) -Append

    Stop-UPoshTerraformLogging $stopwatch
}