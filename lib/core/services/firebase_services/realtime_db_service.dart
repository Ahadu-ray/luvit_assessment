import 'package:firebase_database/firebase_database.dart';
import 'package:luvit_assessment/utils/extensions.dart';

// A class that handles all the firebase realtime database operations. It performs
// CRUD operations on the database and stream data.
class RealTimeDatabaseService {
  //get all data from firebase database
  Future<Map<String, dynamic>> getAllData() async {
    final _database = FirebaseDatabase.instance.ref("data/");
    final snapshot = await _database.get().catchError((error) {
      return error;
    });
    return snapshot.toMap;
  }

  //get data from firebase database
  Future<Map<String, dynamic>> getData({String path = ""}) async {
    final _database = FirebaseDatabase.instance.ref("data/$path");
    final snapshot = await _database.get().catchError((error) {
      return error;
    });
    return snapshot.toMap;
  }

  //post data to firebase database
  Future<void> postData(
      {String path = "", required Map<String, dynamic> data}) async {
    final database = FirebaseDatabase.instance.ref("data/$path");
    await database.set(data).catchError((error) {
      return error;
    });
  }

  //update data to firebase database
  Future<void> updateData(
      {String path = "", required Map<String, dynamic> data}) async {
    final database = FirebaseDatabase.instance.ref("data/$path");
    await database.update(data).catchError((error) {
      return error;
    });
  }

  Stream<DatabaseEvent> streamData(String path) {
    final database = FirebaseDatabase.instance.ref("data/$path");
    return database.onValue;
  }
}
