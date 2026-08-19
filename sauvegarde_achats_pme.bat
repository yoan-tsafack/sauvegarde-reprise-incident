@echo off
set PGPASSWORD=Mon_de_passe
"C:\Program Files\PostgreSQL\18\bin\pg_dump.exe" ^
-U postgres ^
-h localhost ^
-F c ^
-f "D:\Projet General\Projet SQL\sauvegardes_achats_pme\achats_pme_%date:~-4,4%%date:~-7,2%%date:~-10,2%.backup" ^
achats_pme
echo Sauvegarde terminee.
pause