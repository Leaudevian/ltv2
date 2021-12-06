# QBCore Database
In order to have to QBCore server, you will need a database. There are multiple databases but amongst the most well known are HeidiSQL, MySQL, and MariaDB.

## HeidiSQL
If you plan to use HeidiSQL which is the most well known in the FiveM community, you will need [**XAMPP**](https://www.apachefriends.org/download.html).

1) Once downloaded XAMPP. Download [**HeidiSQL**](https://www.heidisql.com/download.php) and run it.
2) Open XAMPP and press on the MySQL box. Once checked, proceed to the following step.
3) Open HeidiSQL, click the green circle with plus sign and name it something (doesn't matter what). Click open, in an empty space in the left pane, right click and highlight "Create New" and select database, name it something (doesn't matter what) but you will need the name of this later!
4) Assuming you have gmattimysql already installed, you to your resources folder and open gmattimsql. After that, find the file named `config.json`. Open it and modify the following with your database information.
```json
{
    "user": "root",
    "password": "password",
    "host": "localhost",
    "port": 3306,
    "database": "ghmattimysql"
}
```
Now open your `server.cfg` file. If you find the following code on it, delete it if your not going to use that method, else delete the `config.json` file from gmattimsql.
```cfg
# Database Connection String
set mysql_connection_string "mysql://user:password@host/database?debug=true&charset=utf8mb4"
```