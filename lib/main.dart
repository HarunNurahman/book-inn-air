import 'package:book_inn_air/cubit/auth_cubit.dart';
import 'package:book_inn_air/cubit/destination_cubit.dart';
import 'package:book_inn_air/cubit/page_cubit.dart';
import 'package:book_inn_air/cubit/seat_cubit.dart';
import 'package:book_inn_air/pages/bonus_page.dart';
import 'package:book_inn_air/pages/dashboard_page.dart';
import 'package:book_inn_air/pages/get-started_page.dart';
import 'package:book_inn_air/pages/sign-in_page.dart';
import 'package:book_inn_air/pages/sign-up_page.dart';
import 'package:book_inn_air/pages/splash_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(), // Wrap your app
//       ),
//     );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageCubit>(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => const BonusPage(),
          '/dashboard': (context) => const DashboardPage(),
        },
      ),
    );
  }
}
