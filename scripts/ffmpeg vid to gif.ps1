ffmpeg -i input.mp4 -vf "fps=23.976,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 output.gif
