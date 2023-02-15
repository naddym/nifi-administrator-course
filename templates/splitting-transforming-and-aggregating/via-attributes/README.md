Download the template and upload into NiFi instance

### Configuring Processors

***GenerateFlowFile*** 

Configuring `GenerateFlowFile` processor is simple. Just copy below data to `Custom Text` property of GenerateFlowFile Processor

```csv
6523,"00A","heliport","Total Rf Heliport",40.07080078125,-74.93360137939453,11,"NA","US","US-PA","Bensalem","no","00A",,"00A",,,
323361,"00AA","small_airport","Aero B Ranch Airport",38.704022,-101.473911,3435,"NA","US","US-KS","Leoti","no","00AA",,"00AA",,,
6524,"00AK","small_airport","Lowell Field",59.947733,-151.692524,450,"NA","US","US-AK","Anchor Point","no","00AK",,"00AK",,,
6525,"00AL","small_airport","Epps Airpark",34.86479949951172,-86.77030181884766,820,"NA","US","US-AL","Harvest","no","00AL",,"00AL",,,
6526,"00AR","closed","Newport Hospital & Clinic Heliport",35.6087,-91.254898,237,"NA","US","US-AR","Newport","no",,,,,,"00AR"
322127,"00AS","small_airport","Fulton Airport",34.9428028,-97.8180194,1100,"NA","US","US-OK","Alex","no","00AS",,"00AS",,,
6527,"00AZ","small_airport","Cordes Airport",34.305599212646484,-112.16500091552734,3810,"NA","US","US-AZ","Cordes","no","00AZ",,"00AZ",,,
6528,"00CA","small_airport","Goldstone (GTS) Airport",35.35474,-116.885329,3038,"NA","US","US-CA","Barstow","no","00CA",,"00CA",,,
324424,"00CL","small_airport","Williams Ag Airport",39.427188,-121.763427,87,"NA","US","US-CA","Biggs","no","00CL",,"00CL",,,
322658,"00CN","heliport","Kitchen Creek Helibase Heliport",32.7273736,-116.4597417,3350,"NA","US","US-CA","Pine Valley","no","00CN",,"00CN",,,
6529,"00CO","closed","Cass Field",40.622202,-104.344002,4830,"NA","US","US-CO","Briggsdale","no",,,,,,"00CO"
6531,"00FA","small_airport","Grass Patch Airport",28.64550018310547,-82.21900177001953,53,"NA","US","US-FL","Bushnell","no","00FA",,"00FA",,,
6532,"00FD","heliport","Ringhaver Heliport",28.846599578857422,-82.34539794921875,25,"NA","US","US-FL","Riverview","no","00FD",,"00FD",,,
6533,"00FL","small_airport","River Oak Airport",27.230899810791016,-80.96920013427734,35,"NA","US","US-FL","Okeechobee","no","00FL",,"00FL",,,
6534,"00GA","small_airport","Lt World Airport",33.76750183105469,-84.06829833984375,700,"NA","US","US-GA","Lithonia","no","00GA",,"00GA",,,
6535,"00GE","heliport","Caffrey Heliport",33.889245,-84.73793,957,"NA","US","US-GA","Hiram","no","00GE",,"00GE",,,
6536,"00HI","heliport","Kaupulehu Heliport",19.832715,-155.980233,43,"NA","US","US-HI","Kailua-Kona","no","00HI",,"00HI",,,
6537,"00ID","small_airport","Delta Shores Airport",48.145301818847656,-116.21399688720703,2064,"NA","US","US-ID","Clark Fork","no","00ID",,"00ID",,,
322581,"00IG","small_airport","Goltl Airport",39.724028,-101.395994,3359,"NA","US","US-KS","McDonald","no","00IG",,"00IG",,,
6538,"00II","closed","Bailey Generation Station Heliport",41.644501,-87.122803,600,"NA","US","US-IN","Chesterton","no",,,,,,"00II"
6539,"00IL","small_airport","Hammer Airport",41.97840118408203,-89.5604019165039,840,"NA","US","US-IL","Polo","no","00IL",,"00IL",,,
6540,"00IN","heliport","St Mary Medical Center Heliport",41.51139831542969,-87.2605972290039,634,"NA","US","US-IN","Hobart","no","00IN",,"00IN",,,
6541,"00IS","small_airport","Hayenga's Cant Find Farms Airport",40.02560043334961,-89.1229019165039,820,"NA","US","US-IL","Kings","no","00IS",,"00IS",,,
6542,"00KS","small_airport","Hayden Farm Airport",38.72779846191406,-94.93049621582031,1100,"NA","US","US-KS","Gardner","no","00KS",,"00KS",,,
6543,"00KY","small_airport","Robbins Roost Airport",37.409400939941406,-84.61969757080078,1265,"NA","US","US-KY","Stanford","no","00KY",,"00KY",,,
45437,"00LA","heliport","Shell Chemical East Site Heliport",30.191944,-90.980833,15,"NA","US","US-LA","Gonzales","no","00LA",,"00LA",,,
6544,"00LL","heliport","Ac & R Components Heliport",39.66529846191406,-89.70559692382812,600,"NA","US","US-IL","Chatham","no","00LL",,"00LL",,,
```

***SplitText***

| Name | Value |
| ---- | ----- |
| Line Split Count | `1` |
| Remove Trailing Newlines | `false` |


***ExtractText***

Dynamic Properties

| Name | Value |
| ---- | ----- |
| `content` | `(?s)(.*)` |

***UpdateAttribute***

Dynamic Properties

| Name | Value |
| ---- | ----- |
| `content` | `${content:replace('small_airport', 'airport')}` |

***ReplaceText***

| Name | Value |
| ---- | ----- |
| Replacement Value | `${content}` |

***MergeContent***

| Name | Value |
| ---- | ----- |
| Merge Strategy | `Defragment` |