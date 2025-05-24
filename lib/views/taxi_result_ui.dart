import 'package:flutter/material.dart';
import 'package:flutter_taxi_calculate_app/views/taxi_home_ui.dart';
import 'package:intl/intl.dart';

class TaxiResultUI extends StatefulWidget {
  // สร้างตัวแปรรับค่าที่จะส่งมา
  double? distance;
  double? TrafficJamDuration;
  double? farePrice;

  // เอาตัวแปรที่สร้างมารอรับค่าที่ส่งมา
  TaxiResultUI({
    super.key,
    this.distance,
    this.TrafficJamDuration,
    this.farePrice,
  });

  @override
  State<TaxiResultUI> createState() => _TaxiResultUIState();
}

class _TaxiResultUIState extends State<TaxiResultUI> {
  @override
  Widget build(BuildContext context) {
    // กำหนดรูปแบบของตัวเลข ณ ที่นี้คั่นหลักพัน/ล้าน และทศนิยม 2 ตัว
    NumberFormat fm = NumberFormat("#,###,###.0", "en_US");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "คำนวณค่าแท็กซี่ (ผลลัพธ์)",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage(
                'assets/images/img01.png',
              ),
              width: 200,
              height: 120,
            ),
            Image(
              image: AssetImage(
                'assets/images/img02.png',
              ),
              width: 120,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '--- ค่ารถแท็กซี่ ---',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'ระยะทาง: ${widget.distance} กิโลเมตร',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'เวลารถติด: ${widget.TrafficJamDuration} นาที',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'คิดเป็นเงินที่ต้องจ่าย: ${fm.format(widget.farePrice)} บาท',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
