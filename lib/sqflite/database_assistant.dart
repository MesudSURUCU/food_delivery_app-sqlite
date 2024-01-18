import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseAssistant {

static const String databaseName = "directory.sqlite";

static Future<Database>  databaseAccess() async {
   String databasePath = join(await getDatabasesPath(), databaseName);

   if(await databaseExists(databasePath)) {

    print("Database already exists, no need to copy");
   }
   else{
   ByteData data = await rootBundle.load("database/$databaseName");
   List<int> bytes = data.buffer.asInt8List(data.offsetInBytes,data.lengthInBytes);
   await File(databasePath).writeAsBytes(bytes, flush: true);
   print("Database copied");
   }

   return openDatabase(databasePath);

 }
}