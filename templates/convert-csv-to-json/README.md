Download the template and upload into NiFi instance

### Configuring Processors and Controller Services

***GenerateFlowFile*** 

Configuring `GenerateFlowFile` processor is simple. Just copy below data to `Custom Text` property of GenerateFlowFile Processor

```csv
"id","ident","type","name","latitude_deg","longitude_deg","elevation_ft","continent","iso_country","iso_region","municipality","scheduled_service","gps_code","iata_code","local_code","home_link","wikipedia_link","keywords"
6523,"00A","heliport","Total Rf Heliport",40.07080078125,-74.93360137939453,11,"NA","US","US-PA","Bensalem","no","00A",,"00A",,,
323361,"00AA","small_airport","Aero B Ranch Airport",38.704022,-101.473911,3435,"NA","US","US-KS","Leoti","no","00AA",,"00AA",,,
6524,"00AK","small_airport","Lowell Field",59.947733,-151.692524,450,"NA","US","US-AK","Anchor Point","no","00AK",,"00AK",,,
6525,"00AL","small_airport","Epps Airpark",34.86479949951172,-86.77030181884766,820,"NA","US","US-AL","Harvest","no","00AL",,"00AL",,,
6526,"00AR","closed","Newport Hospital & Clinic Heliport",35.6087,-91.254898,237,"NA","US","US-AR","Newport","no",,,,,,"00AR"
322127,"00AS","small_airport","Fulton Airport",34.9428028,-97.8180194,1100,"NA","US","US-OK","Alex","no","00AS",,"00AS",,,
```

***ConvertRecord***

| Name | Value |
| ---- | ----- |
| Record Reader | `Create a new CSVReader Controller Service` |
| Record Writer | `Create a new JsonRecordWriter Controller Service` |


***CSVReader*** Controller Service

No additional configuration is required, just enable the controller service

***JsonRecordWriter*** Controller Service

No additional configuration is required, just enable the controller service

| Name | Value |
| ---- | ----- |
| Record Reader | `Create a new CSVReader Controller Service` |
| Record Writer | `Create a new JsonRecordWriter Controller Service` |


***LogMessage***

No additional configuration is required