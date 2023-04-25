import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trial/main.dart';
import 'package:trial/pages/helpersfunctions.dart';



// class Home extends MyApp {
//   const Home({super.key});
//   @override
//   HomeState createState() => HomeState();
//   }
  

class Home extends StatelessWidget{
  Home({super.key});
    
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 93, 93),
      body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Text("ashesiconnect",
              style: TextStyle(
                  color: Colors.white, fontSize: 32, fontFamily: "Dosis")),
          Text("Engage,Network,Connect",
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: "Dosis"))
        ]),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("LOGIN",
              style: TextStyle(
                  color: Colors.white, fontSize: 40, fontFamily: "Dosis")),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 283,
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "enter Ashesi mail",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: SvgPicture.asset(
                  "assets/images/mdi_email.svg",
                  color: const Color.fromARGB(255, 220, 93, 93),
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
              ),
              style: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 283,
            child: TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "enter password",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: SvgPicture.asset(
                  "assets/images/material-symbols_lock.svg",
                  color: const Color.fromARGB(255, 220, 93, 93),
                  alignment: Alignment.centerRight,
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
              ),
              style: const TextStyle(color: Colors.black, fontFamily: "Dosis"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () => {postLoginInfo(context, emailController.text, passwordController.text),},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
              backgroundColor: Color.fromARGB(255, 220, 93, 93),
            ),
            child: 
            const Text(
              "Login",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: "Dosis"),
            ),
          
          ),
          const SizedBox(
            height: 30,
          ),
          const Text("don't have an account?",
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: "Dosis"))
          ,GestureDetector(
            child: Text("signup",
                style: TextStyle(
                    color: Colors.blue, fontSize: 16, fontFamily: "Dosis",decoration: TextDecoration.underline
                ),),
            onTap: () => {Navigator.pushNamed(context, '/signup')},


          )
          
        ]),
      ]),
    )

    );
  }
  
}