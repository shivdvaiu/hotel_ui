import 'package:flutter/material.dart';
import 'package:igeku/ui/views/chat_view/chat_view.dart';
import 'package:igeku/ui/views/home_view/home_view.dart';
import 'package:igeku/ui/views/notifications_view/notifications_view.dart';
import 'package:igeku/ui/views/profile_view/profile_view.dart';
import 'package:igeku/ui/views/upload_view/upload_view.dart';

class BaseViewModel extends ChangeNotifier {
  int currentBottomNavIndex = 0;

  get getCurrentBottomNavIndex => currentBottomNavIndex;

  set setCurrentBottomNavIndex(int index) {
    currentBottomNavIndex = index;
    notifyListeners();
  }

  List<Widget> allViews = [
    HomeView(),
    Container(),
   UploadView(),
    NotificationsView(),
    ProfileView(),
  ];


}
