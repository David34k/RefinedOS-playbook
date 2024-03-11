@echo off

echo Adding 7zip

reg add "HKEY_CURRENT_USER\Software\7-Zip\FM\Columns" /v "RootFolder" /t REG_BINARY /d 0100000000000000010000000400000001000000A0000000 /f
reg add "HKEY_CURRENT_USER\Software\7-Zip\Options" /v "ElimDupExtract" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\7-Zip\Options" /v "ContextMenu" /t REG_DWORD /d 124 /f
reg add "HKEY_CURRENT_USER\Software\7-Zip\Options" /v "MenuIcons" /t REG_QWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Classes\.001" /ve /t REG_SZ /d "7-Zip.001" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.7z" /ve /t REG_SZ /d "7-Zip.7z" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.arj" /ve /t REG_SZ /d "7-Zip.arj" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.bz2" /ve /t REG_SZ /d "7-Zip.bz2" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.bzip2" /ve /t REG_SZ /d "7-Zip.bzip2" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.cab" /ve /t REG_SZ /d "7-Zip.cab" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.cpio" /ve /t REG_SZ /d "7-Zip.cpio" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.deb" /ve /t REG_SZ /d "7-Zip.deb" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.dmg" /ve /t REG_SZ /d "7-Zip.dmg" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.fat" /ve /t REG_SZ /d "7-Zip.fat" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.gz" /ve /t REG_SZ /d "7-Zip.gz" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.gzip" /ve /t REG_SZ /d "7-Zip.gzip" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.hfs" /ve /t REG_SZ /d "7-Zip.hfs" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.iso" /ve /t REG_SZ /d "7-Zip.iso" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.lha" /ve /t REG_SZ /d "7-Zip.lha" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.lzh" /ve /t REG_SZ /d "7-Zip.lzh" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.lzma" /ve /t REG_SZ /d "7-Zip.lzma" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.ntfs" /ve /t REG_SZ /d "7-Zip.ntfs" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.rar" /ve /t REG_SZ /d "7-Zip.rar" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.rpm" /ve /t REG_SZ /d "7-Zip.rpm" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.squashfs" /ve /t REG_SZ /d "7-Zip.squashfs" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.swm" /ve /t REG_SZ /d "7-Zip.swm" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.tar" /ve /t REG_SZ /d "7-Zip.tar" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.taz" /ve /t REG_SZ /d "7-Zip.taz" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.tbz" /ve /t REG_SZ /d "7-Zip.tbz" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.tbz2" /ve /t REG_SZ /d "7-Zip.tbz2" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.tgz" /ve /t REG_SZ /d "7-Zip.tgz" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.tpz" /ve /t REG_SZ /d "7-Zip.tpz" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.txz" /ve /t REG_SZ /d "7-Zip.txz" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.vhd" /ve /t REG_SZ /d "7-Zip.vhd" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.wim" /ve /t REG_SZ /d "7-Zip.wim" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.xar" /ve /t REG_SZ /d "7-Zip.xar" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.xz" /ve /t REG_SZ /d "7-Zip.xz" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.z" /ve /t REG_SZ /d "7-Zip.z" /f
reg add "HKEY_CURRENT_USER\Software\Classes\.zip" /ve /t REG_SZ /d "7-Zip.zip" /f
reg add "HKEY_CURRENT_USER\Software\Classes\7-Zip.001" /ve /t REG_SZ /d "001 Archive" /f
reg add "HKEY_CURRENT_USER\Software\Classes\7-Zip.001\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,9" /f
reg add "HKEY_CURRENT_USER\Software\Classes\7-Zip.001\shell" /ve /t REG_SZ /d "" /f
reg add "HKEY_CURRENT_USER\Software\Classes\7-Zip.001\shell\open" /ve /t REG_SZ /d "" /f
reg add "HKEY_CURRENT_USER\Software\Classes\7-Zip.001\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%1\"" /f
echo entries added successfully.
