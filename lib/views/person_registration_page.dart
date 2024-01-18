import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app/cubit/person_registration_cubit.dart';
import 'package:telephone_directory_app/views/home_page.dart';

class PersonRegistrationPage extends StatefulWidget {
  const PersonRegistrationPage({super.key});

  @override
  State<PersonRegistrationPage> createState() => _PersonRegistrationPageState();
}

class _PersonRegistrationPageState extends State<PersonRegistrationPage> {
  var tfPersonName = TextEditingController();
  var tfPersonNumber = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Kayıt"),
        centerTitle: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Image.asset(
                  "assets/placeholder.png",
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: 50,),
              TextField(
                controller: tfPersonName,
                decoration: const InputDecoration(hintText: "Kişi Ad"),
              ),
                 SizedBox(height: 50,),
              TextField(
                controller: tfPersonNumber,
                decoration: const InputDecoration(hintText: "Kişi Tel"),
              ),
                 SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: () {
                   context.read<PersonRegistrationCubit>().registration(tfPersonName.text, tfPersonNumber.text);
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomePage()));
                  },
                  child: const Text("KAYDET")),
            ],
          ),
        ),
      ),
    );
  }
}
