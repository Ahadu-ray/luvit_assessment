import 'package:luvit_assessment/core/adapters/home_adapter.dart';
import 'package:luvit_assessment/core/models/firebase_models.dart';
import 'package:luvit_assessment/core/services/firebase_services/realtime_db_service.dart';

class HomeRepository implements IHomeRepository {
  RealTimeDatabaseService _realTimeDatabaseService = RealTimeDatabaseService();
  @override
  Future<DateCardData> getUser(String id) async {
    // TODO: implement getUsers
    throw UnimplementedError();
    // await _realTimeDatabaseService.getData(path: id).then((value) {
    //   return DateCardData.fromJson(value);
    // });
  }

  @override
  Future<List<DateCardData>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<bool> likeUser(String id) {
    // TODO: implement likeUser
    throw UnimplementedError();
  }
}
