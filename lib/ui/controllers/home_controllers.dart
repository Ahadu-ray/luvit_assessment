import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:luvit_assessment/core/adapters/home_adapter.dart';
import 'package:luvit_assessment/core/models/firebase_models.dart';

class HomeController extends GetxController {
  IHomeRepository repository;

  HomeController({required this.repository});

// holds the loading status of the app
  var _status = RxStatus.empty().obs;
  RxStatus get status => _status.value;
  set status(RxStatus value) => _status.value = value;

// holds the list of users loaded from firebase
  final _users = <DateCardData>[].obs;
  List<DateCardData> get users => _users;
  set users(List<DateCardData> value) => _users.value = value;

// holds the list of users to be shown in the horizontal list view
  final _datesToShow = <DateCardData>[].obs;
  List<DateCardData> get datesToShow => _datesToShow;
  set datesToShow(List<DateCardData> value) => _datesToShow.value = value;

// holds the current user being shown in the center of the screen
  late DateCardData currentUser;

  // holds the current page of the user being shown in the center of the screen
  final _currentDatePage = 0.obs;
  int get currentDatePage => _currentDatePage.value;
  set currentDatePage(int value) => _currentDatePage.value = value;

  // holds the current like count of the user being shown in the center of the screen
  final _currentDateLikeCount = 0.obs;
  int get currentDateLikeCount => _currentDateLikeCount.value;
  set currentDateLikeCount(int value) => _currentDateLikeCount.value = value;

  // holds the scroll controller of the horizontal list view
  ScrollController scrollController = ScrollController();

  // holds the debouncer to debounce the scroll event since there will be too many position data
  final _debouncer = Debouncer(delay: Duration(milliseconds: 500));

  // get the list of users from firebase and set the current user to the first user and stream the like count of the current user
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

    // listen to the scroll event of the horizontal list view and when the scroll position reaches the end of the list view, remove the current user from the list and set the current user to the first user
    scrollController.addListener(() {
      _debouncer.call(() {
        if (scrollController.position.pixels >
                scrollController.position.maxScrollExtent / users.length &&
            scrollController.position.pixels > 0) {
          removeDate();
          scrollController.jumpTo(0);
        }
      });
    });
  }

// a function to get the list of users from firebase
  getUsers() async {
    await repository.getUsers().then((value) {
      users = value;
      datesToShow = users;
    });
  }

// a function to check if the user is the current user being shown in the center of the screen
  isActive(DateCardData data) {
    print(data.name + " " + currentUser.name);
    return data.name == currentUser.name;
  }

// a function to set the current user being shown in the center of the screen
  setCurrentCard(int index) {
    currentDatePage = 0;
    currentUser = users[index];
    currentDateLikeCount = currentUser.likeCount;
    if (repository.likeCount != null) repository.likeCount!.cancel();
    streamLikeCount();
  }

// a function to stream the like count of the current user being shown in the center of the screen
  streamLikeCount() {
    repository.streamLikeCount(currentUser.name);
    repository.likeCount!.onData((event) {
      currentDateLikeCount = event.snapshot.value as int;
    });
  }

// a function to like the current person being shown in the center of the screen
  likeDate() async {
    await repository.likeUser(currentUser.name);
  }

// a function to remove the current user/date being shown in the center of the screen
  removeDate() {
    datesToShow.remove(currentUser);
    if (datesToShow.isEmpty) {
      status = RxStatus.empty();
    } else {
      setCurrentCard(0);
    }
  }
}
