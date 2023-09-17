import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
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

  final _datesToShow = <DateCardData>[].obs;
  List<DateCardData> get datesToShow => _datesToShow;
  set datesToShow(List<DateCardData> value) => _datesToShow.value = value;

  late DateCardData currentUser;
  final _currentDatePage = 0.obs;
  int get currentDatePage => _currentDatePage.value;
  set currentDatePage(int value) => _currentDatePage.value = value;

  final _currentDateLikeCount = 0.obs;
  int get currentDateLikeCount => _currentDateLikeCount.value;
  set currentDateLikeCount(int value) => _currentDateLikeCount.value = value;

  ScrollController scrollController = ScrollController();
  final _debouncer = Debouncer(delay: Duration(milliseconds: 500));
  @override
  Future<void> onInit() async {
    status = RxStatus.loading();
    await getUsers();
    if (users.isNotEmpty) {
      setCurrentCard(0);
    }
    streamLikeCount();
    status = RxStatus.success();
    super.onInit();
    scrollController.addListener(() {
      _debouncer.call(() {
        print(scrollController.position.pixels);
        if (scrollController.position.pixels >
                scrollController.position.maxScrollExtent / users.length &&
            scrollController.position.pixels > 0) {
          print("rem t");
          removeDate();
          scrollController.jumpTo(0);
        }
      });
    });
  }

  getUsers() async {
    await repository.getUsers().then((value) {
      users = value;
      datesToShow = users;
    });
  }

  isActive(DateCardData data) {
    print(data.name + " " + currentUser.name);
    return data.name == currentUser.name;
  }

  setCurrentCard(int index) {
    currentDatePage = 0;
    currentUser = users[index];
    currentDateLikeCount = currentUser.likeCount;
    if (repository.likeCount != null) repository.likeCount!.cancel();
    streamLikeCount();
  }

  streamLikeCount() {
    repository.streamLikeCount(currentUser.name);
    repository.likeCount!.onData((event) {
      currentDateLikeCount = event.snapshot.value as int;
    });
  }

  likeDate() async {
    await repository.likeUser(currentUser.name);
  }

  removeDate() {
    datesToShow.remove(currentUser);
    if (datesToShow.isEmpty) {
      status = RxStatus.empty();
    } else {
      setCurrentCard(0);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
