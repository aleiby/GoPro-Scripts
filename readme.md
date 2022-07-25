GoPro Chapter Combine and Crop

This simple script uses ffmpeg to concat multiple split videos (i.e. chapters) into a single video for uploading to YouTube.
It also crops the output to 16:9.

Requirements: Download ffmpeg and update the script to point to the correct path.
https://ffmpeg.org/download.html

Usage: export.cmd <in*.mp4> <out.mp4>
Specify the input files (using wildcards) and output filename.

Details:
The script first uses the input pattern to generate a chapters.txt containing the names of each file to feed to ffmpeg.
Then it runs ffmpeg with the following options.

-hwaccel nvdec : Use hardware decode when reading the videos (assumes nvidia hardware).
-f concat : Concatenate (i.e. join) all of the videos into a single output.
-i chapters.txt : Read chapters.txt to find the input filenames (see above).
-filter:v "crop=3840:2160" : Crop the output to 16:9 @ 4k resolution.
-c:v hevc_nvenc : Use Nvidia HEVC to encode the output video.
-b:v 100M : Use 100,000 kbits/s bitrate for encoding.

Alternate options:
-c copy : Stream copy rather than re-encode.
-map 0:v -map 0:a -map 0:d : Maps video, audio, and data tracks to be copied from each input video to output.  By default ffmpeg strips the data track which contains metadata (e.g. gryo).