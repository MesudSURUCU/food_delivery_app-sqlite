import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app/cubit/home_page_cubit.dart';
import 'package:telephone_directory_app/entitiy/person.dart';
import 'package:telephone_directory_app/views/person_detail_page.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().personsUpload();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: isSearching
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (searchResult) {
                  context.read<HomePageCubit>().search(searchResult);
                },
              )
            : const Text("Kişiler"),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                    });
                    context.read<HomePageCubit>().personsUpload();
                  },
                  icon: const Icon(Icons.cancel))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<HomePageCubit, List<Persons>>(
        builder: (context, personsList) {
          if (personsList.isNotEmpty) {
            return Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/homepage_image.png"), fit: BoxFit.cover)),
              child: ListView.builder(
                  itemCount: personsList.length,
                  itemBuilder: (context, indeks) {
                    var person = personsList[indeks];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonDetailPage(
                                      person: person,
                                    ))).then((value) {
                          context.read<HomePageCubit>().personsUpload();
                        });
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [       
                              Image.asset("assets/placeholder.png", width: 50, height: 50,),
                              SizedBox(width: 30,),             
                              Text(
                                  "${person.personName} - ${person.personNumber}"),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "${person.personName} silinsin mi ?"),
                                      action: SnackBarAction(
                                        label: "EVET",
                                        onPressed: () {
                                          context
                                              .read<HomePageCubit>()
                                              .delete(person.personId);
                                        },
                                      ),
                                    ));
                                  },
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    
                                  ),
                                  color: Colors.red,
                                  ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
