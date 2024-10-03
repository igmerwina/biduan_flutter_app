import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:doctor_booking_app/injection.dart';
import 'package:doctor_booking_app/data/app_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:doctor_booking_app/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool introduction = false;
  bool isLogin = false;
  bool noPermissionLocation = false;

  Future<void> checkLocationPermission() async {
    if (introduction) {
      if (await Permission.location.request().isGranted) {
        if (kDebugMode) {
          print("Permission Granted");
        }
      } else {
        if (kDebugMode) {
          print("Permission Denied");
        }
        setState(() {
          noPermissionLocation = true;
        });
      }
    }
  }

  Future<void> initLocal() async {
    AppPreferences pref = getIt.get<AppPreferences>();
    bool isUserLoggedIn = pref.isUserLoggedIn();
    setState(() {
      isLogin = isUserLoggedIn;
    });
  }

  void checkNavigation() {
    String route = (isLogin) ? Routes.HOME : Routes.REGISTER;
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  void initState() {
    initLocal();
    checkLocationPermission();
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () => checkNavigation());
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/doctor_pic.png',
              width: 150,
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
