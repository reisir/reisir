
Set-Location -Path $PSScriptRoot

Get-ChildItem -Filter *.mp4 | 
Foreach-Object {

    $ext = $_.Extension
    $name = $_.Name
    $match = Select-String ".*?0*(\d*)\." -InputObject $name
    $n = $match.Matches.Groups[1].value

    $newName = "$n$ext"

    Rename-Item $name -NewName $newName

}
