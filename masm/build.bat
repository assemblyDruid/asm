@echo off
set projectName=01

\masm32\bin\ml.exe /c /Zd /coff %projectName%.asm
\masm32\bin\Link.exe /SUBSYSTEM:CONSOLE %projectName%.obj
%projectName%.exe
echo.
echo [ END ]
