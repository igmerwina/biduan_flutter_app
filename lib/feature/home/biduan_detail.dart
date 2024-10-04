import 'package:doctor_booking_app/feature/schedule/schedule.dart';
import 'package:doctor_booking_app/views/form_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class BiduanDetail extends StatefulWidget {
  @override
  _BiduanDetailState createState() => _BiduanDetailState();
}

class _BiduanDetailState extends State<BiduanDetail> {
  @override
  Widget build(BuildContext context) {
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
                  Image.asset("assets/23_1.png", height: 180),
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
                        SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          flex: 2,
                          child: Text(
                            "Inul Daratista",
                            style: TextStyle(fontSize: 32, color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            "Goyang Ngebor Speailist",
                            style: TextStyle(fontSize: 19, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        // Flexible(
                        //   flex: 1,
                        //   child: Row(
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: IconTile(
                        //           backColor: Color(0xffFFECDD),
                        //           imgAssetPath: "assets/email.png",
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: IconTile(
                        //           backColor: Color(0xffFEF2F0),
                        //           imgAssetPath: "assets/call.png",
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: IconTile(
                        //           backColor: Color(0xffEBECEF),
                        //           imgAssetPath: "assets/video_call.png",
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        LoveRatingButton(),
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
                "Hj. Ainur Rokhimah, atau yang lebih dikenal sebagai Inul Daratista, adalah seorang penyanyi dangdut dan aktris berkebangsaan Indonesia. Inul terkenal dengan gaya goyang ngebor",
                style: TextStyle(color: Colors.grey, fontSize: 16),
                textAlign: TextAlign.justify,
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
                          Image.asset("assets/mappin.png"),
                          SizedBox(
                            width: 20,
                          ),
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
                                    "Jl. Embong Malang No. 1,3,5, Tunjungan Plaza Tunjungan Plaza 5, Lantai 6, Surabaya Telp. (031) 546 8282",
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
Open till Drop''',
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
                    width: 180,
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FormBooking()),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2 - 130,
                              child: Text(
                                "Book Now Singer",
                                style: TextStyle(color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to a new screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScheduleScreen(),
                          ),
                        );
                      },
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
                              width:
                                  MediaQuery.of(context).size.width / 2 - 130,
                              child: Text(
                                "Jadwal Harian",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
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

// class LoveRatingButton extends StatefulWidget {
//   @override
//   _LoveRatingButtonState createState() => _LoveRatingButtonState();
// }

// class _LoveRatingButtonState extends State<LoveRatingButton> {
//   // Status rating love: apakah sudah di-tap (liked) atau belum
//   bool isLoved = false; 

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           // Toggle the status
//           setState(() {
//             isLoved = !isLoved; // Ubah status liked
//           });
//         },
//         child: IconTile(
//           // Ganti gambar atau tampilkan emoji love sesuai status
//           imgAssetPath: isLoved ? "assets/notlike.png" : "assets/like2.png",
//           // Mengubah warna berdasarkan status liked
//           // backgroundColor: isLoved ? Colors.red : Colors.grey,
//         ),
//       ),
//     );
//   }
// }

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
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Toggle the status
                setState(() {
                  isLoved = !isLoved; // Ubah status liked
                });
              },
              child: IconTile(
                // Ganti gambar atau tampilkan emoji love sesuai status
                imgAssetPath: isLoved ? "assets/notlike.png" : "assets/like2.png",
                // Mengubah warna berdasarkan status liked
                // backgroundColor: isLoved ? Colors.red : Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Fungsi untuk membagikan konten
                _shareContent();
              },
              child: IconTile(
                imgAssetPath: "assets/share2.png",
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final Uri launchUri = Uri.parse('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
                if (await launchUrl(launchUri)) {
                  await launchUrl(launchUri);
                } else {
                  throw 'Could not launch $launchUri';
                }
              },
              child: IconTile(
                imgAssetPath: "assets/yotube.png",
              ),
            ),
          )
        ],
      ),
    );
  }

  void _shareContent() async {
    // Fungsi untuk membagikan konten
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
      'Check out my website https://example.com',
      subject: 'This is my website!',
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}


