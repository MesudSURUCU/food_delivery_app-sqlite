import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app/entitiy/person.dart';
import 'package:telephone_directory_app/repository/personsdao_repository.dart';


class HomePageCubit extends Cubit<List<Persons>> {
  HomePageCubit() : super(<Persons>[]);
  
var prepo = PersonsDaoRepository();

Future<void> personsUpload() async {
  var list = await prepo.getAllPersons();
  emit(list);
}

Future<void> search(String searchWord) async {
  var list = await prepo.searchPerson(searchWord);
  emit(list);
}

  Future<void> delete(int personId) async {
     await prepo.personDelete(personId);
     await personsUpload();
  }

}