import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

extension FirebaseDBExtension on DataSnapshot {
  get toMap {
    return jsonDecode(jsonEncode(value));
  }
}
