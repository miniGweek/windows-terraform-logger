function Get-UPoshLogFileName() {
    $currentDate = Get-Date -Format "dd-MM-yyyy";
    return $env:uposhtfvar_tflogdirpath + $currentDate + ".log";
}