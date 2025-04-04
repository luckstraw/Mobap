# Lab 2

**Flutter CRUD App with MySQL and PHP**

## Output

<div align="center">
  <img src="/assets/Output.png" alt="Phone Screen" width="500">
</div>

<div align="center">
  <img src="/assets/Output2.png" alt="Database" width="300">
</div>

## How to run

1. Move the [backend](/backend/) to your `C:\xampp\htdocs`

2. Start the **Apache** and **MySQL** in your **XAMPP** Control Panel and go to `http://localhost/phpmyadmin/` and 
create a database mine was `mobap_lab2_db` but you can change it if you want just change the variable in the [db.php](/backend/server/db.php) 

3. Create a table and sample in the **SQL** tab copy the [database.sql](/backend/database.sql) and paste it then click Go

4. Modified the IP adress in [auth_service.dart](/lib/services/auth_service.dart) to your IP adress, You can check your IP adress by `ipconfig` if you're on windows

```bash
ipconfig
```
after running the scripts look for IPv4 (e.g., `192.168.x.x`, PS. it might be different if you're using phone or emulator)

5. Connect the device and run the program:
```bash
flutter run
```
