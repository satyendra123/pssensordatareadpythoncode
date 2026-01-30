# pssensordatareadpythoncode
PGS_SENSORDATAREADPYTHONCODE

protocol is like

1) floor request to zone - AA 01(zone_id) 0x80(cmd) 0xA1() 0x00(CRCL) 0x00(CRCR) 55
   zone response to floor- AA 01(zone_id) 07(total sensor) 00 01 02 03 01 01 02 00(total_vacant) 03(total_engaged) 02(total_faulty) 01(total no communication) 55

2) master request to floor- DE 01(floor_id) 0x80(cmd) 0xA1() 0x00(CRCL) 0x00(CRCR) E9
   floor response to zone - DE 01 02(total zone) AA 01(zone_id) 07(total sensor) 00 01 02 03 01 01 02 00(total_vacant) 03(total_engaged) 02(total_faulty) 01(total no communication) 55 AA 02(zone_id) 07(total sensor) 00 01 02 03 01 01 02 00(total_vacant) 03(total_engaged ) 02(total_faulty) 01(total no communication) 55 00(total vacant in floor) 03(total_engaged in floor) 02(total_faulty in floor) 01(total no communication in floor) E9
   
3) PC send the request to master-  no request send from the PC to master controller. PC will automatically get the response
   master send the response to PC- F4 01 DE 01 02(total zone) AA 01(zone_id) 07(total sensor) 00 01 02 03 01 01 02 00(total_vacant) 03(total_engaged) 02(total_faulty) 01(total no communication) 55 AA 02(zone_id) 07(total sensor) 00 01 02 03 01 01 02 00(total_vacant) 03(total_engaged ) 02(total_faulty) 01(total no communication) 55 00(total vacant in floor) 03(total_engaged in floor) 02(total_faulty in floor) 01(total no communication in floor) E9 DE 01 02(total zone) AA 01(zone_id) 07(total sensor) 00 01 02 03 01 01 02 00(total_vacant) 03(total_engaged) 02(total_faulty) 01(total no communication) 55 AA 02(zone_id) 07(total sensor) 00 01 02 03 01 01 02 00(total_vacant) 03(total_engaged ) 02(total_faulty) 01(total no communication) 55 00(total vacant in floor) 03(total_engaged in floor) 02(total_faulty in floor) 01(total no communication in floor) E9  00(total vacant in master) 03(total_engaged in master) 02(total_faulty in master) 01(total no communication in master) D1
