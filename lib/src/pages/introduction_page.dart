import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../resources/images.dart' as image_constants;

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  List introductionList = [
    {
      'index': '0',
      'title': 'Pay bills at the most appropriate time',
      'image': image_constants.imgSvgHeader1,
      'detail': 'Get occasional reminders to pay your bill at the '
          'right time and before deadlines. We help you '
          'avoid the rush that comes with forgetting to pay '
          'a bill by send- ing you reminders according to the '
          'importance of the bill.',
    },
    {
      'index': '1',
      'title': 'Categorize your bills accordingly',
      'image': image_constants.imgSvgHeader2,
      'detail': 'Create new bills with a due date, automated or '
          'customized category, amount, reminder type'
          '     with an optional note. Archive, delete or snooze '
          'bills according to their present states, and '
          'categories bills inder one-time or recurrent bill '
          'type',
    },
    {
      'index': '2',
      'title': 'Keep track of your expenses',
      'image': image_constants.imgSvgHeader3,
      'detail': 'Get weekly, monthly and yearly reports of your '
          'bills and what categories they fall under. Have'
          '    an overview of what category takes the most '
          'portion of your expenses, and an overview of how '
          'often you paid bills',
    },
  ];

  void onDismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  void onChangPage(int index) {}

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: GestureDetector(
            onTap: onDismissKeyboard,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  onPageChanged: (index) {
                    onChangPage(index);
                  },
                  pageSnapping: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    introductionItem(
                      index: introductionList[0]['index'],
                      image: introductionList[0]['image'],
                      title: introductionList[0]['title'],
                      detail: introductionList[0]['detail'],
                    ),
                    introductionItem(
                      index: introductionList[1]['index'],
                      image: introductionList[1]['image'],
                      title: introductionList[1]['title'],
                      detail: introductionList[1]['detail'],
                    ),
                    introductionItem(
                      index: introductionList[2]['index'],
                      image: introductionList[2]['image'],
                      title: introductionList[2]['title'],
                      detail: introductionList[2]['detail'],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class introductionItem extends StatelessWidget {
  introductionItem({
    super.key,
    required this.index,
    required this.image,
    required this.title,
    required this.detail,
  });

  String index, title, detail, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //color: Colors.cyan,
          //width: 300.sp,
          width: double.infinity.sp,
          height: 290.sp,
          child: SvgPicture.string(image),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(12.sp, 55.sp, 12.sp, 0.sp),
          //color: Colors.cyan,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(12.sp, 10.sp, 12.sp, 0.sp),
          //color: Colors.green,
          child: Text(
            detail,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Container(
          child: TextButton(
            onPressed: null,
            child: Text('Create an account'),
            style: ButtonStyle(),
          ),
        ),
      ],
    );
  }
}
