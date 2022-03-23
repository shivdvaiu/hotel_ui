import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:igeku/ui/view_model/base_view_model/base_view_model.dart';
import 'package:igeku/ui/views/home_view/home_view.dart';
import 'package:igeku/ui/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Consumer<BaseViewModel>(
      builder: (BuildContext context, baseViewProvider, Widget? child) {
        return Scaffold(
          bottomNavigationBar: BottomNavyBar(
              containerHeight: 60,
              backgroundColor:
                  Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              selectedIndex: baseViewProvider.getCurrentBottomNavIndex,
              showElevation: false, // use this to remove appBar's elevation
              onItemSelected: (index) {
                baseViewProvider.setCurrentBottomNavIndex = index;
              },
              items: [
                BottomNavyBarItem(
                    icon: Icon(Icons.home,         color: Theme.of(context).colorScheme.onSecondary,),
                    title: Text(
                      'Home',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontWeight: FontWeight.bold),
                    ),
                    activeColor:
                        Theme.of(context).colorScheme.primaryContainer),
                BottomNavyBarItem(
                  activeColor: Theme.of(context).colorScheme.primary,
                  icon: Icon(
                    Icons.receipt_long_outlined,
                             color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  title: Text(
                    'Users',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                BottomNavyBarItem(
                  activeColor: Theme.of(context).colorScheme.primary,
                  icon: Icon(
                    Icons.bookmark_border_outlined,
                             color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  title: Text(
                    'Messages',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                BottomNavyBarItem(
                  activeColor: Theme.of(context).colorScheme.primary,
                  icon: Icon(
                    Icons.person_outline,
                             color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  title: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 13,
                                color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),

          appBar: AppBar(
            leading: Icon(
              Icons.drag_indicator_outlined,
              color: colorScheme.error.withOpacity(0.7),
              size: 30,
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            actions: [
              Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.notifications_outlined,
                      size: 30,
                      color: colorScheme.error.withOpacity(0.7),
                    ),
                    Positioned(
                      top: 15,
                      right: 10,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: colorScheme.onError, shape: BoxShape.circle),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
            elevation: 0,
          ),
          // backgroundColor: Theme.of(context).colorScheme.background,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.centerRight,
                  colors: [Color(0xffebeff5), Color(0xffebeff5).withOpacity(0.7)]),
            ),
            // color: Theme.of(context).colorScheme.background,
            child: Stack(fit: StackFit.expand, children: [
              baseViewProvider
                  .allViews[baseViewProvider.getCurrentBottomNavIndex],

              // Positioned(left: 0, right: 0, bottom: 6, child: MyBottomNavBar()),
            ]),
          ),
        );
      },
    );
  }
}
