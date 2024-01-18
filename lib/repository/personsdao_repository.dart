import 'package:telephone_directory_app/entitiy/person.dart';
import 'package:telephone_directory_app/sqflite/database_assistant.dart';


class PersonsDaoRepository {
  Future<void> personRegistration(
      String personName, String personNumber) async {
    var db = await DatabaseAssistant.databaseAccess();
    var  informations = Map<String, dynamic>();
      informations["personName"] = personName;
      informations["personNumber"] = personNumber;
    
     await db.insert("persons", informations);


  }

  Future<void> personUpdate(
     int personId, String personName, String personNumber) async {
    var db = await DatabaseAssistant.databaseAccess();
    var  informations = Map<String, dynamic>();
      informations["personName"] = personName;
      informations["personNumber"] = personNumber;
    
     await db.update("persons", informations, where: "personId=?", whereArgs: [personId]);
  }

  Future<List<Persons>> getAllPersons() async {
   var db = await DatabaseAssistant.databaseAccess();

   List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM persons");
  
    return List.generate(maps.length, (i) {
      var row = maps[i];
      return Persons(personId: row["personId"], personName: row["personName"], personNumber: row["personNumber"]);
    });
  
  }

  Future<List<Persons>> searchPerson(String searchWord) async {
   var db = await DatabaseAssistant.databaseAccess();

   List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM persons WHERE personName like '%$searchWord%'");
  
    return List.generate(maps.length, (i) {
      var row = maps[i];
      return Persons(personId: row["personId"], personName: row["personName"], personNumber: row["personNumber"]);
    });
  }

    Future<void> personDelete(
      int personId) async {
    
     var db = await DatabaseAssistant.databaseAccess();

     await db.delete("persons", where: "personId=?", whereArgs: [personId]);
  }

}
