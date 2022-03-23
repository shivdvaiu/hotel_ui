import 'package:flutter/material.dart';
import 'package:igeku/services/constant/constant.dart';
import 'package:igeku/services/services/navigations/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({Key? key}) : super(key: key);

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 3,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CarouselSlider.builder(
                itemCount: Constants.hotelModel.length,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) =>
                        Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      Constants.hotelModel[index].hotelImage,
                      fit: BoxFit.cover,
                      height: 40.h,
                    ),
                    Positioned(
                        bottom: 15,
                        child: AnimatedSmoothIndicator(
                          activeIndex: index,
                          count: Constants.hotelModel.length,
                          effect: WormEffect(
                              dotColor: Colors.grey,
                              dotHeight: 8,
                              dotWidth: 22,
                              activeDotColor: Colors.white),
                        ))
                  ],
                ),
                options: CarouselOptions(
                  onPageChanged: (dotIndex, reason) {
                    index = dotIndex;
                    setState(() {});
                  },
                  height: 40.h,
                  autoPlay: true,
                  viewportFraction: 1.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Happiness Cafe Roastery",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 14.sp,
                                  color: colorScheme.error.withOpacity(0.8),
                                  fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 24,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Text(
                                "Jalan Ciujung Raya no 7 Slemen,Yogyakarta",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontSize: 10.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error
                                            .withOpacity(0.7),
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ...List.generate(
                                  4,
                                  (index) => Icon(
                                    Icons.star_outlined,
                                    color: Color(0xffffbb00),
                                  ),
                                ),
                                Icon(
                                  Icons.star_outlined,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Text(
                              "Rp 150k/hour",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: 10.sp,
                                      color: colorScheme.onBackground,
                                      fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "Facilities",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 11.sp,
                                  color: colorScheme.onBackground,
                                  fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _options(
                                        context, Icons.wifi_outlined, "Wifi"),
                                    SizedBox(width: 10),
                                    _options(context,
                                        Icons.room_preferences_outlined, "AC"),
                                    SizedBox(width: 10),
                                    _options(
                                        context, Icons.dark_mode, "Musholla"),
                                    SizedBox(width: 10),
                                    _options(context, Icons.coffee_outlined,
                                        "Coffee"),
                                  ]),
                            ),
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(31),
                              color: colorScheme.onSurface.withOpacity(0.5),
                            ),
                            width: double.infinity),
                        SizedBox(
                          height: 30,
                        ),

                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: Material(
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 70),
                                  child: TabBar(
                                    indicatorSize: TabBarIndicatorSize.label,
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 11.sp,
                                            color: colorScheme.onBackground,
                                            fontWeight: FontWeight.w700),
                                    labelColor: colorScheme.onBackground,
                                    unselectedLabelStyle: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            fontSize: 11.sp,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                            fontWeight: FontWeight.bold),
                                    tabs: [
                                      Tab(
                                        text: "Menu",
                                      ),
                                      Tab(text: "Review"),
                                      Tab(text: "Contact"),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(children: [
                                    _popularMenuCard(context, colorScheme),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _popularMenuCard(
                                              context, colorScheme),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          _popularMenuCard(
                                              context, colorScheme),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        )
                        // Material(
                        //   child: TabBar(tabs: [
                        //     Tab(icon: Icon(Icons.directions_car),text: "TAB 1",),
                        //     Tab(icon: Icon(Icons.directions_bike),text: "TAB 2"),
                        //     Tab(icon: Icon(Icons.directions_car),text:"TAB 3"),
                        //   ]),
                        // ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.centerRight,
                  colors: [Color(0xffebeff5), Color(0xffebeff5).withOpacity(0.9)]),
            ),
          ),
          Positioned(
              left: 20,
              top: 40,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color(0xffdbebf4)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: colorScheme.onSecondary,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              )),
          Positioned(
              right: 20,
              top: 40,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color(0xffdbebf4)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Icon(
                      Icons.bookmark,
                      color: colorScheme.onSecondary,
                      size: 25,
                    ),
                  ),
                ),
              )),
          Positioned(
            bottom: 20,
            right: 10,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.chatView);
              },
              child: Container(
                  child: Center(
                    child: Text(
                      "Book Now",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 12.sp,
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  height: 7.h,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            colorScheme.onSecondary,
                            colorScheme.primaryContainer
                          ]),
                      borderRadius: BorderRadius.circular(32))),
            ),
          )
        ],
      ),
    );
  }

  Padding _popularMenuCard(BuildContext context, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Menu",
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 11.sp,
                    color: colorScheme.onBackground,
                    fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Text(
                "See All",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 11.sp,
                    color: colorScheme.onSecondary,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Container(
                  child: Icon(
                    Icons.bookmark,
                    color: colorScheme.onSecondary,
                  ),
                  height: 100,
                  width: 55,
                  decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(14))),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              child: Image.network(
                                "https://www.thespruceeats.com/thmb/BYOHKcXhja-ez7Fr9obgBrDHJ1Y=/3064x2042/filters:fill(auto,1)/easy-chocolate-ice-cream-recipe-1945798-hero-01-45d9f26a0aaf4c1dba38d7e0a2ab51e2.jpg",
                                fit: BoxFit.cover,
                              ),
                              height: 8.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Berry Gelato",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: 11.sp,
                                        color: colorScheme.onBackground,
                                        fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Double flavors of berry",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontSize: 9.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 9),
                              Text(
                                "Rp 25,000",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontSize: 9.sp,
                                        color: colorScheme.primaryContainer,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: colorScheme.onSurface.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12)),
                  width: double.infinity,
                  height: 100,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  Row _options(BuildContext context, IconData iconData, String option) {
    return Row(children: [
      Icon(
        iconData,
        color: Theme.of(context).colorScheme.primary,
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        option,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: 9.sp,
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.bold),
      )
    ]);
  }
}
