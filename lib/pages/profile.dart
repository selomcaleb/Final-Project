// import 'package:flutter/material.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});
//   @override
//   ProfileState createState() => ProfileState();
// }

// class ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 220, 93, 93),
//         body: Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: Container(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 0, left: 0),
//                   ),
//                   child: Container(
//                     color: Color.fromARGB(255, 225, 93, 93),
//                     child: Column(children: [
//                       Padding(padding: EdgeInsets.only(top: 20,right: 95),
//                       child: const Text("ashesiconnect",textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontFamily: "Dosis",)),

                      
//                       ),

//                       Padding(padding: EdgeInsets.only(top: 20, left: 20),
//                         child:
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/feedpage');
//                           },
//                           child: Row(
//                             children: [
//                               Icon(Icons.home, color: Colors.white),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Text("Home",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontFamily: "Dosis")),
//                             ],

//                           )
//                           )
                        
//                         ),

//                         Padding(padding: EdgeInsets.only(top: 20, left: 20),
//                         child:
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/feedpage');
//                           },
//                           child: Row(
//                             children: [
//                               Icon(Icons.person, color: Colors.white),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Text("Profile",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontFamily: "Dosis")),
//                             ],

//                           )
//                           )
                        
//                         ),

//                         Padding(padding: EdgeInsets.only(top: 20, left: 20),
//                         child:
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/feedpage');
//                           },
//                           child: Row(
//                             children: [
//                               Icon(Icons.messenger_rounded, color: Colors.white),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Text("Messages",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontFamily: "Dosis")),
//                             ],

//                           )
//                           )
                        
//                         ),

//                         Padding(padding: EdgeInsets.only(top: 20, left: 20),
//                         child:
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/feedpage');
//                           },
//                           child: Row(
//                             children: [
//                               Icon(Icons.settings, color: Colors.white),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Text("Settings",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontFamily: "Dosis")),
//                             ],

//                           )
//                           )
                        
//                         ),

//                         Padding(padding: EdgeInsets.only(top: 380, left: 20),
//                         child:
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/home');
//                           },
//                           child: Row(
//                             children: [
//                               Icon(Icons.logout, color: Colors.white),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Text("Logout",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontFamily: "Dosis")),
//                             ],

//                           )
//                           )
                        
//                         ),
                        




                        
//                     ],
                    
//                     ),
//                   ),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
