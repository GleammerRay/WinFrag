@echo off
chcp 65001 >nul
::::
::::  [[[[[[[[[[[[[[[[[[[[     WinFrag - Disk Fragmenter Utility     ]]]]]]]]]]]]]]]]]]]]
::::
::::          ,.-·^*ª'` ·,                 ,.  '           ,·'´¨;.  '                   
::::       .·´ ,·'´:¯'`·,  '\‘            /   ';\           ;   ';:\           .·´¨';\   
::::     ,´  ,'\:::::::::\,.·\'         ,'   ,'::'\         ;     ';:'\      .'´     ;:'\  
::::    /   /:::\;·'´¯'`·;\:::\°      ,'    ;:::';'        ;   ,  '·:;  .·´,.´';  ,'::;'  
::::   ;   ;:::;'          '\;:·´      ';   ,':::;'        ;   ;'`.    ¨,.·´::;'  ;:::;   
::::  ';   ;::/      ,·´¯';  °        ;  ,':::;' '        ;  ';::; \*´\:::::;  ,':::;‘   
::::  ';   '·;'   ,.·´,    ;'\         ,'  ,'::;'          ';  ,'::;   \::\;:·';  ;:::; '   
::::  \'·.    `'´,.·:´';   ;::\'       ;  ';_:,.-·´';\‘   ;  ';::;     '*´  ;',·':::;‘     
::::   '\::\¯::::::::';   ;::'; ‘     ',   _,.-·'´:\:\‘  \´¨\::;          \¨\::::;      
::::     `·:\:::;:·´';.·´\::;'         \¨:::::::::::\';   '\::\;            \:\;·'       
::::         ¯      \::::\;'‚          '\;::_;:-·'´‘       '´¨               ¨'         
::::                  '\:·´'              '¨                                            
::::
::::                       • https://github.com/GleammerRay/WinFrag •
::::
for /f "delims=: tokens=*" %%A in ('findstr /b :::: "%~f0"') do @echo(%%A
for /F "tokens=*" %%I in (winfrag.cfg) do set %%I
setlocal enabledelayedexpansion
echo ================== Current settings ==================
echo Target drive letter: !drive_letter!
echo File count: !file_count!
echo (Increase for more fragmentation, will take more time)
endlocal
echo ====== Press [Ctrl + C] to cancel fragmentation. ======
pause
setlocal enabledelayedexpansion
set "folder_path=!drive_letter!:\WinFrag"
if exist "!folder_path!" (
    echo Folder exists, cleaning up...
    rd /s /q "!folder_path!"
)
mkdir "!folder_path!"
echo Creating files...
for /L %%i in (1,1,!file_count!) do (
    copy NUL "!folder_path!\file%%i.txt" >nul
)
echo Disk fragmentation complete!
echo Delete "!folder_path!" to undo fragmentation.
endlocal
pause
