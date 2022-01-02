# %02d means two digits for frame numbers

$sequence = "extract"

# Create palette with transparency
ffmpeg -i $sequence%02d.png -vf palettegen=reserve_transparent=1 palette.png

# Create .gif with palette, with alpha_threshold
ffmpeg -framerate 40 -i $sequence%02d.png -i palette.png -lavfi paletteuse=alpha_threshold=128 -gifflags -offsetting out.gif