param (
	# Disable subtitles
	[Parameter(Mandatory=$false)]
	[Alias("ns", "sn")]
	[Switch]
	$nosubs,
	# Disable audio
	[Parameter(Mandatory=$false)]
	[Alias("mute", "m", "an", "na")]
	[Switch]
	$noaudio

)

$vids = Get-ChildItem -file

foreach($vid in $vids) {
	$o = "$([System.IO.Path]::GetFileNameWithoutExtension($vid)).mp4"
	Write-Host $o
	ffmpeg -i $vid -an:$noaudio.IsPresent -sn:$nosubs.IsPresent -c:v copy $o
}
