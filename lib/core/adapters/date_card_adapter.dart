import 'package:luvit_assessment/core/models/firebase_models.dart';

abstract class IDateCardRepository {
  Future<List<DateCardData>> getUsers();
  Future<DateCardData> getUser(String id);
  Future<bool> likeUser(String id);
}
