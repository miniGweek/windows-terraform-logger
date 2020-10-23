Function Terraform-GetUpdate {
    Param(
        [Parameter(
            Mandatory = $False,
            ValueFromRemainingArguments = $true,
            Position = 0
        )][string[]]
        $listArgs
    )

    $stopwatch = (Start-UPoshTerraformLogging)

    terraform get -update | Tee-Object -FilePath (Get-UPoshLogFileName) -Append
    Terraform-Init

    Stop-UPoshTerraformLogging $stopwatch
}