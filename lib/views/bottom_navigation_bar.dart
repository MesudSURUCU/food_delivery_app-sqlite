import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app/cubit/bottom_navigation_page_cubit.dart';
import 'package:telephone_directory_app/views/home_page.dart';
import 'package:telephone_directory_app/views/person_registration_page.dart';
import 'package:telephone_directory_app/views/profile_page.dart';


class BotNavBarPage extends StatefulWidget {
  const BotNavBarPage({super.key});

  @override
  State<BotNavBarPage> createState() => _BotNavBarPageState();
}

class _BotNavBarPageState extends State<BotNavBarPage> {
  int _currentIndex = 0;

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> list = [
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PersonRegistrationPage()))
              .then((value) {
            context.read<BotNavBarPageCubit>().personsUpload();
          });
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Menü"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profil")
          ]),
      body: list[_currentIndex],
    );
  }
}
