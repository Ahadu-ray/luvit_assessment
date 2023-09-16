import 'package:get/get.dart';
import 'package:luvit_assessment/core/adapters/home_adapter.dart';
import 'package:luvit_assessment/core/models/firebase_models.dart';

class HomeController extends GetxController {
  IHomeRepository repository;

  HomeController({required this.repository});

  var _status = RxStatus.empty().obs;
  RxStatus get status => _status.value;
  set status(RxStatus value) => _status.value = value;

  final _users = <DateCardData>[].obs;
  List<DateCardData> get users => _users;
  set users(List<DateCardData> value) => _users.value = value;

  late DateCardData currentUser;
  final _currentDatePage = 0.obs;
  int get currentDatePage => _currentDatePage.value;
  set currentDatePage(int value) => _currentDatePage.value = value;

  final _currentDateLikeCount = 0.obs;
  int get currentDateLikeCount => _currentDateLikeCount.value;
  set currentDateLikeCount(int value) => _currentDateLikeCount.value = value;

  @override
  Future<void> onInit() async {
    status = RxStatus.loading();
    await repository.getUsers().then((value) {
      users = value;
      currentUser = users[currentDatePage];
    });
    status = RxStatus.success();
    super.onInit();
  }

  isActive(DateCardData data) {
    print(data.name + " " + currentUser.name);
    return data.name == currentUser.name;
  }
}
