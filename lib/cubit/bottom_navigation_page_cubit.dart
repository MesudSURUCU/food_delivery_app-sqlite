import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app/entitiy/person.dart';
import 'package:telephone_directory_app/repository/personsdao_repository.dart';


class BotNavBarPageCubit extends Cubit<List<Persons>> {
  BotNavBarPageCubit() : super(<Persons>[]);
  
var prepo = PersonsDaoRepository();

Future<void> personsUpload() async {
  var list = await prepo.getAllPersons();
  emit(list);
}
}