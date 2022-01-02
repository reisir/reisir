param (
	# Disable audio
	[Parameter(Mandatory=$false)]
	[Alias("mute", "m", "an", "na")]
	[Switch]
	$noaudio,
	# Quality
	[Parameter(Mandatory=$false)]
	[Alias("q")]
	[int]
	$quality = 45
)

$vids = Get-ChildItem -file

foreach($vid in $vids) {
	$o = "$([System.IO.Path]::GetFileNameWithoutExtension($vid)).webm"
	Write-Host $o
	ffmpeg -i $vid -an:$noaudio.IsPresent -c:v libvpx-vp9 -crf 45 -b:v 0 $o
}