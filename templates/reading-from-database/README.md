Download the template and upload into NiFi instance

### Configuring Processors and Controller Services

***ExecuteSQL***

| Name | Value |
| ---- | ----- |
| Database Connection Pooling Service | `Create a new DBCPConnectionPool Controller Service` |
| SQL select query | `SELECT * FROM EMPLOYEE` |


***DBCPConnectionPool*** Controller Service

| Name | Value |
| ---- | ----- |
| Database Connection URL | `jdbc:postgresql://localhost:5432/postgres` |
| Database Driver Class Name | `org.postgresql.Driver` |
| Database Driver Location(s) | `/home/ubuntu/Documents/get-started/nifi-1.21.0/drivers/postgresql-42.2.2.jar` |
| Database User | `postgres` |
| Password | `postgres` |


***ConvertAvroToJSON***

No additional configuration is required

