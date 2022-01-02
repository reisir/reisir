param (
	[CmdletBinding()]
	[Parameter()]
	[Alias("i")]
	$file,
	[Parameter(Mandatory=$false)]
	[Alias("ns", "sn")]
	[Switch]
	$nosubs,
	[Parameter(Mandatory=$false)]
	[Alias("a")]
	[Switch]
	$keepaudio,
	[Parameter(Mandatory=$false)]
	[Alias("d")]
	$dir

)

function Main {

	Write-Host $file
	
	# Defaults
	$sn = ""
	$an = ""

	if($nosubs.IsPresent) {
		$sn = "-sn"
	} else {
		if((Read-Host "Remove subtitles? (y/n)") -in "y", "yes", "") {
			$sn = "-sn"
		}
	}

	if($keepaudio.IsPresent) {
		$an = ""
	} else {
		if((Read-Host "Keep audio? (y/n)") -notin "y", "yes", "") {
			$an = "-an"
		}
	}

	if($file) {
		Convert-File -i $file
	}

}

function Convert-File {
	param (
		[Parameter(Mandatory=$false)]
		[Alias("i")]
		$file
	)

	# Containing folder
	$folder = Split-Path -path $file
	Write-Host "Directory: $folder"

	# Output path
	$o = "$([System.IO.Path]::GetFileNameWithoutExtension($file)).mp4"
	if(-Not (Test-Path -Path "$folder\converted")) {
		New-Item -Path $folder -ItemType "directory" -Name "converted"
	}
	$o = ".\converted\" + $o

	# Defaults
	$ca = "copy"
	$cv = "copy"

	# Get video format
	$videoformat = ffprobe -i $file -loglevel error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1
	if($videoformat -notin "h264", "hevc", "libx264") {
		$cv = "libx264"
	}

	# Get audio format
	$audioformat = ffprobe -i $file -loglevel error -select_streams a:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1
	if($audioformat -notin "aac") {
		$ca = "aac"
	}
	
	Write-Host $videoformat
	Write-Host $cv
	Write-Host $audioformat
	Write-Host $ca
	
	ffmpeg -i $file -c:v $cv -c:a $ca $sn $an -loglevel error -stats $o 

	# Read-Host "Press any key"

}

# https://4sysops.com/archives/validating-file-and-folder-paths-in-powershell-parameters/
#    New-Item -Path $generatedSkinDir -ItemType "directory" -Name "Addons"
# Read-Host "Press any key"

Main