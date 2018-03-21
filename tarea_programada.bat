@echo off
SchTasks /create /SC DAILY /TN Backup_1er_turno /TR C:\rclone\BackupSQLtoDrive\correr_invisible.bat /ST 09:00
SchTasks /create /SC DAILY /TN Backup_2do_turno /TR C:\rclone\BackupSQLtoDrive\correr_invisible.bat /ST 16:00
pause
exit