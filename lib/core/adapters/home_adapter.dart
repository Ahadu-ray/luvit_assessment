import 'package:luvit_assessment/core/models/firebase_models.dart';

abstract class IHomeRepository {
  Future<List<DateCardData>> getUsers();
  Future<DateCardData> getUser(String id);
  Stream<int> streamLikeCount(String id);
  Future<bool> likeUser(String id);
  Future<bool> dislikeUser(String id);
}
