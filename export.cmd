@echo off

if [%1]==[] goto usage
if [%2]==[] goto usage

set bin=C:\Users\fireo\Downloads\ffmpeg-2022-07-21-git-f7d510b33f-full_build\bin

(for %%i in (%1) do @echo file '%%i') > chapters.txt

"%bin%\ffmpeg.exe" -hwaccel nvdec -f concat -i chapters.txt -filter:v "crop=3840:2160" -c:v hevc_nvenc -b:v 100M %2
echo Done!
goto :eof

:usage
@echo Usage: export.cmd ^<in*.mp4^> ^<out.mp4^>
exit /B 1