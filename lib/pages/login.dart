import 'package:flutter/material.dart';
import 'package:project1univ/service/loginservice.dart';

class Login extends StatefulWidget {
  static String id = "Login";

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passToggle = true;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/LoginImage.jpg"),
                    fit: BoxFit.cover)),
          ),
          const Positioned(
              top: 80,
              right: 125,
              child: Text(
                "Welcome",
                style: TextStyle(
                    fontFamily: "Pacifico", fontSize: 50, color: Colors.black),
              )),
          Positioned(
              right: 60,
              top: 370,
              child: SizedBox(
                width: 300,
                height: 80,
                child: Container(
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(54),color: Color.fromARGB(255, 247, 243, 243)),
                  child: TextFormField(
                    
                    style: TextStyle(
                        fontSize: 25, color: Colors.black),
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      focusColor: Colors.blue,
                        fillColor: Color.fromARGB(0, 244, 244, 248),
                        label:  Text(
                          "e-mail",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                            fontSize: 15, color: Colors.black),
                        border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.black))),
                  ),
                ),
              )),
          Positioned(
              right: 60,
              top: 520,
              child: SizedBox(
                width: 300,
                height: 60,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: const Color.fromARGB(255, 248, 246, 246)),
                  child: TextFormField(
                    controller: passwordcontroller,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                        fillColor: const Color(0x000008ae),
                        prefixIcon: Icon(Icons.key),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        label: const Text(
                          "password",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        hintText: "Enter your password",
                        hintStyle:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        border: OutlineInputBorder(
                            gapPadding: 20,
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.black))),
                  ),
                ),
              )),
          Positioned(
              right: 180,
              top: 650,
              child: SizedBox(
                  width: 90,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        login(emailcontroller.text, passwordcontroller.text,
                            context);
                      },
                      child: const Text("login",
                          style:
                              TextStyle(fontSize: 18, color: Colors.black))))),
          Positioned(
            right: 60,
            top: 730,
            child: Text(
              "you dont have an account please ",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(1),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              right: 180,
              top: 770,
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "Signup");
                },
                child: const Text(
                  "Signup",
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ))
        ],
      ),
    );
  }
}
