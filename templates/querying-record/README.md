Download the template and upload into NiFi instance

### Configuring Processors and Controller Services


***GenerateFlowFile*** 

Configuring `GenerateFlowFile` processor is simple. Just copy below data to `Custom Text` property of GenerateFlowFile Processor

```json
[ 
{
  "id" : 6523,
  "ident" : "00A",
  "type" : "heliport",
  "name" : "Total Rf Heliport",
  "latitude_deg" : 40.0708,
  "longitude_deg" : -74.93360137939453,
  "elevation_ft" : 11,
  "continent" : "North America",
  "iso_country" : "US",
  "iso_region" : "US-PA",
  "municipality" : "Bensalem",
  "scheduled_service" : "no",
  "gps_code" : "00A",
  "iata_code" : null,
  "local_code" : "00A",
  "home_link" : null,
  "wikipedia_link" : null,
  "keywords" : null
}
, {
  "id" : 323361,
  "ident" : "00AA",
  "type" : "small_airport",
  "name" : "Aero B Ranch Airport",
  "latitude_deg" : 38.70402,
  "longitude_deg" : -101.473911,
  "elevation_ft" : 3435,
  "continent" : "NA",
  "iso_country" : "US",
  "iso_region" : "US-KS",
  "municipality" : "Leoti",
  "scheduled_service" : "yes",
  "gps_code" : "00AA",
  "iata_code" : null,
  "local_code" : "00AA",
  "home_link" : null,
  "wikipedia_link" : null,
  "keywords" : null
}, {
  "id" : 6524,
  "ident" : "00AK",
  "type" : "small_airport",
  "name" : "Lowell Field",
  "latitude_deg" : 59.947735,
  "longitude_deg" : -151.692524,
  "elevation_ft" : 450,
  "continent" : "NA",
  "iso_country" : "US",
  "iso_region" : "US-AK",
  "municipality" : "Anchor Point",
  "scheduled_service" : "yes",
  "gps_code" : "00AK",
  "iata_code" : null,
  "local_code" : "00AK",
  "home_link" : null,
  "wikipedia_link" : null,
  "keywords" : null
}, {
  "id" : 6525,
  "ident" : "00AL",
  "type" : "small_airport",
  "name" : "Epps Airpark",
  "latitude_deg" : 34.8648,
  "longitude_deg" : -86.77030181884766,
  "elevation_ft" : 820,
  "continent" : "NA",
  "iso_country" : "US",
  "iso_region" : "US-AL",
  "municipality" : "Harvest",
  "scheduled_service" : "no",
  "gps_code" : "00AL",
  "iata_code" : null,
  "local_code" : "00AL",
  "home_link" : null,
  "wikipedia_link" : null,
  "keywords" : null
}, {
  "id" : 6526,
  "ident" : "00AR",
  "type" : "closed",
  "name" : "Newport Hospital & Clinic Heliport",
  "latitude_deg" : 35.6087,
  "longitude_deg" : -91.254898,
  "elevation_ft" : 237,
  "continent" : "NA",
  "iso_country" : "US",
  "iso_region" : "US-AR",
  "municipality" : "Newport",
  "scheduled_service" : "no",
  "gps_code" : null,
  "iata_code" : null,
  "local_code" : null,
  "home_link" : null,
  "wikipedia_link" : null,
  "keywords" : "00AR"
}, {
  "id" : 322127,
  "ident" : "00AS",
  "type" : "small_airport",
  "name" : "Fulton Airport",
  "latitude_deg" : 34.942802,
  "longitude_deg" : -97.8180194,
  "elevation_ft" : 1100,
  "continent" : "NA",
  "iso_country" : "US",
  "iso_region" : "US-OK",
  "municipality" : "Alex",
  "scheduled_service" : "yes",
  "gps_code" : "00AS",
  "iata_code" : null,
  "local_code" : "00AS",
  "home_link" : null,
  "wikipedia_link" : null,
  "keywords" : null
},{
  "id" : 322128,
  "ident" : "00AT",
  "type" : "medium_airport",
  "name" : "Hilton Airport",
  "latitude_deg" : 31.492802,
  "longitude_deg" : -94.1880194,
  "elevation_ft" : 1100,
  "continent" : "NA",
  "iso_country" : "US",
  "iso_region" : "US-OK",
  "municipality" : "Hilt",
  "scheduled_service" : "no",
  "gps_code" : "00AT",
  "iata_code" : null,
  "local_code" : "00AT",
  "home_link" : null,
  "wikipedia_link" : null,
  "keywords" : null
} ]
```

***QueryRecord***

| Name | Value |
| ---- | ----- |
| Record Reader | `Create a new JsonTreeReader Controller Service` |
| Record Writer | `Create a new JsonRecordWriter Controller Service` |

Dynamic Properties

| Name | Value |
| ---- | ----- |
| `yes` | `SELECT * FROM FLOWFILE WHERE scheduled_service = 'yes'` |

***JsonTreeReader*** Controller Service

No additional configuration is required, just enable the controller service

***JsonRecordWriter*** Controller Service

No additional configuration is required, just enable the controller service

***LogMessage***

No additional configuration is required

