import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephone_directory_app/views/bottom_navigation_bar.dart';
import 'package:telephone_directory_app/views/signin_page.dart';


class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

@override
  void initState() {
    super.initState();
   sessionControl();
  }

 sessionControl() async {

  var sp = await SharedPreferences.getInstance();

  String spUserName = sp.getString("userName") ?? "Kullanıcı Adı Yok";
  String spPassword = sp.getString("password") ?? "Şifre Yok";
   
   if (spUserName == "admin" && spPassword == "12345") {
    await Future.delayed(const Duration(seconds: 2));
    if(!mounted) return;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const BotNavBarPage()));
   }else {
    await Future.delayed(const Duration(seconds: 2));
     if(!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const SigninPage()));
   }

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/telephone_image.png"),
            fit: BoxFit.cover)),)
    );
  }
}