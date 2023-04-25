// Container(
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   hintText: "What's on your mind?",
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   prefixIcon: Icon(Icons.search),
//                                 ),
//                                 style: const TextStyle(
//                                     color: Colors.black, fontFamily: "Dosis"),
//                               ),
//                               ),

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/pages/helpersfunctions.dart';
import 'package:trial/pages/userProvider/userProvider.dart';


class ViewProfile extends StatefulWidget{
  const ViewProfile({super.key});

  @override
  ViewProfileState createState() => ViewProfileState();

}

class ViewProfileState extends State<ViewProfile>{
  String firstName = " ";
  String lastName = "";
  String email = "";
  String dob = "";
  String id = "";
  String year = "";
  String major = "";
  String residence = "";
  String food = "";
  String movie = "";
  
  
  @override

  Widget build(BuildContext context) {
  
    
    Future<Map<String, dynamic>> getProfile = getProfileInfo("selomcaleb@gmail.com");
    String email = Provider.of<UserProvider>(context, listen: false).user_email;

    
    getProfile.then((value){
      //print(value["firstName"]);
        

      // var lastName = value["lastName"];
      // var email = value["email"];
      // var dob = value['dob'];
      // var id = value['idNumber'];
      // var year = value['yearGroup'];
      // var major = value['major'];
      // var residence = value['campusResidence'];
      // var food = value['favouriteFood'];
      // var movie = value['favouriteMovie'];
    });
   
    


    
   
    
return MaterialApp(
      
      
      
      home: Scaffold(
        // Container(
        // child: FutureBuilder<Map<String, dynamic >>(future: getProfile,)),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Row(children: [
          Container(
            
            child: FutureBuilder<Map<String,dynamic>>(
              future: getProfile,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                   firstName = snapshot.data!["firstName"];
                   lastName = snapshot.data!["lastName"];
                   email = snapshot.data!["email"];
                   dob = snapshot.data!['dob'];
                   id = snapshot.data!['idNumber'];
                  year = snapshot.data!['yearGroup'];
                   major = snapshot.data!['major'];
                   residence = snapshot.data!['campusResidence'];
                   food = snapshot.data!['favouriteFood'];
                   movie = snapshot.data!['favouriteMovie'];

                   
                  
                return Column(
        children: [
          Text("Name: $firstName $lastName"),
          Text("Email: $email"),
          Text("Date of Birth: $dob"),
          Text("ID: $id"),
          Text("Year: $year"),
          Text("Major: $major"),
          Text("Residence: $residence"),
          Text("Favorite Food: $food"),
          Text("Favorite Movie: $movie"),
        ],
      );



                  

                  
                  


                }
                else if(snapshot.hasError){
                  return const Text("Error");
                }
                // print(firstName);
                return const CircularProgressIndicator();
              },
              
            ),

          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 0, left: 0),
                  
                  child: Container(
                    color: const Color.fromARGB(255, 220, 93, 93),
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 20, right: 125),
                        child: Text("ashesiconnect",textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Dosis",)),
                        ),
                        

                        Padding(padding: const EdgeInsets.only(top: 20, left: 20),
                        child:
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/feedpage');
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.home, color: Colors.white),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Home",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Dosis")),
                            ],

                          )
                          )
                        
                        ),
                        Padding(padding: const EdgeInsets.only(top: 20, left: 20),
                        child:
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/editpage');
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.person, color: Colors.white),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Profile",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Dosis")),
                            ],

                          )
                          )
                        
                        ),


                        Padding(padding: const EdgeInsets.only(top: 20, left: 20),
                        child:
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/feedpage');
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.messenger_rounded, color: Colors.white),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Messages",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Dosis")),
                            ],

                          )
                          )
                        
                        ),

                        Padding(padding: const EdgeInsets.only(top: 20, left: 20),
                        child:
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/feedpage');
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.settings, color: Colors.white),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Settings",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Dosis")),
                            ],

                          )
                          )
                        
                        ),


                        Padding(padding: const EdgeInsets.only(top: 380, left: 20),
                        child:
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.logout, color: Colors.white),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Logout",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Dosis")),
                            ],

                          )
                          )
                        
                        ),
                        
                        

                      ],
                     
                      
                    ),
                  )),
            ),
            // color: Colors.black),
          ),
          Expanded(
            flex: 4,
            child: Container(
              // color: Colors.amber,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        color: Colors.white,
                        child:
                        Padding(
                          padding: const EdgeInsets.only(top:10, left: 500, right: 5),
                          child: SizedBox(
                          width: 400,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "search",
                              filled: true,
                              fillColor: const Color.fromARGB(255, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: const Icon(Icons.search),
                             
                            ),
                            style: const TextStyle(
                                color: Colors.black, fontFamily: "Dosis"),
                          ),
                        ),
                        ),
                        ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      color: const Color.fromARGB(255, 220, 93, 93),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 400, right: 400),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              Text("USER PROFILE",style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(Icons.person, size: 100, color: Colors.white,),

                              SizedBox(
                                height: 10,
                              ),
                              Text("Firstname: $firstName" ,style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Lastname: ",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Student ID: ",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Email: ",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Date of birth: ",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Year Group: ",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Major: ",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Campus Residence",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Favourite Food: ",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Favourite Movie: ",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),

                           
                          ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
  }