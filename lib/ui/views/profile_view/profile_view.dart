import 'package:flutter/material.dart';
import 'package:igeku/services/constant/constant.dart';
import 'package:igeku/services/utils/clippers/star_clipper..dart';
import 'package:sizer/sizer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 30,
                ),
                ClipOval(
                  child: Container(
                    child: Image.network(
                        Constants.usersModel[2].userNetworkImage,
                        fit: BoxFit.cover),
                    height: 100,
                    width: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sajan Islam",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      ClipPath(
                        clipper: StarClipper(14),
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.error),
                          child: Center(
                            child: Icon(
                              Icons.done_outlined,
                              color: Theme.of(context).colorScheme.primary,
                              size: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "@sajan.co",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 11.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _options(context, "Following", "204"),
                      _options(context, "Followers", "2.5M"),
                      _options(context, "Close Friend", "26"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Inspiring Designers Globally",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontSize: 11.sp,
                                        color: Colors.white.withOpacity(0.8))),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.public_outlined,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.attach_file_outlined,
                              color: Colors.white.withOpacity(0.8)),
                          Text("instagram.com/sajan.co",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 11.sp,
                                      color: Colors.blue.withOpacity(0.8)))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          buttonOption(
                              context,
                              "Post",
                              "60",
                              Theme.of(context).colorScheme.onPrimary,
                              Colors.white),
                          buttonOption(
                              context,
                              "Videos",
                              "80",
                              Theme.of(context).colorScheme.secondaryContainer,
                              Colors.black),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: 60,
                              child: Stack(children: [
                                _image(0, height: 60.0, width: 60.0),
                                Positioned(
                                    left: 30,
                                    child:
                                        _image(5, height: 60.0, width: 60.0)),
                                Positioned(
                                    left: 60,
                                    child: _image(4, height: 60.0, width: 60.0))
                              ]),
                              width: 140),
                          Expanded(
                            child: Text("26 Videos In Your Drift",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontSize: 9.sp,
                                        color: Colors.white.withOpacity(0.7))),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14)),
                              width: 60,
                              height: 40.0,
                              child: Center(
                                child: Text("Take a look",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            fontSize: 8.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ]),
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.8)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _horizontalUsersContainers()
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: 10,
            right: 20,
            child: GestureDetector(
              onTap: (){

                Navigator.pop(context);
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  )),
            ))
      ],
    );
  }

  Container _horizontalUsersContainers() {
    return Container(
      height: 250,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: Constants.usersModelTwo.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 220,
                      width: 200,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(22),
                              child: Container(
                                child: Image.network(
                                    Constants
                                        .usersModelTwo[index].userNetworkImage,
                                    fit: BoxFit.cover),
                                height: 7.h,
                                width: 15.w,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            left: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    height: 60,
                                    child: Stack(children: [
                                      _image(0),
                                      Positioned(left: 10, child: _image(5)),
                                      Positioned(left: 20, child: _image(4))
                                    ]),
                                    width: 100),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: 15,
                              left: 60,
                              child: Text(
                                "20.5k",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 9.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                              left: 10,
                              bottom: 40,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "A Trip To The Mountains",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            fontSize: 7.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    _textSpan(context, "Mountains"),
                                    _textSpan(context, "Weekends"),
                                    _textSpan(context, "Trip"),
                                  ])),
                                ],
                              )),
                          Positioned(
                            top: 15,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.black.withOpacity(0.6)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(children: [
                                  Text("Public",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontSize: 10,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondaryContainer)),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                  ),
                                ]),
                              ),
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buttonOption(BuildContext context, String buttonName, item,
      Color backgroundColor, textColor) {
    return Expanded(
      child: Container(
          child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("${buttonName}",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: textColor)),
              SizedBox(width: 10),
              Container(
                child: Center(
                  child: Text(item,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .secondaryContainer)),
                ),
                height: 22,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(7)),
                width: 22,
              )
            ]),
          ),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 7, color: Theme.of(context).colorScheme.primary)),
          height: 60,
          width: 200),
    );
  }

  Column _options(BuildContext context, String follow, title) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20),
            Container(
              width: 60,
              child: Stack(children: [
                Positioned(
                  child: _image(1),
                ),
                Positioned(
                  left: 15,
                  child: _image(3),
                ),
                Positioned(
                  left: 30,
                  child: _image(4),
                )
              ]),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 11.sp,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        Center(
          child: Text(
            follow,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 10.sp,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
        ),
      ],
    );
  }

  ClipRRect _image(int index, {height = 25.0, width = 25.0}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
        child: Image.network(Constants.usersModel[index].userNetworkImage,
            fit: BoxFit.cover),
        height: height,
        width: width,
      ),
    );
  }
}

TextSpan _textSpan(BuildContext context, String text) {
  return TextSpan(
      text: "#${text}  ",
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 6.sp,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          fontWeight: FontWeight.bold));
}
