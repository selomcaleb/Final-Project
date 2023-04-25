import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/pages/feedpage.dart';
import 'package:trial/pages/editpage.dart';
import 'package:trial/pages/userProvider/userProvider.dart';
import 'package:trial/pages/viewuser.dart';
// import 'package:splashscreen/splashscreen.dart';
// import 'package:trial/pages/profilePage.dart';
import 'pages/signup.dart';
import 'pages/home.dart';
import 'pages/viewprofile.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:
  const FirebaseOptions(apiKey: "AIzaSyCCBduZkdyphcUV2MdScUBbHH8LHbedMjg",
  authDomain: "socialmediastudentinfo.firebaseapp.com",
  projectId: "socialmediastudentinfo",
  storageBucket: "socialmediastudentinfo.appspot.com",
  messagingSenderId: "389534328799",
  appId: "1:389534328799:web:de710ffa57bbffe748066a",
  measurementId: "G-TKB90MHX2X"));
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      // home: SplashScreen(seconds: 5,
      // navigateAfterSeconds: Home(),
      // title: new Text(
      //     'SplashScreen Example',
      //     style: new TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 20.0,
      //         color: Colors.white),
      //   ),
      //   backgroundColor: Colors.blue,
      //   styleTextUnderTheLoader: new TextStyle(),
      //   loaderColor: Colors.white
      // ) ,
      routes: {
        '/home': (context) =>  Home(),
        '/signup': (context) => const Signup(),
        '/feedpage': (context) => const FeedPage(),
        '/editpage': (context) => const Edit(),
        '/viewprofile': (context) => const ViewProfile(),
        '/viewuser': (context) => const ViewUser(),
        
        // '/profile': (context) => const profilePage(),
        
      },
    ) ,
    );

    
  }
}
