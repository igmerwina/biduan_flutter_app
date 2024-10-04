import 'package:doctor_booking_app/feature/home/bloc/home_bloc.dart';
import 'package:doctor_booking_app/feature/home/home_screen.dart';
import 'package:doctor_booking_app/feature/login/bloc/login_bloc.dart';
import 'package:doctor_booking_app/feature/login/login_screen.dart';
import 'package:doctor_booking_app/feature/register/bloc/register_bloc.dart';
import 'package:doctor_booking_app/feature/register/register_screen.dart';
import 'package:doctor_booking_app/injection.dart';
import 'package:doctor_booking_app/routes.dart';
import 'package:doctor_booking_app/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await getIt.allReady();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MainAppState();
}

// This widget is the root of your application.
class _MainAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
          create: (BuildContext context) => getIt.get<RegisterBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => getIt.get<LoginBloc>(),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => getIt.get<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        //debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            // case Routes.ONBOARDING:
            //   return MaterialPageRoute(builder: (_) => OnboardingScreen());
            case Routes.REGISTER:
              return MaterialPageRoute(builder: (_) => RegisterScreen());
            case Routes.LOGIN:
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case Routes.HOME:
              return MaterialPageRoute(builder: (_) => HomeScreen());
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
        home: SplashScreen(),
      ),
    );
  }
}
