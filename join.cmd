@echo off

if [%1]==[] goto usage
if [%2]==[] goto usage

set bin=C:\Users\fireo\Downloads\ffmpeg-2022-07-21-git-f7d510b33f-full_build\bin

(for %%i in (%1) do @echo file '%%i') > chapters.txt

"%bin%\ffmpeg.exe" -f concat -safe 0 -i chapters.txt -c copy -map 0:v -map 0:a -map 0:d %2
echo Done!
goto :eof

:usage
@echo Usage: join.cmd ^<in*.mp4^> ^<out.mp4^>
exit /B 1