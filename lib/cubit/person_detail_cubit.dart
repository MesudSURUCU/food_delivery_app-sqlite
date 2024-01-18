import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app/repository/personsdao_repository.dart';


class PersonDetailCubit extends Cubit<void>{
  PersonDetailCubit() : super(0);

  var prepo = PersonsDaoRepository();

    Future<void> update(int personId, String personName, String personNumber) async {
    await prepo.personUpdate(personId, personName, personNumber);
  }

}