import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:trial/pages/userProvider/userProvider.dart';

var headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin': '*'};

Future<void> postProfileInfo(
    BuildContext context,
    String firstname,
    String lastname,
    String email,
    String password,
    String dob,
    String idNumber,
    String favouriteFood,
    String favouriteMovie,
    String year,
    String major,
    String campusResidence) async {
  String url = 'https://us-central1-socialmediastudentinfo.cloudfunctions.net/social_media/users';
  var request = http.Request('POST', Uri.parse(url));

  request.body = json.encode({
    "firstName": firstname,
    "lastName": lastname,
    "email": email,
    "password": password,
    "dob": dob,
    "idNumber": idNumber,
    "favouriteFood": favouriteFood,
    "favouriteMovie": favouriteMovie,
    "yearGroup": year,
    "major": major,
    "campusResidence": campusResidence
  });

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Success"),
            content: Text("Your profile has been created"),
          );
        });

        Navigator.pushNamed(context, '/home');
        
  } else if (response.statusCode == 409) {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Student already exists"),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  } else {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Your profile has not been created"),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

Future<void> postLoginInfo(
    BuildContext context, String email, String password) async {
  String url = 'https://us-central1-socialmediastudentinfo.cloudfunctions.net/social_media/login';
  var request = http.Request('POST', Uri.parse(url));

  request.body = json.encode({"email": email, "password": password});

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  

  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text("Success"),
          content: Text("You have logged in"),
        );
      },
    );
    final loginResponse = jsonDecode(await response.stream.bytesToString());
    Provider.of <UserProvider>(context, listen: false).userEmail = loginResponse['email'];
    var loggedInUserEmail = Provider.of <UserProvider>(context, listen: false).userEmail;
    Navigator.pushNamed(context, '/feedpage');


  } else if (response.statusCode == 409) {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please fill the responses"),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  } else {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Wrong email or password"),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

Future<Map< String, dynamic >> getProfileInfo( String email) async{
  String url = 'https://us-central1-socialmediastudentinfo.cloudfunctions.net/social_media/users?email=$email';
  var request = http.Request('GET', Uri.parse(url));

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if(response.statusCode == 200){
    var profiledDetails = jsonDecode(await response.stream.bytesToString());
    return profiledDetails;
  }
  else{
    return {};
  }

}


Future<void> updateProfileInfo(BuildContext context,
    String firstname,
    String lastname,
    String email,
    String dob,
    String idNumber,
    String favouriteFood,
    String favouriteMovie,
    String year,
    String major,
    String campusResidence) async {
  String url = 'https://us-central1-socialmediastudentinfo.cloudfunctions.net/social_media/users/$email';
  var request = http.Request('PATCH', Uri.parse(url));

  request.body = json.encode({
    "firstName": firstname,
    "lastName": lastname,
    "email": email,
    "dob": dob,
    "idNumber": idNumber,
    "favouriteFood": favouriteFood,
    "favouriteMovie": favouriteMovie,
    "yearGroup": year,
    "major": major,
    "campusResidence": campusResidence
  });

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Success"),
            content: Text("Your profile has been updated"),
          );
        });
        final loginResponse = jsonDecode(await response.stream.bytesToString());
        Provider.of <UserProvider>(context, listen: false).userEmail = loginResponse['email'];
        var loggedInUserEmail = Provider.of <UserProvider>(context, listen: false).userEmail;
        Navigator.pushNamed(context, '/viewprofile');


    }
    else if (response.statusCode == 400) {

    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please fill the responses"),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });


    }}

    
	// single user feed for other users
genSingleFeed(BuildContext context, String email, String message, String time) {
  // message box
  return Padding(
    padding: const EdgeInsets.only(top: 40, right: 30),
    child: Container(
      width: 850,
      height: 155,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 98, 98, 98).withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      // message box contents
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        child: Container(
          // color: Colors.amberAccent,
          child: Column(children: [
            Container(
              // color: Colors.blueGrey,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // user image avatar
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(195, 195, 195, 1),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, left: 10),
                          child: Text(
                            email,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500,fontFamily: 'Dosis'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 500, bottom: 15),
                      child: Text(time,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300,fontFamily: 'Dosis')),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          message,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12, 
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Dosis'
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    ),
  );
}

Future <void> createPost(BuildContext context, String email, String message) async {
  String url = 'https://us-central1-socialmediastudentinfo.cloudfunctions.net/social_media/post';
  var request = http.Request('POST', Uri.parse(url));
  request.headers.addAll(headers);
  request.body = json.encode({
    "email": email,
    "message": message,
  });
  http.StreamedResponse response = await request.send();
  if(response.statusCode == 200){
    print('post created');
  }
  
  

  }



