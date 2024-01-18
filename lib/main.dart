import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app/cubit/home_page_cubit.dart';
import 'package:telephone_directory_app/cubit/person_detail_cubit.dart';
import 'package:telephone_directory_app/cubit/person_registration_cubit.dart';
import 'package:telephone_directory_app/views/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => PersonRegistrationCubit()),
        BlocProvider(create:(context) => PersonDetailCubit()),
        BlocProvider(create:(context) => HomePageCubit()),
     
     
      ],
      child: MaterialApp(
        title: 'Telephone Directory App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SpalshScreen(),
      ),
    );
  }
}
