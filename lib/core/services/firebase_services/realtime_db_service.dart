import 'package:firebase_database/firebase_database.dart';
import 'package:luvit_assessment/utils/extensions.dart';

class RealTimeDatabaseService {
  //get all data from firebase database
  Future<dynamic> getAllData() async {
    final _database = FirebaseDatabase.instance.ref("data/");
    final snapshot = await _database.get().catchError((error) {
      return error;
    });
    print(snapshot.value);
    return snapshot.toMap;
  }

  //get data from firebase database
  Future<Map<dynamic, dynamic>> getData({String path = ""}) async {
    final _database = FirebaseDatabase.instance.ref("data/$path");
    final snapshot = await _database.get().catchError((error) {
      return error;
    });
    print(snapshot.value.runtimeType);
    return snapshot.value as Map<dynamic, dynamic>;
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
}
