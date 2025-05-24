import 'package:flutter/material.dart';
import 'package:flutter_taxi_calculate_app/views/taxi_result_ui.dart';

class TaxiHomeUI extends StatefulWidget {
  const TaxiHomeUI({super.key});

  @override
  State<TaxiHomeUI> createState() => _TaxiHomeUIState();
}

class _TaxiHomeUIState extends State<TaxiHomeUI> {
  //สร้างตัวแปรควบคุม TextField Traffic jam duration
  TextEditingController _distanceCtrl = TextEditingController();
  TextEditingController _trafficJamDurationCtrl = TextEditingController();

  // สร้าง Method แสดง Dialog แจ้งเตือน
  _warningDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'คําเตือน',
        ),
        content: Text(
          msg,
        ),
        actions: [
          OutlinedButton(
            //TextButton, EleveatedButton
            onPressed: () => Navigator.pop(context), // ปิด Dialog
            child: Text(
              'OK',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'คำนวณค่าแท็กซี่',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Center(
              child: Column(
                children: [
                  // TextField Distance
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
                  TextField(
                    controller: _distanceCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                      ),
                      label: Text(
                        'ระยะทาง (กิโลเมตร)',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      hintText: 'กรุณากรอกระยะทาง',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _trafficJamDurationCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                        borderSide: BorderSide(
                          color: Colors.lightBlue,
                          width: 2,
                        ),
                      ),
                      label: Text(
                        'เวลารถติด (นาที)',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      hintText: 'ป้อนเวลารถติด (ไม่มีป้อน 0)',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate UI หากมีปัญหาให้แสดง Dialog แจ้งเตือน
                      if (_distanceCtrl.text.isEmpty) {
                        _warningDialog('อย่าลืมป้อน "ระยะทาง" ด้วยนะ!');
                      } else if (_trafficJamDurationCtrl.text.isEmpty) {
                        _warningDialog('อย่าลืมป้อน "เวลารถติด" ด้วยนะ!');
                      } else {
                        //พร้อมคำนวณแล้วส่งไปแสดงผลที่หน้า ResultScreenUI
                        // แปลงราคากับอัตราดอกเบี้ยเป็นตัวเลขก่อน
                        double distance = double.parse(_distanceCtrl.text);

                        double TrafficJamDuration =
                            double.parse(_trafficJamDurationCtrl.text);

                        // fare = 35 + ((distance - 1) * 5.5) + (TrafficJamDuration * 0.5)
                        double farePrice = 35 +
                            ((distance - 1) * 5.5) +
                            (TrafficJamDuration * 0.5);
                        // ค่าโดยสารรวม=35+(24×5.5)+(10×0.5)

                        // ส่งไปหน้า Result แบบย้อนกลับได้
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaxiResultUI(
                              distance: distance,
                              TrafficJamDuration: TrafficJamDuration,
                              farePrice: farePrice,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'คำนวณ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        55,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _distanceCtrl.text = '';
                          _trafficJamDurationCtrl.text = '';
                        },
                      );
                    },
                    child: Text(
                      'ยกเลิก',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        55,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
