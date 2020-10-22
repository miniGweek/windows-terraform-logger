# windows-terraform-logger

## Description
- To log all terraform commands and their outputs to a flat file for traceability and checking later. Terraform trace is too verbose, this logging will log whatever you see on the console.
Uses powershell modules and profile to achieve it.

## Steps to configure it

  1. 
  Set the log file path directory inside `Set-UPoshTerraformVariables.ps1`. Should look something like `$env:uposhtfvar_tflogdirpath = "D:\Logs\"`
  2. 