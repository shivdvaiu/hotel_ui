import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:igeku/services/constant/constant.dart';
import 'package:igeku/services/services/navigations/routes.dart';
import 'package:igeku/ui/shared/themes.dart';
import 'package:igeku/ui/views/profile_view/profile_view.dart';
import 'package:igeku/ui/widgets/bottom_nav_bar.dart';
import 'package:igeku/ui/widgets/dummy_users.dart';
import 'package:igeku/ui/widgets/glassmorphism.dart';
import 'package:igeku/ui/widgets/text_field.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 10),
              Text(
                "Hello,Nurlia!",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 11.sp,
                    color: colorScheme.error.withOpacity(0.7),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Where today you'll work?",
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 14.sp,
                      color:
                          Theme.of(context).colorScheme.error.withOpacity(0.8),
                    ),
              ),
              SizedBox(
                height: 26,
              ),
              CustomTextField(
                hintText: 'Or search coworking here',
                prefixIcon: Icon(
                  Icons.search,
                  color: colorScheme.primary,
                  size: 25,
                ),
                textEditingController: TextEditingController(),
                textInputType: TextInputType.name,
                suffixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    height: 27,
                    width: 1,
                    color: colorScheme.surface,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorScheme.primaryContainer.withOpacity(0.2)),
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: colorScheme.primary,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Category",
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 13.sp,
                    color: colorScheme.onBackground,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _categoryButtons(
                    colorScheme,
                    context,
                    "Cafe",
                    Icons.coffee_outlined,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  _categoryButtons(
                      colorScheme, context, "Office", Icons.apartment_outlined,
                      isActive: false),
                  SizedBox(
                    width: 4,
                  ),
                  _categoryButtons(colorScheme, context, "Space",
                      Icons.maps_home_work_outlined,
                      isActive: false),
                ],
              ),

              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendation",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 13.sp,
                        color: colorScheme.onBackground,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 10.sp,
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),

              Text(
                "These cafe are might you like it!",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 10.sp,
                    color: colorScheme.error.withOpacity(0.6),
                    fontWeight: FontWeight.w700),
              ),
              // _horizontalUsersContainers(),
              SizedBox(
                height: 3.h,
              ),
              _horizontalUsersContainers(context),
              SizedBox(
                height: 3.h,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _categoryButtons(ColorScheme colorScheme, BuildContext context,
      String buttonName, IconData iconData,
      {bool isActive = true}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.onSurface.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                color: isActive ? colorScheme.primary : colorScheme.surface,
                size: 25,
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: Text(
                  buttonName,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 10.sp,
                      color: colorScheme.onBackground,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row tile(BuildContext context, title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 18.sp,
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "More",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 9.sp,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Theme.of(context).colorScheme.secondaryContainer,
              size: 19,
            )
          ],
        ),
      ],
    );
  }

  Widget _horizontalUsersContainers(BuildContext context) {
    return Container(
      height: 290,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: Constants.hotelModel.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.hotelDetail);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.5)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        Constants.hotelModel[index].hotelImage,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Constants.hotelModel[index].hotelName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      fontSize: 11.sp,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .error
                                          .withOpacity(0.8),
                                    ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 24,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    Constants.hotelModel[index].address,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            fontSize: 9.sp,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_outlined,
                                        color: Color(0xffffbb00),
                                      ),
                                      Text(
                                        "4 (24 Review)",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                fontSize: 10.sp,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    "Detail",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            fontSize: 9.sp,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    size: 10,
                                  )
                                ],
                              )
                            ]),
                      ),
                    ]),
                height: 310,
                width: 240,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
