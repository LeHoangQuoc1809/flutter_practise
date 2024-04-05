import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practise/src/pages/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../resources/colors.dart' as color_constants;
import '../resources/images.dart' as image_constants;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final confirmPasswordController = TextEditingController();
  int step = 0;
  int focusIndex = 0;
  final List<int> steps = [0, 1, 2, 3, 4];
  final List<String> label = ['Email', 'Name', 'Birthday', 'Gender', 'Pass'];
  final List<Color> dividerList = [
    color_constants.lineDividerColor,
    color_constants.lineDividerColor,
    color_constants.lineDividerColor,
    color_constants.lineDividerColor,
  ]; // Danh sách màu
  List<TextEditingController> controlerList = [
    TextEditingController(), //email
    TextEditingController(), //fullName
    TextEditingController(), //dateOfBirth
    TextEditingController(), //gender
    TextEditingController(), //password
  ];
  List<Map<String, Object>> myMapItemInput = [
    {'label': 'Email', 'hintText': 'Exemple@exemple.com'},
    {'label': 'Your Full Name', 'hintText': 'LeHoangQuoc'},
    {'label': 'Date of birth', 'hintText': 'DD/MM/YYYY'},
    {'label': 'Gender', 'hintText': 'Select your gender'},
    {'label': 'Password', 'hintText': 'Password'},
  ];
  List<TextEditingController> OTP_controlerList = [
    // TextEditingController(), //0
    // TextEditingController(), //1
    // TextEditingController(), //2
    // TextEditingController(), //3
    // TextEditingController(), //4
    // TextEditingController(), //5
  ];

  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(6, (index) => FocusNode());
    OTP_controlerList = List.generate(6, (index) => TextEditingController());
    _addListeners();
  }

  void _addListeners() {
    for (int i = 0; i < OTP_controlerList.length - 1; i++) {
      OTP_controlerList[i].addListener(() {
        if (OTP_controlerList[i].text.isNotEmpty) {
          FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
        }
      });
    }
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in OTP_controlerList) {
      controller.dispose();
    }
    super.dispose();
  }

  void onDismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  Future handleContinue() async {
    print("step: $step");
    final _email = controlerList[0].text;
    final _fullName = controlerList[1].text;
    final _dateOfBirth = controlerList[2].text;
    final _gender = controlerList[3].text;
    final _password = controlerList[4].text;
    final _confirmPassword = confirmPasswordController.text;
    switch (step) {
      case 0:
        if (_email.isEmpty ||
            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(_email)) {
          return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              // Return the dialog widget
              return AlertDialog(
                title: Text('Cảnh báo'),
                content: _email.isEmpty
                    ? Text('Bạn cần nhập Email')
                    : Text('Email không hợp lệ'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        } else {
          setState(() {
            print("email: $_email");
            print("fullName: $_fullName");
            print("dateOfBirth: $_dateOfBirth");
            print("gender: $_gender");
            print("password: $_password");
            print("confirmPassword: $_confirmPassword");
            print("===================================================");
            step++;
          });
        }
        break;
      case 1:
        if (_fullName.isEmpty) {
          return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              // Return the dialog widget
              return AlertDialog(
                title: Text('Cảnh báo'),
                content: Text('Bạn cần nhập Full Name'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        } else {
          setState(() {
            print("email: $_email");
            print("fullName: $_fullName");
            print("dateOfBirth: $_dateOfBirth");
            print("gender: $_gender");
            print("password: $_password");
            print("confirmPassword: $_confirmPassword");
            print("===================================================");
            step++;
          });
        }
        break;
      case 2:
        if (_dateOfBirth.isEmpty) {
          return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              // Return the dialog widget
              return AlertDialog(
                title: Text('Cảnh báo'),
                content: Text('Bạn cần chọn ngày sinh'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        } else {
          setState(() {
            print("email: $_email");
            print("fullName: $_fullName");
            print("dateOfBirth: $_dateOfBirth");
            print("gender: $_gender");
            print("password: $_password");
            print("confirmPassword: $_confirmPassword");
            print("===================================================");
            step++;
          });
        }
        break;
      case 3:
        if (_gender.isEmpty) {
          return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              // Return the dialog widget
              return AlertDialog(
                title: Text('Cảnh báo'),
                content: Text('Bạn cần chọn giới tính'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        } else {
          setState(() {
            print("email: $_email");
            print("fullName: $_fullName");
            print("dateOfBirth: $_dateOfBirth");
            print("gender: $_gender");
            print("password: $_password");
            print("confirmPassword: $_confirmPassword");
            print("===================================================");
            step++;
          });
        }
        break;
      case 4:
        if (_password.isEmpty ||
            _confirmPassword.isEmpty ||
            _password.length < 8) {
          return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              // Return the dialog widget
              return AlertDialog(
                title: Text('Cảnh báo'),
                content: _password.isEmpty
                    ? Text('Bạn cần nhập password')
                    : _password.length < 8
                        ? Text('Password phải dài hơn 8 ký tự')
                        : Text('Bạn cần nhập lại password'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        } else if (_password.compareTo(_confirmPassword) != 0) {
          return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              // Return the dialog widget
              return AlertDialog(
                title: Text('Cảnh báo'),
                content: Text('Password không trùng khớp'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        } else {
          setState(() {
            print("email: $_email");
            print("fullName: $_fullName");
            print("dateOfBirth: $_dateOfBirth");
            print("gender: $_gender");
            print("password: $_password");
            print("confirmPassword: $_confirmPassword");
            print("===================================================");
            step++;
          });
        }
        break;
      default:
    }
  }

  void handleLogin() {
    Navigator.pop(context);
  }

  void handleLoginWithGoogle() {}

  void handleLoginWittFacebook() {}

  void handleLoginWithGithub() {}

  void onChangedOTP() {}

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: step == 0 || step == 5
                ? null
                : () {
                    setState(() {
                      step--;
                    });
                    //Navigator.pop(context);
                  },
            icon: step == 0 || step == 5
                ? Container()
                : Icon(
                    Icons.arrow_back,
                    size: 30.sp,
                    color: Colors.black,
                  ),
          ),
          // GestureDetector(
          //   onTap: step == 0 || step == 5
          //       ? () {}
          //       : () {
          //           setState(() {
          //             step--;
          //           });
          //           //Navigator.pop(context);
          //         },
          //   child: step == 0 || step == 5
          //       ? Container()
          //       : Icon(
          //           Icons.arrow_back,
          //           size: 30.sp,
          //           color: Colors.black,
          //         ),
          // ),
        ),
        body: GestureDetector(
          onTap: onDismissKeyboard,
          child: ListView(
            children: <Widget>[
              Container(
                // picture start
                margin: EdgeInsets.fromLTRB(24.sp, 0.sp, 24.sp, 0.sp),
                //color: Colors.amber,
                width: 342.sp,
                height: 250.sp,
                child: step != 5
                    ? SvgPicture.string(
                        image_constants.imgSvgRegister,
                      )
                    : SvgPicture.string(
                        image_constants.imgSvgConfirmOTP,
                      ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.sp, 5.sp, 0.sp, 0.sp),
                child: Center(
                  child: Text(
                    step == 5 ? 'Enter Confirmation Code' : 'Create account',
                    maxLines: 1,
                    style: GoogleFonts.montserrat(
                        color: color_constants.neutralsColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                // Column
                margin: EdgeInsets.fromLTRB(35.sp, 10.sp, 35.sp, 32.sp),
                //color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // step by step
                    //////////////////////////////////////////////////////////
                    Container(
                      //color: Colors.green,
                      margin: EdgeInsets.only(top: 3.5.sp),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 13.5.sp),
                            width: 200.sp,
                            child: Row(
                              children: List.generate(
                                dividerList.length,
                                (index) {
                                  return Expanded(
                                    child: Container(
                                      color: index < step - 1
                                          ? color_constants.labelColor
                                          : dividerList[index],
                                      height: 3.sp,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var s in steps)
                                Container(
                                  padding: EdgeInsets.all(9.sp),
                                  // s == 0
                                  //     ? EdgeInsets.only(right: 13.sp)
                                  //     : s == 4
                                  //         ? EdgeInsets.only(left: 13.sp)
                                  //         : EdgeInsets.all(12.3.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        label[s],
                                        style: GoogleFonts.montserrat(
                                          color: s < step
                                              ? color_constants.labelColor
                                              : color_constants
                                                  .lineDividerColor,
                                          fontSize: 6.9.sp,
                                          //fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4.sp,
                                      ),
                                      SizedBox(
                                        width: 24.sp,
                                        height: 24.sp,
                                        child: SvgPicture.string(s < step
                                            ? image_constants.icSvgCheck
                                            : image_constants.icSvgNonCheck),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //////////////////////////////////////////////////////////
                    step < 4
                        ? Container(
                            margin: EdgeInsets.only(top: 22.sp),
                            child: inputItem(
                              label: myMapItemInput[step]['label'],
                              hintText: myMapItemInput[step]['hintText'],
                              controller: controlerList[step],
                            ),
                          )
                        : step == 4
                            ? Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20.sp),
                                    child: inputItem(
                                      label: myMapItemInput[step]['label'],
                                      hintText: myMapItemInput[step]
                                          ['hintText'],
                                      controller: controlerList[step],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 7.sp),
                                    child: inputItem(
                                      label: 'Confirm Password',
                                      hintText: 'Confirm Password',
                                      controller: confirmPasswordController,
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 8.sp),
                                    child: Text(
                                      'Enter the 6-digit code we sent to ${controlerList[0].text}',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 8.sp),
                                    child: Text(
                                      'Resend code',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8.sp),
                                    //color: Colors.orange,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(
                                        OTP_controlerList.length,
                                        (index) {
                                          return Container(
                                            margin: index == 0
                                                ? EdgeInsets.fromLTRB(
                                                    0.sp, 0.sp, 5.sp, 0.sp)
                                                : index == 5
                                                    ? EdgeInsets.fromLTRB(
                                                        5.sp, 0.sp, 0.sp, 0.sp)
                                                    : EdgeInsets.fromLTRB(
                                                        5.sp, 0.sp, 5.sp, 0.sp),
                                            width: 30.sp,
                                            child: TextField(
                                              onChanged: (text) {
                                                setState(() {
                                                  focusIndex++;
                                                });
                                              },
                                              enabled: index == focusIndex
                                                  ? true
                                                  : index == focusIndex + 1
                                                      ? true
                                                      : false,
                                              autofocus:
                                                  index == 0 ? true : false,
                                              focusNode: _focusNodes[index],
                                              inputFormatters: <TextInputFormatter>[
                                                LengthLimitingTextInputFormatter(
                                                    1),
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9]')),
                                                // Chỉ cho phép nhập số
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              keyboardType:
                                                  TextInputType.number,
                                              // Các thuộc tính khác của TextField
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(10.sp,
                                                        0.sp, 0.sp, 22.sp),
                                                fillColor: color_constants
                                                    .accentsColor,
                                                filled: true,
                                                hintStyle: TextStyle(
                                                  color: color_constants
                                                      .placeholderColor,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0.sp),
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              controller:
                                                  OTP_controlerList[index],
                                              style: TextStyle(
                                                color: color_constants
                                                    .neutralsColor,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                    Container(
                      width: double.infinity.sp,
                      //color: Colors.black,
                      //padding: EdgeInsets.all(16.sp),
                      margin: EdgeInsets.only(top: 25.sp),
                      child: TextButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(288.sp, 35.sp),
                          ),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0.sp),
                            ),
                          ),
                          alignment: Alignment.center,
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.orange),
                        ),
                        onPressed: handleContinue,
                        child: Text(
                          step == 4
                              ? 'Finish'
                              : step == 5
                                  ? 'Confirm'
                                  : 'Continue',
                          style: GoogleFonts.montserrat(
                            fontStyle: FontStyle.normal,
                            color: color_constants.accentsColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    step < 4
                        ? Column(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 16.sp),
                                margin: EdgeInsets.only(top: 26.sp),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Sign up with',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 13.sp,
                                          color: color_constants.neutralsColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.sp),
                                          onPressed: handleLoginWithGoogle,
                                          icon: SvgPicture.string(
                                            image_constants.icSvgGoogle,
                                          ),
                                          iconSize: 30.sp,
                                          constraints: const BoxConstraints(),
                                          style: const ButtonStyle(
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                          ),
                                        ),
                                        IconButton(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.sp),
                                          onPressed: handleLoginWittFacebook,
                                          icon: SvgPicture.string(
                                            image_constants.icSvgFacebook,
                                          ),
                                          iconSize: 30.sp,
                                          constraints: const BoxConstraints(),
                                          style: const ButtonStyle(
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                          ),
                                        ),
                                        IconButton(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.sp),
                                          onPressed: handleLoginWithGithub,
                                          icon: SvgPicture.string(
                                            image_constants.icSvgGithub,
                                          ),
                                          iconSize: 30.sp,
                                          constraints: const BoxConstraints(),
                                          style: const ButtonStyle(
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                //padding: EdgeInsets.symmetric(horizontal: 16.sp),
                                padding:
                                    EdgeInsets.fromLTRB(0.sp, 8.sp, 0.sp, 0.sp),
                                child: const Divider(
                                  color: color_constants.lineDividerColor,
                                ),
                              ),
                              Container(
                                //padding: EdgeInsets.symmetric(horizontal: 11.sp),
                                padding:
                                    EdgeInsets.fromLTRB(0.sp, 7.sp, 0.sp, 0.sp),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Have an account?',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        color: color_constants.neutralsColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.zero,
                                      child: TextButton(
                                        onPressed: handleLogin,
                                        style: const ButtonStyle(
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        child: Text(
                                          'Log in',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: color_constants.labelColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
