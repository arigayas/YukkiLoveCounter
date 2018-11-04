@echo off
if not exist Win32\Release\YukkiLoveCounter.exe (
    echo 32.txt  is Not Found.
) else (
    copy Win32\Release\YukkiLoveCounter.exe YukkiLoveCounter.exe
    "C:\Program Files\7-Zip\7z.exe" a YukkiLoveCounter_%1_arigayas.zip YukkiLoveCounter.exe
    del YukkiLoveCounter.exe
)

if not exist Win64\Release\YukkiLoveCounter.exe (
    echo 64.txt  is Not Found.
) else (
    copy Win64\Release\YukkiLoveCounter.exe YukkiLoveCounter_64.exe
    "C:\Program Files\7-Zip\7z.exe" a YukkiLoveCounter_%1_arigayas.zip YukkiLoveCounter_64.exe
    del YukkiLoveCounter_64.exe
)

if not exist YukkiLoveCounter_Readme.txt (
    echo YukkiLoveCounter_Readme.txt  is Not Found.
) else (
    "C:\Program Files\7-Zip\7z.exe" a YukkiLoveCounter_%1_arigayas.zip YukkiLoveCounter_Readme.txt ScreenShot
)

echo âΩÇ©ÉLÅ[ÇâüÇ∑Ç∆èIóπÇµÇ‹Ç∑
pause
