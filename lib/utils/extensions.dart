import 'dart:js_interop';

import 'package:firebase_database/firebase_database.dart';

extension FirebaseDBExtension on DataSnapshot {
  get toMap {
    late Map<dynamic, dynamic> temp = value as Map<dynamic, dynamic>;
    return temp.jsify();
  }
}
