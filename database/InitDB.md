# PROCESO DE INSTALACIÓN Y EJECUCIÓN DE TABLAS EN MYSQL

## Instalar MySQL en codespace de github
```bash
sudo apt update
sudo apt install mysql-server
```

## Verificar estado de MySQL
```bash
sudo service mysql status
```

## Iniciar MySQL
```bash
sudo service mysql start
```

# Para ejecutar comandos de MySQL
## Ingresamos a MySQL
```bash
sudo mysql 
```

## Dentro podemos Ejecutar cualquier comando
```bash
CREATE DATABASE IF NOT EXISTS aurexfinance;
USE aurexfinance;
```

## Para salir
```bash
exit
```

# EJECUTAR SCRIPT DE CREACIÓN DE BASE DE DATOS Y TABLAS AUTOMÁTICO
```bash
# Opción A: Con sudo (funciona)
sudo mysql aurexfinance < database/schema.sql

# Opción B: Sin sudo (recomendado)
mysql -h 127.0.0.1 -u root aurexfinance < database/schema.sql
```

## VERIFICAR DATOS Y COMPROBAR FUNCIONAMIENTO
```bash
# Ver todas las tablas
mysql -h 127.0.0.1 -u root aurexfinance -e "SHOW TABLES;"

# Ver estructura de una tabla
mysql -h 127.0.0.1 -u root aurexfinance -e "DESCRIBE users;"
```
