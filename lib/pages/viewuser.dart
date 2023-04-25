import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/pages/helpersfunctions.dart';
import 'package:trial/pages/userProvider/userProvider.dart';
import 'package:trial/pages/feedpage.dart';

class ViewUser extends StatefulWidget {
  
  const ViewUser({super.key});

  

  @override
  ViewUserState createState() => ViewUserState();
}

class ViewUserState extends State<ViewUser> {
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
    // searchController = TextEditingController();
    //  String email = Provider.of<UserProvider>(context, listen: false).user_email;
    


    Future<Map<String, dynamic>> getProfile =
        getProfileInfo(searchController.text);

    return MaterialApp(
      home: Scaffold(
        // Container(
        // child: FutureBuilder<Map<String, dynamic >>(future: getProfile,)),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Row(children: [
          
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 0, left: 0),
                  child: Container(
                    color: const Color.fromARGB(255, 220, 93, 93),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, right: 125),
                          child: Text("ashesiconnect",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Dosis",
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: GestureDetector(
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
                                ))),
                        Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/viewprofile');
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.person,
                                        color: Colors.white),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Profile",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: "Dosis")),
                                  ],
                                ))),
                        Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/editpage');
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.edit,
                                        color: Colors.white),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Edit Profile",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: "Dosis")),
                                  ],
                                ))),
                        Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/feedpage');
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.settings,
                                        color: Colors.white),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Settings",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: "Dosis")),
                                  ],
                                ))),
                        Padding(
                            padding: const EdgeInsets.only(top: 380, left: 20),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/home');
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.logout,
                                        color: Colors.white),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Logout",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: "Dosis")),
                                  ],
                                ))),
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
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 500, right: 5),
                        child: SizedBox(
                          width: 400,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabled: false,
                              hintText: "search",
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
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
                        child:Padding(
                          padding: const EdgeInsets.only(top: 20, left: 400,right: 400),
                      

                      
                      child: FutureBuilder<Map<String, dynamic>>(
                        future: getProfile,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
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
                              Text("Lastname: $lastName ",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Student ID: $id",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Email: $email ",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Date of birth: $dob",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Year Group: $year ",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Major: $major ",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Campus Residence: $residence",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Favourite Food: $food",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Favourite Movie: $movie",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Dosis",
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              // IconButton(onPressed: ()=> Navigator.pushNamed(context,'/editpage'), icon: const Icon(Icons.edit), color: Colors.white, iconSize: 40,),
                                
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return const Text("Error");
                          }
                          // print(firstName);
                          return const CircularProgressIndicator();
                        },
                        
                      ),
                      
                                
                      
                     
                    ),

                  )
              ))],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}