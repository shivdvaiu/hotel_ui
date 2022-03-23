import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:igeku/ui/widgets/bottom_nav_bar.dart';
import 'package:igeku/ui/widgets/dummy_users.dart';
import 'package:igeku/ui/widgets/text_field.dart';
import 'package:sizer/sizer.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Padding(
          padding: MediaQuery.of(context).viewPadding,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                SizedBox(width: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:
                        Icon(Icons.arrow_back_ios, color: colorScheme.primary)),
                SizedBox(width: 20),
                ClipOval(
                  child: Container(
                      height: 40,
                      width: 40,
                      child: Image.network(
                        "https://media.istockphoto.com/photos/headshot-of-a-teenage-boy-picture-id1158014305?k=20&m=1158014305&s=612x612&w=0&h=RgcRlPfHFZA4OWSROC46FgBILIQVyiS6o_EmyZAMt4M=",
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Pak Wisnu",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 11.sp,
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Online",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 10.sp,
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.more_vert_outlined,
                  color: colorScheme.primary,
                  size: 35,
                ),
                SizedBox(width: 20),
              ],
            ),
            height: 90,
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: colorScheme.onSurface.withOpacity(0.7),
        height: 80,
        child: Row(children: [
          SizedBox(
            width: 20,
          ),
          _buildIcon(colorScheme, Icons.insert_emoticon_outlined),
          SizedBox(width: 10),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Message",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(
                                fontSize: 11.sp,
                                color: colorScheme.onSecondary,
                                fontWeight: FontWeight.w600),
                      ),
                    ))),
          ),
          SizedBox(width: 10),
          _buildIcon(
            colorScheme,
            Icons.mic_outlined,
          ),
          SizedBox(width: 10),
          _buildIcon(colorScheme, Icons.attach_file_outlined),
          SizedBox(width: 10),
        ]),
      ),
      body: Container(
        child: ListView(children: [

          SizedBox(height: 20),
          _firstContainer(context, colorScheme),
          SizedBox(
            height: 20,
          ),
          _secondContainer(context, colorScheme),
          SizedBox(height: 10),
          _firstContainer(context, colorScheme),
          SizedBox(
            height: 20,
          ),
          _secondContainer(context, colorScheme),
          SizedBox(height: 10),
          _firstContainer(context, colorScheme),
          SizedBox(
            height: 30,
          ),
          _secondContainer(context, colorScheme)
        ]),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.centerRight,
              colors: [Color(0xffebeff5), Color(0xffebeff5).withOpacity(0.7)]),
        ),
      ),
    );
  }

  Column _secondContainer(BuildContext context, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(

          margin: EdgeInsets.only(left: 10),
          child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Text(
              "Hello pak,bisa reservasi cafena untuk acara workshop ?",
              style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 10.sp,
                  color: colorScheme.onSecondary,
                  fontWeight: FontWeight.w600),
            ),
          ),
          decoration: BoxDecoration(
              color: colorScheme.onSurface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(22),
                bottomLeft: Radius.circular(22),
              )),
          width: 290,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "8:50",
            style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 10.sp,
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  Column _firstContainer(BuildContext context, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
                   margin: EdgeInsets.only(right: 10),
          child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Text(
              "Hello pak,bisa reservasi cafena untuk acara workshop ?",
              style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 10.sp,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w500),
            ),
          ),
          decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
                bottomLeft: Radius.circular(22),
              )),
          width: 290,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Seen 8:43",
            style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 10.sp,
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  Container _buildIcon(ColorScheme colorScheme, IconData icon) {
    return Container(
      decoration: BoxDecoration(
          color: colorScheme.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Icon(icon, color: colorScheme.onSecondary),
      ),
    );
  }
}
