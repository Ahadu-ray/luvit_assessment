import 'dart:async';

import 'package:luvit_assessment/core/adapters/home_adapter.dart';
import 'package:luvit_assessment/core/models/firebase_models.dart';
import 'package:luvit_assessment/core/services/firebase_services/realtime_db_service.dart';

class HomeRepository implements IHomeRepository {
  final RealTimeDatabaseService realTimeDatabaseService;

  HomeRepository({required this.realTimeDatabaseService});
  @override
  Future<DateCardData> getUser(String id) async {
    return await realTimeDatabaseService.getData(path: id).then((value) {
      return DateCardData.fromJson(value);
    });
  }

  @override
  Future<List<DateCardData>> getUsers() async {
    print("fetching users");
    return await realTimeDatabaseService.getAllData().then((value) {
      print("found ${value.length} users}");
      List<DateCardData> data = [];
      value.forEach((key, value) {
        data.add(DateCardData.fromJson(value));
      });
      return data;
    });
  }

  @override
  Stream<int> streamLikeCount(String id) {
    StreamController<int> likeCount = StreamController.broadcast();
    realTimeDatabaseService.streamData("$id/likeCount").listen((event) {
      likeCount.add(event.snapshot.value as int);
    });
    return likeCount.stream;
  }

  @override
  Future<bool> likeUser(String id) async {
    try {
      return await getUser(id).then((value) async {
        int likeCount = value.likeCount;
        return await realTimeDatabaseService.updateData(
            path: id, data: {"likeCount": likeCount + 1}).then((value) {
          return true;
        });
      });
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> dislikeUser(String id) async {
    try {
      return await getUser(id).then((value) async {
        int likeCount = value.likeCount;
        return await realTimeDatabaseService.updateData(
            path: id, data: {"likeCount": likeCount - 1}).then((value) {
          return true;
        });
      });
    } catch (e) {
      return false;
    }
  }
}
