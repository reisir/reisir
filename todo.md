### Copy Taran's AHK scripts and make ae.ahk

- Tap to send S (scale)
- Hold and move mouse to change scale
- Shift + S, script clicks on the scale property

### List of things AMV editors need to know

1.  VEGAS RESAMPLING
2.  Recontainering vs Re-encoding

### Backup liked youtube videos

- ifttt is recording everything I like to google sheets
- 2000 vids per sheet
- 4 sheets (so far)
- ~ 8000 vids

- vid average length 10min
- average vid size 350MB

- 8000 \* 350MB = 2.4TB

### ahk script for numpad box drawing

```
    ╔════════╦════════╦════════╗
    ║        ║        ║        ║
    ╠════════╬════════╬════════╣
    ║        ║        ║        ║
    ║        ║        ║        ║
    ║        ║        ║        ║
    ║        ║        ║        ║
    ╠════════╬════════╬════════╣
    ║        ║        ║        ║
    ║        ║        ║        ║
    ║        ║        ║        ║
    ╚════════╩════════╩════════╝
```

## AMV pack 2

AMV pack is terribly outdated. Contains avisynth and friends, programs to rip physical media etc. A script to install only the modern necessities would be nice.

### Features

- Provide choices to users
- Use WinGet / Homebrew (?)
  - Sorry no win7 support (maybe chocolatey would work)

### Necessary packages (still skippable)

- Video player
  - VLC
  - MPV
- Re-encoder
  - ffmpeg (with scripts)
  - Handbrake
  - AMVtool
- Re-container
  - Note about how OBS can re-contain .mkv to .mp4
  - ffmpeg (with scripts)
  - AMVtool
  - XMedia Recode (doesn't seem to be developed actively, breaks on h.265 and/or 10bit)
- Codecs
  - utvideo (optional)
- Torrent client
  - Note about how uTorrent sucks, shows ads and mines bitcoin
  - Deluge
  - Transmission
  - qBitTorrent
- Image Editor
  - Note about photopea
  - paint.net
  - GIMP (ugh)

### Misc. script things

I don't know if all of these are possible.

General:

- Enable file extensions in explorer

After Effects plugins:

- FXConsole
- RepositionAnchorPoint (maybe my remix version)
- Note about other good free plugins like ease and wizz

Vegas Defaults and preferences:

- Disable resampling by default in Vegas 14+
- Set the default framerate to 23.976
- Disable the new buggy render engine .dll
  - And an option to re-enable it if it causes problems for people

Other program specific things?
