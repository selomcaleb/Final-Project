import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:trial/pages/helpersfunctions.dart';

// void main() {
//   runApp(const Signup());
// }
class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<Signup> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController residenceController = TextEditingController();
  TextEditingController foodController = TextEditingController();
  TextEditingController movieController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();




  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 220, 93, 93),
        body: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/signup.jpg',
                fit: BoxFit.cover,
                height: 822,
              ),
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    
                  ),
                  const Text("Welcome to ashesiconnect",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: "Dosis")),
                  const Text("lets get you signed up and ready to connect with the Ashesi community",
                  textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "Dosis")),
                  

                  // add your other widgets here
            Row (
              // mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(padding: EdgeInsets.only(top: 20, right: 80)),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                    child:TextFormField(
                    controller: firstnameController,
                    decoration:InputDecoration(
                      hintText: "Firstname",
                      hintStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                     
                    style: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                    
                    )
                  )
                ),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                    child:TextFormField(
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
                    
                    style: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                    )
  
                  )
                ),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                    child:TextFormField(
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
                    obscureText: true,
                    controller: passwordController,
                    decoration:InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                    
                    style: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                    )
                  )
                ),
                SizedBox(
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                    child:TextFormField(
                      obscureText: true,
                    controller: confirmpassController,
                    decoration:InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.black, fontFamily: "Dosis"),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),)
                    ),
                    
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
                    width: 10,
                  margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                  child: ElevatedButton(
                    onPressed: () => {
                      postProfileInfo(context, firstnameController.text, lastnameController.text, emailController.text, passwordController.text, dobController.text, idController.text, foodController.text, movieController.text, yearController.text, majorController.text, residenceController.text)
                      },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
                      backgroundColor: Color.fromARGB(255, 220, 93, 93),
                    ),
                    child: 
                    const Text(
                      "SIGN UP",
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

