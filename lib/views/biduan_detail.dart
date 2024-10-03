import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class BiduanDetail extends StatefulWidget {
  @override
  _BiduanDetailState createState() => _BiduanDetailState();
}

class _BiduanDetailState extends State<BiduanDetail> {
  @override
  Widget build(BuildContext context) {
    var imgAssetPath;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.blue, // Navigation bar
          statusBarColor: Colors.red, // Status bar
        ),
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("assets/45.png", height: 150),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 222,
                    height: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Dr. Stefeni Albert",
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          "Heart Speailist",
                          style: TextStyle(fontSize: 19, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 239, 237, 235),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                                ),
                                onPressed: () async {
                                  // Aksi pertama: buka WhatsApp (launchUri1)
                                  final Uri launchUri1 = Uri.parse('https://wa.me/6282121339191');
                                  if (await canLaunchUrl(launchUri1)) {
                                    await launchUrl(launchUri1);
                                  } else {
                                    print('Could not launch WhatsApp');
                                  }
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () async {
                                          // Aksi pertama: buka WhatsApp (launchUri1)
                                          final Uri launchUri1 = Uri.parse('https://wa.me/6282121339191');
                                          if (await canLaunchUrl(launchUri1)) {
                                            await launchUrl(launchUri1);
                                          } else {
                                            print('Could not launch WhatsApp');
                                          }
                                        },
                                        child: IconTile(
                                          imgAssetPath: "assets/wa.png",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10), // Space between icons
                                    // Expanded(
                                    //   child: GestureDetector(
                                    //     onTap: () async {
                                    //       // Aksi kedua: kirim email
                                    //       final Uri emailUri = Uri(
                                    //         scheme: 'mailto',
                                    //         path: 'example@example.com', // Ganti dengan email yang sesuai
                                    //         query: 'subject=Hello&body=This is the email body', // Subjek dan isi email
                                    //       );
                                    //       if (await canLaunchUrl(emailUri)) {
                                    //         await launchUrl(emailUri);
                                    //       } else {
                                    //         print('Could not launch email client');
                                    //       }
                                    //     },
                                    //     child: IconTile(
                                    //       imgAssetPath: "assets/email.png",
                                    //     ),
                                    //   ),
                                    // ),
                                    LoveRatingButton()
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )


                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "About",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Test BIduan saja ii dari pada g enak sama sekali. ",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          // Image.asset("assets/mappin.png"),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Address",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    "House # 2, Road # 5, Green Road Dhanmondi, Dhaka, Bangladesh",
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset("assets/clock.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Daily Practict",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    '''Monday - Friday
Open till 7 Pm''',
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/map.png",
                    width: 120,
                  )
                ],
              ),
              Text(
                "Activity",
                style: TextStyle(
                    color: Color(0xff242424),
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Color(0xffFBB97C),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color(0xffFCCA9B),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Image.asset("assets/list.png")),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 130,
                            child: Text(
                              "Jadwal Book",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Color(0xffA5A5A5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color(0xffBBBBBB),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Image.asset("assets/list.png")),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 130,
                            child: Text(
                              "Harga Book",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String? imgAssetPath;
  final Color? backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath!,
          width: 20,
        ),
      ),
    );
  }
}

class LoveRatingButton extends StatefulWidget {
  @override
  _LoveRatingButtonState createState() => _LoveRatingButtonState();
}

class _LoveRatingButtonState extends State<LoveRatingButton> {
  // Status rating love: apakah sudah di-tap (liked) atau belum
  bool isLoved = false; 

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Toggle the status
          setState(() {
            isLoved = !isLoved; // Ubah status liked
          });
        },
        child: IconTile(
          // Ganti gambar atau tampilkan emoji love sesuai status
          imgAssetPath: isLoved ? "assets/notlove.png" : "assets/lovefull.png",
          // Mengubah warna berdasarkan status liked
          // backgroundColor: isLoved ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}

