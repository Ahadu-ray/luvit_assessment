import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:luvit_assessment/core/models/firebase_models.dart';

// A class that acts as an interface/blueprint for the HomeRepositories' actions
abstract class IHomeRepository {
  Future<List<DateCardData>> getUsers();
  Future<DateCardData> getUser(String id);
  void streamLikeCount(String id);
  StreamSubscription<DatabaseEvent>? likeCount;
  Future<bool> likeUser(String id);
}
