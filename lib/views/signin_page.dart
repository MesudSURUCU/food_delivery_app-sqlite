import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephone_directory_app/views/bottom_navigation_bar.dart';
import 'package:telephone_directory_app/views/signup_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  var tfUserName = TextEditingController();
  var tfPassword = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> accessControl() async {
    var un = tfUserName.text;
    var pw = tfPassword.text;

    if (un == "admin" && pw == "12345") {
      var sp = await SharedPreferences.getInstance();

      sp.setString("userName", un);
      sp.setString("password", pw);

      if (!mounted) return;

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BotNavBarPage()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Giriş Hatalı")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          
          backgroundColor: Colors.black,
          title: const Text(
            "Sıgn In",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Text("Hesabınız var mı ?", style: TextStyle(color: Colors.white),),
            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
            }, child: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/signin_image.png"),fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  TextField(
                     style: TextStyle(color: tfUserName.text.isEmpty ? Colors.white : Colors.white),
                    controller: tfUserName,
                    decoration: const InputDecoration(hintText: "Ad Soyad", hintStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    obscureText: true,
                     style: TextStyle(color: tfPassword.text.isEmpty ? Colors.white : Colors.white),
                    controller: tfPassword,
                    decoration: const InputDecoration(hintText: "Şifre", hintStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(300, 50))),
                    onPressed: () {
                      accessControl();
                    },
                    child: const Text("GİRİŞ"),
                  ),
                  Spacer(),
                  const Text(
                      "Giriş kullanıcı adı ve şifre ile kullanıcı oturumu kontrolü için  Shared Prefences kullanılmıştır..", style: TextStyle(color: Colors.white),),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Ad Soyad : admin",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                  ),
                  const Text(
                    "Şifre : 12345",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
      );
  }
}
