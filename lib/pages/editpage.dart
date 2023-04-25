import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:provider/provider.dart';
import 'package:trial/pages/helpersfunctions.dart';
import 'package:trial/pages/userProvider/userProvider.dart';

// void main() {
//   runApp(const Signup());
// }
class Edit extends StatefulWidget {
  const Edit({super.key});
  @override
  EditState createState() => EditState();
}

class EditState extends State<Edit> {
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController residenceController = TextEditingController();
  TextEditingController foodController = TextEditingController();
  TextEditingController movieController = TextEditingController();
  
  // String get loggedInUserEmail => UserProvider().user_email;
  


 
  
  
  

  @override
  Widget build(BuildContext context) {
    String email = Provider.of<UserProvider>(context, listen: false).user_email;
     Future<Map<String, dynamic>> userData = getProfileInfo(email);
  
    userData.then((value){
    firstnameController.text = value["firstName"];
    lastnameController.text = value["lastName"];
    emailController.text = value["email"];
    idController.text = value["idNumber"];
    dobController.text = value["dob"];
    yearController.text = value["yearGroup"];
    majorController.text = value["major"];
    residenceController.text = value["campusResidence"];
    foodController.text = value["favouriteFood"];
    movieController.text = value["favouriteMovie"];
  });

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 220, 93, 93),
        body: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/edit.jpg',
                fit: BoxFit.cover,
                height: 825,
              ),
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    
                  ),
                  const Text("ashesiconnect",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: "Dosis")),
                  const Text("Edit Profile",
                  textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "Dosis")),
                  Icon(Icons.mode_edit_outline_outlined,color: Colors.white,size: 80,),
                  

                // add your other widgets here
            Row (
              
              children:[
                Padding(padding: EdgeInsets.only(top: 20, right: 80)),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                    child:TextFormField(
                    enabled: false,
                    controller: firstnameController,
                    decoration:InputDecoration(
                      hintText: "Firstname",
                      hintStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                     validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your firstname";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                    
                    )
                  )
                ),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                    child:TextFormField(
                      enabled: false,
                      controller: lastnameController,
                    decoration:InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      hintText: "Lastname",
                      hintStyle: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                     validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your lastname";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                    )
                  )
                )
              ]
            ),


            Row (
              // mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(padding: EdgeInsets.only(top: 20, right: 80)),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                    child:TextFormField(
                    enabled:false,
                    controller: idController ,
                    decoration:InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      hintText: "Student ID",
                      hintStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your student ID";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                    )
  
                  )
                ),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                    child:TextFormField(
                    enabled: false,
                    controller: emailController,
                    decoration:InputDecoration(
                      // change the text that the user enters to to dosis font
                      labelStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your email";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                    )
                  )
                )
              ]
            ),

            Row (
              // mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(padding: EdgeInsets.only(top: 20, right: 80)),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                    child:DateTimePicker(
                    controller: dobController,
                    type: DateTimePickerType.date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    decoration:InputDecoration(
                      // change the text that the user enters to to dosis font
                      
                      labelStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      hintText: "Date of Birth",
                      hintStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    )
                    ),
                    

                  )
                ),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                    child:TextFormField(
                    controller: yearController,
                    decoration:InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      hintText: "Year Group",
                      hintStyle: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your year group";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                    )
                  )
                )
              ]
            ),

            Row (
              // mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(padding: EdgeInsets.only(top: 20, right: 80)),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                    child:TextFormField(
                    controller: majorController,
                    decoration:InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      hintText: "Major",
                      hintStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your major";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                    )
                  )
                ),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                    child:TextFormField(
                    controller: residenceController,
                    decoration:InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      hintText: "Campus Residence",
                      hintStyle: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your campus residence";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                    )
                  )
                )
              ]
            ),


            Row (
              
              // mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(padding: EdgeInsets.only(top: 20, right: 80)),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                    child:TextFormField(
                    controller: foodController,
                    decoration:InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      hintText: "Favourite Food",
                      hintStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                     validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your favourite food";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                    
                    )
                  )
                ),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                    child:TextFormField(
                    controller: movieController,
                    decoration:InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      hintText: "Favourite Movie",
                      hintStyle: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                     validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your favourite movie";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                    )
                  )
                )
              ]
            ),

          
            Row(
              children: [
                Padding(padding: EdgeInsets.only(top: 20, right: 80)),
                Expanded(child: SizedBox(
                  width:40,
                  child: Container  (
                    width: 40,
                  margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                  child: ElevatedButton(
                    onPressed: () => {
                      updateProfileInfo(context, firstnameController.text, lastnameController.text, emailController.text, dobController.text, idController.text, foodController.text, movieController.text, yearController.text, majorController.text, residenceController.text)
                      },
                    style: ElevatedButton.styleFrom(
                      // padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
                      backgroundColor: Color.fromARGB(255, 220, 93, 93),

                    ),
                    child: 
                    const Text(
                      "UPDATE PROFILE",
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, fontFamily: "Dosis"),
                    ),
                  )
                )))
              ],

            )
          
            

              ]
               
                      )
                      ) 
              ]
                      ) 
                      )
                      );
  }
} 