import 'package:flutter/material.dart';
import 'package:telephone_directory_app/views/bottom_navigation_bar.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

var tfUserSaveName = TextEditingController();
var tfUserSavePassword = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sign Up", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/signup_image.png"),fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    style: TextStyle(color: tfUserSaveName.text.isEmpty ? Colors.white : Colors.white),
                    controller: tfUserSaveName,
                    decoration: const InputDecoration(hintText: "Ad Soyad", hintStyle: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    obscureText: true,
                     style: TextStyle(color: tfUserSaveName.text.isEmpty ? Colors.white : Colors.white),
                    controller: tfUserSavePassword,
                    decoration: const InputDecoration(hintText: "Şifre", hintStyle: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(300, 50))),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BotNavBarPage()));
                    },
                    child: const Text("KAYIT OL"),
                  ),
                ],
              ),
              ),
      ),
    );
  }
}