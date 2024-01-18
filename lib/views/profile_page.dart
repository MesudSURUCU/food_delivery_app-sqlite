import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephone_directory_app/views/signin_page.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

 Future<void> logOut() async {
    var sp = await SharedPreferences.getInstance();

    sp.remove("userName");
    sp.remove("password");

    if (!mounted) return;

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SigninPage()));
  }

var tfProfilName = TextEditingController();
var tfProfilNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [   
          Container(
            height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/placeholder.png"),
           // fit: BoxFit.fitHeight
             ),
            ),
            ), 
            SizedBox(height: 50,),       
            TextField(
              controller: tfProfilName,
              decoration: const InputDecoration(
                hintText: "Ad Soyad",
              ),
            ),
            SizedBox(height: 50,),
            TextField(
              controller: tfProfilNumber,
              decoration: InputDecoration(
                hintText: "Numara",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: (){}, 
            child: Text("Ekle"),
            style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(300, 50))),),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: ElevatedButton(
                onPressed: (){
                  logOut();
                }, 
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 30,),
                    Text("Çıkış Yap"),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
                style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(300, 50)))),
            ),
            ],
          ),
        ),
      ),
    );
  }
}







