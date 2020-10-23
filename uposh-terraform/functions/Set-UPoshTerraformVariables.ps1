function Set-UPoshTerraformVariables() {
    $env:uposhtfvar_tflogdirpath = $(If ($env:uposhtfvar_tflogdirpath.Length -gt 0) { $env:uposhtfvar_tflogdirpath } Else {
            # set your path here
        });
}