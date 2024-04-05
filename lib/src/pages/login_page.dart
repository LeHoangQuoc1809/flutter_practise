import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../resources/colors.dart' as color_constants;
import '../resources/images.dart' as image_constants;
import '/src/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onDismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  Future<void> handleLogin() async {
    final _email = emailController.text;
    final _password = passwordController.text;
    if (_email.isEmpty ||
        _password.isEmpty ||
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
                : _password.isEmpty
                    ? Text('Bạn cần nhập Password')
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
    } else if (_password.length < 8) {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          // Return the dialog widget
          return AlertDialog(
            title: Text('Cảnh báo'),
            content: Text('Password phải lớn hơn 8 ký tự'),
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
    } else {}
  }

  void handleLoginWithGoogle() {}

  void handleLoginWittFacebook() {}

  void handleLoginWithGithub() {}

  void handleSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
    //
    emailController.text = '';
    passwordController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          //backgroundColor: Colors.red,
          body: GestureDetector(
            onTap: onDismissKeyboard,
            child: ListView(
              children: <Widget>[
                Container(
                  // picture start
                  margin: EdgeInsets.fromLTRB(24.sp, 0.sp, 24.sp, 0.sp),
                  //color: Colors.amber,
                  width: 342.sp,
                  height: 280.sp,
                  child: SvgPicture.string(
                    image_constants.imgSvgLogin,
                  ),
                ),
                Container(
                  // label Log in
                  margin: EdgeInsets.fromLTRB(0.sp, 7.sp, 0.sp, 0.sp),
                  child: Center(
                    child: Text(
                      'Log in',
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                        color: color_constants.neutralsColor,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  // Column
                  margin: EdgeInsets.fromLTRB(35.sp, 20.sp, 35.sp, 32.sp),
                  //color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      inputItem(
                        label: 'Email',
                        hintText: 'Exemple@exemple.com',
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      inputItem(
                        label: 'Password',
                        hintText: 'Password',
                        controller: passwordController,
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
                            shape: MaterialStatePropertyAll<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0.sp),
                              ),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.orange),
                          ),
                          onPressed: handleLogin,
                          child: Text(
                            'Login',
                            style: GoogleFonts.montserrat(
                              fontStyle: FontStyle.normal,
                              color: color_constants.accentsColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        margin: EdgeInsets.only(top: 26.sp),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Log in with',
                              style: GoogleFonts.montserrat(
                                  fontSize: 13.sp,
                                  color: color_constants.neutralsColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  onPressed: handleLoginWithGoogle,
                                  icon: SvgPicture.string(
                                    image_constants.icSvgGoogle,
                                  ),
                                  iconSize: 30.sp,
                                  constraints: const BoxConstraints(),
                                  style: const ButtonStyle(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                                IconButton(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  onPressed: handleLoginWittFacebook,
                                  icon: SvgPicture.string(
                                    image_constants.icSvgFacebook,
                                  ),
                                  iconSize: 30.sp,
                                  constraints: const BoxConstraints(),
                                  style: const ButtonStyle(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                                IconButton(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  onPressed: handleLoginWithGithub,
                                  icon: SvgPicture.string(
                                    image_constants.icSvgGithub,
                                  ),
                                  iconSize: 30.sp,
                                  constraints: const BoxConstraints(),
                                  style: const ButtonStyle(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        //padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        padding: EdgeInsets.fromLTRB(0.sp, 8.sp, 0.sp, 0.sp),
                        child: const Divider(
                          color: color_constants.lineDividerColor,
                        ),
                      ),
                      Container(
                        //padding: EdgeInsets.symmetric(horizontal: 11.sp),
                        padding: EdgeInsets.fromLTRB(0.sp, 7.sp, 0.sp, 0.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'No account?',
                              style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                color: color_constants.neutralsColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: TextButton(
                                onPressed: handleSignUp,
                                style: const ButtonStyle(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'Sign up',
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
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class inputItem extends StatefulWidget {
  inputItem({
    super.key,
    required this.label,
    this.hintText,
    required this.controller,
  });

  late final controller;
  final label;
  final hintText;

  @override
  State<inputItem> createState() => _inputItemState();
}

class _inputItemState extends State<inputItem> {
  DateTime selectedDate = DateTime.now();
  String dateOfBirth = 'DD/MM/YYYY';
  List<String> genderItems = <String>['Male', 'Female', 'Prefer not to say'];
  String? selectedGender;
  bool dropdownOpened = false;
  bool showIndicator =
      false; // Biến để kiểm tra xem một mục đã được chọn hay không

  Future<void> _selecteDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 18),
      firstDate: DateTime(DateTime.now().year - 60),
      lastDate: DateTime(DateTime.now().year - 18),
      barrierDismissible: false,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateOfBirth = DateFormat('dd-MM-yyyy').format(selectedDate).toString();
        widget.controller.text = dateOfBirth;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedGender = genderItems[0].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 8.sp),
          child: Text(
            widget.label,
            style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                color: color_constants.neutralsColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          height: 35.sp,
          //color: Colors.green,
          margin: EdgeInsets.only(top: 4.sp),
          child: widget.label == 'Date of birth' // Gọi Date of birth
              ? Container(
                  decoration: BoxDecoration(
                    color: color_constants.accentsColor,
                    borderRadius: BorderRadius.circular(15.0.sp),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _selecteDate(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          color_constants.accentsColor),
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size(double.infinity.sp, double.infinity.sp)),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 6.sp),
                      width: double.infinity.sp,
                      child: Text(
                        dateOfBirth,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: color_constants.placeholderColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                )
              : widget.label == 'Gender' // Gọi Date of birth
                  ? Container(
                      width: double.infinity.sp,
                      decoration: BoxDecoration(
                        color: color_constants.accentsColor,
                        borderRadius: BorderRadius.circular(15.0.sp),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          padding: EdgeInsets.fromLTRB(10.sp, 0.sp, 0.sp, 0.sp),
                          alignment: Alignment.centerLeft,
                          borderRadius: BorderRadius.circular(15.0.sp),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 30.0.sp,
                            color: Colors.black87,
                          ),
                          dropdownColor: Colors.white,
                          value: widget.controller.text = selectedGender,
                          items: genderItems.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem<String>(
                              value: e,
                              child: Row(
                                children: [
                                  // Chấm tròn để chỉ định mục đã được chọn
                                  // Container(
                                  //   width: 12.sp,
                                  //   height: 12.sp,
                                  //   margin: EdgeInsets.only(right: 10.sp),
                                  //   decoration: BoxDecoration(
                                  //     shape: BoxShape.circle,
                                  //     color:
                                  //         showIndicator && e == selectedGender
                                  //             ? Colors.black87
                                  //             : color_constants.accentsColor,
                                  //   ),
                                  // ),
                                  Text(
                                    e,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              selectedGender = value.toString();
                              print("Gender: $value");
                              widget.controller.text = selectedGender;
                              // showIndicator = value == null
                              //     ? false
                              //     : true; // Xác định xem chấm tròn có hiển thị hay không
                            });
                          },
                        ),
                      ),
                    )
                  : TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(13.sp, 0.sp, 13.sp, 14.sp),
                        fillColor: color_constants.accentsColor,
                        filled: true,
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                          color: color_constants.placeholderColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0.sp),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      controller: widget.controller,
                      style: TextStyle(
                        color: color_constants.neutralsColor,
                        fontSize: 14.sp,
                      ),
                    ),
        ),
      ],
    );
  }
}
