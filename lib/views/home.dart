import 'package:doctor_booking_app/data/data.dart';
import 'package:doctor_booking_app/model/speciality.dart';
import 'package:doctor_booking_app/views/biduan_detail.dart';
import 'package:doctor_booking_app/views/doctor_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

String? selectedCategorie = "Full Body";

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<String> categories = ["Full Body", "Pijat Capek", "SPA", "Karaoke"];

  late List<SpecialityModel> specialities;

  @override
  void initState() {
    super.initState();

    specialities = getSpeciality();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.blue, // Navigation bar
          statusBarColor: Colors.red, // Status bar
        ),
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      drawer: Drawer(child: Container() // Populate the Drawer in the next step.
          ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Temukan \nBiduan yang \nAnda Butuhkan",
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(14)),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.grey, fontSize: 19),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Kategori",
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 30,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategorieTile(
                        categorie: categories[index],
                        isSelected: selectedCategorie == categories[index],
                        context: this,
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                child: ListView.builder(
                    itemCount: specialities.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SpecialistTile(
                        imgAssetPath: specialities[index].imgAssetPath,
                        speciality: specialities[index].speciality,
                        noOfDoctors: specialities[index].noOfDoctors,
                        backColor: specialities[index].backgroundColor,
                        detail: specialities[index].detail,
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "TOP Rating",
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              BiduanTile()
            ],
          ),
        ),
      ),
    );
  }
}

class CategorieTile extends StatefulWidget {
  final String? categorie;
  final bool? isSelected;
  final HomePageState? context;
  CategorieTile({this.categorie, this.isSelected, this.context});

  @override
  _CategorieTileState createState() => _CategorieTileState();
}

class _CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.context!.setState(() {
          selectedCategorie = widget.categorie;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(left: 8),
        height: 30,
        decoration: BoxDecoration(
            color: widget.isSelected! ? Color(0xffFFD0AA) : Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          widget.categorie!,
          style: TextStyle(
              color:
                  widget.isSelected! ? Color(0xffFC9535) : Color(0xffA1A1A1)),
        ),
      ),
    );
  }
}

class SpecialistTile extends StatelessWidget {
  final String? imgAssetPath;
  final String? speciality;
  final int? noOfDoctors;
  final Color? backColor;
  final String? detail;
  SpecialistTile(
      {required this.imgAssetPath,
      required this.speciality,
      required this.noOfDoctors,
      required this.backColor,
      required this.detail});

  @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     width: 150,
  //     margin: EdgeInsets.only(right: 16),
  //     decoration: BoxDecoration(
  //         color: backColor, borderRadius: BorderRadius.circular(24)),
  //     padding: EdgeInsets.only(top: 16, right: 16, left: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           speciality!,
  //           style: TextStyle(color: Colors.white, fontSize: 20),
  //         ),
  //         SizedBox(
  //           height: 6,
  //         ),
  //         Text(
  //           "$noOfDoctors Bintang",
  //           style: TextStyle(color: Colors.white, fontSize: 13),
  //         ),
  //         Image.asset(
  //           imgAssetPath!,
  //           height: 160,
  //           fit: BoxFit.fitHeight,
  //         )
  //       ],
  //     ),
  //   );
  // }

    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BiduanDetail()),
          );
        },
        child: Container(
          width: 150,
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
              color: backColor, borderRadius: BorderRadius.circular(24)),
          padding: EdgeInsets.only(top: 16, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                speciality!,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "$noOfDoctors Bintang",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              Image.asset(
                imgAssetPath!,
                height: 160,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
      );
    }

}

class DoctorsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DoctorsInfo()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffFFEEE0), borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/45.png",
              height: 50,
            ),
            SizedBox(
              width: 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Lintang A",
                  style: TextStyle(color: Color(0xffFC9535), fontSize: 19),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Terapis Full Body",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
              decoration: BoxDecoration(
                  color: Color(0xffFBB97C),
                  borderRadius: BorderRadius.circular(13)),
              child: Text(
                "Call",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );

  }
}

class BiduanTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BiduanDetail()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffFFEEE0), borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/45.png",
              height: 50,
            ),
            SizedBox(
              width: 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Lintang A",
                  style: TextStyle(color: Color(0xffFC9535), fontSize: 19),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "120 Bintang",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Spacer(),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
            //   decoration: BoxDecoration(
            //       color: Color(0xffFBB97C),
            //       borderRadius: BorderRadius.circular(13)),
            //   child: Text(
            //     "Call",
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 13,
            //         fontWeight: FontWeight.w500),
            //   ),
            // ) // For iOS

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFBB97C),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                ),
                onPressed: () async {
                  const phoneNumber = '081325673063';

                  // Check if the platform is iOS or Android
                  if (Theme.of(context).platform == TargetPlatform.iOS) {
                    // iOS: Use url_launcher to open the phone dialer
                    final Uri launchUri = Uri.parse('https://wa.me/6282121339191');

                    if (await canLaunchUrl(launchUri)) {
                      await launchUrl(launchUri);
                    } else {
                      print('Could not launch dialer');
                    }
                  } else {
                    // Android: Use FlutterPhoneDirectCaller to make the call directly
                    bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
                    if (res != null && res) {
                      print('Call made successfully');
                    } else {
                      print('Call failed');
                    }
                  }
                },
                child: Text(
                  "Call",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
          ],
        ),
      ),
    );

  }
}

