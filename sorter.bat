@echo off
setlocal enabledelayedexpansion

:: Process files
for %%F in (*.*) do (
    :: Get file extension
    set "ext=%%~xF"
    set "ext=!ext:~1!"  :: Remove the dot

    :: Check for files without extensions
    if "!ext!"=="" (
        set "ext=no_extension"
    )

    :: Create a folder for the file type (if it doesn't exist)
    if not exist "!ext!" (
        mkdir "!ext!"
    )

    :: Move the file to the corresponding folder
    move "%%F" "!ext!\" >nul
)

echo Process completed. Files have been sorted into folders.
pause
