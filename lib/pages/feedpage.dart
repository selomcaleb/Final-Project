import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/pages/helpersfunctions.dart';
import 'package:trial/pages/userProvider/userProvider.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});
  @override
  FeedState createState() => FeedState();
}
final TextEditingController searchController = TextEditingController();

class FeedState extends State<FeedPage> {
  
  final TextEditingController postController = TextEditingController();

  Stream<QuerySnapshot> postStream = FirebaseFirestore.instance
      .collection('posts')
      .orderBy('created_at', descending: true)
      .snapshots();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String email = Provider.of<UserProvider>(context).user_email;
    return MaterialApp(
      home: Scaffold(
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
                                  Navigator.pushNamed(context, '/feedpage');
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.messenger_rounded,
                                        color: Colors.white),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Messages",
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
                                    const Text("Sign In",
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
          ),
          Expanded(
            flex: 4,
            child: Container(
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
                            controller: searchController,
                            decoration: InputDecoration(
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
                            onFieldSubmitted: (value) => {
                              searchController.text = value,
                              Navigator.pushNamed(context, '/viewuser'),
                             
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left:92,right:120),
                    child: SizedBox(
                      width: 500,
                    child: TextFormField(
                      controller: postController,
                      decoration: const InputDecoration(
                        labelText:"What's on your mind?",
                        labelStyle: TextStyle(fontFamily: "Dosis", color: Colors.black),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),


                      ),
                      style: const TextStyle(
                                color: Colors.black, fontFamily: "Dosis"),
                      onFieldSubmitted: (value) => {
                        postController.text = value,
                        createPost(context, email, postController.text),
                        postController.clear(),
                        

                      }
                     
                    ),
                    ),
                    

                    

                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: postStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                              child: Text("Error: ${snapshot.error}"));
                        }
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator(
                            color: Colors.black,
                          );
                        }
                        final posts = snapshot.data!.docs;

                        return Expanded(
                          flex: 7,
                          child: Container(
                            color: const Color.fromARGB(255, 220, 93, 93),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 92, right: 92),
                                child: Column(children: [
                                  const SizedBox(height: 20),
                                  Container(
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        for (var post in posts)
                                          genSingleFeed(
                                              context,
                                              post['email'],
                                              post['message'],
                                              post['created_at'])
                                      ],
                                    ),
                                    // height: 120,
                                    // width: 500,
                                    // color: Colors.green,
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
