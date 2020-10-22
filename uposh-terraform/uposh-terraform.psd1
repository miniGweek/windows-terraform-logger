@{
  ModuleVersion     = '1.0'
  GUID              = 'aef687fd-059a-4765-bdf0-2a49ca211711'
  NestedModules     = @(
    '.\functions\Set-UPoshTerraformVariables.ps1',
    '.\functions\Get-UPoshLogFileName.ps1',
    '.\functions\Terraform-Init.ps1',
    '.\functions\Terraform-Plan.ps1',
    '.\functions\Terraform-Apply.ps1',
    '.\functions\Terraform-GetUpdate.ps1',
    '.\functions\Get-StartTimeMessage.ps1',
    '.\functions\Get-EndTimeMessage.ps1'

  )
  FunctionsToExport = @('*')
}