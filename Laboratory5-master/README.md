# CMPT 310 Laboratory 5

The purpose of this lab is to gain experience creating tables in SQL from a relational schema. Your task is to reproduce a schema in a MySQL database using SQL DDL statements.  Finally, you will write the necessary INSERT statements to add data to the database.

## Cloning

Start your lab by cloning this repository:

```
$> git clone https://submit.cs.kingsu.ca/PATH/TO/YOUR/REPO.git
```

**Note**: The URL for your repo can be found at https://submit.cs.kingsu.ca.

## Starting
### BEFORE RUNNING THE LAB
Before running the lab in `docker`, change the MySQL password in the **docker-compose.yml** file (on line 23) as shown below,

```
# YOU NEED TO SET THIS PASSWORD (you can use pwgen)
- MYSQL_PASSWORD=REPLACE_ME
```

You can use `pwgen` command to generate a single secure 16 characters long random password:

```
$> pwgen -s -N 16 16
```

### Building

```
$> docker-compose up -d
```

**Note**: `docker-compose up` builds, (re)creates, starts, and attaches to containers for a service. The first time it is run, it takes some time to complete.

### Rebuilding
To rebuild the project, and reinitialize the database, use the command:

```
$> docker-compose down
$> docker-compose up -d
```

This will rebuild the docker containers and the database will be recreated from the `.sql` file(s).

**_Note_** Any and all changes made to the database **before** rebuilding will be lost, _i.e._ your project will have a clean install.

### DB Initialization
Configure your MySQL environment to store your login credentials:

```
$> mysql_config_editor set --login-path=Lab5 --host=127.0.0.1 --user=cmpt310 --password
```

and enter your password (the same one you generated above).

You can enter the MySQL console with the following command:

```
$> mysql --login-path=Lab5
```

### Running DB Scripts

You can run your `lab5.sql` script in two ways:

#### MySQL Console
```
mysql> SOURCE src/sql/lab5.sql
```

#### From the Terminal
```
$> mysql --login-path=Lab5 Lab5 < src/sql/lab5.sql
```

### Closing `docker`

```
$> docker-compose down
```

