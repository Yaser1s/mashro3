// ignore_for_file: unused_local_variable, prefer_const_constructors, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:test10/firebases/auth.dart';
import 'package:test10/shared/colors.dart';
import 'package:test10/shared/custom_textfield.dart';
import 'package:test10/shared/snackbar.dart';
import 'package:test10/shared/strings.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final UserNameCnt = TextEditingController();
  final NameCnt = TextEditingController();
  final NumberOfUserCnt = TextEditingController();
  final EmailOfUserCnt = TextEditingController();
  final PasswordOfUserCnt = TextEditingController();
  bool isLoding = false;
  bool isVisable = true;

  @override
  void dispose() {
    UserNameCnt.dispose();
    NameCnt.dispose();
    NumberOfUserCnt.dispose();
    EmailOfUserCnt.dispose();
    PasswordOfUserCnt.dispose();
    super.dispose();
  }

  bool isPassword8Char = false;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasDigits = false;

  onPasswordChanged(String password) {
    isPassword8Char = false;
    hasLowercase = false;
    hasUppercase = false;
    hasDigits = false;
    wrongPasswordd = false;
    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        isPassword8Char = true;
        // "${wrongPassword} ادخل ثمانية حروف على الاقل ";
      }

      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowercase = true;
        // "${wrongPassword} ادخل حرف واحد صغير على الاقل ";
      }

      if (password.contains(RegExp(r'[A-Z]'))) {
        hasUppercase = true;
        // "${wrongPassword} ادخل حرف واحد كبير على الاقل ";
      }

      if (password.contains(RegExp(r'[0-9]'))) {
        hasDigits = true;
        // "${wrongPassword} ادخل رقم واحد على الاقل ";
      }
      if (isPassword8Char == true &&
          hasLowercase == true &&
          hasUppercase == true &&
          hasDigits == true) {
        wrongPasswordd == true;
      }
    });
  }

  bool wrongPasswordd = false;

  clickOnRigister() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoding = true;
      });
      await AuthMethod().registor(
          context: context,
          email: EmailOfUserCnt.text,
          password: PasswordOfUserCnt.text,
          name: NameCnt.text,
          phoneNumber: NumberOfUserCnt.text);
      setState(() {
        isLoding = false;
      });
    } else {
      showSnackBar(context, "ERROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: backgrond,
            body: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                    child: Stack(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SizedBox(
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  "انشاء حساب",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontFamily: "myfont",
                                      color: Colors.grey[800]),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        right: 26, left: 12),
                                    child: Form(
                                        key: _formKey,
                                        child: Column(children: [
                                          TextFormField(
                                              validator: (value) {
                                                return value!.isEmpty
                                                    ? "اكتب اسمك"
                                                    : null;
                                              },
                                              controller: NameCnt,
                                              textInputAction:
                                                  TextInputAction.next,
                                              decoration:
                                                  decorationTextfield.copyWith(
                                                      hintText:
                                                          "الاسم الثلاثي :",
                                                      icon: Icon(Icons.person,
                                                          color:
                                                              Colors.grey[700],
                                                          size: 19))),
                                          const SizedBox(height: 23),
                                          TextFormField(
                                              validator: (number) {
                                                return number!.contains(
                                                        RegExp(r'.{10,}'))
                                                    ? null
                                                    : "ادخل رقم صحيح";
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              textInputAction:
                                                  TextInputAction.next,
                                              keyboardType: TextInputType.phone,
                                              controller: NumberOfUserCnt,
                                              decoration:
                                                  decorationTextfield.copyWith(
                                                      hintText: "رقم الجوال :",
                                                      icon: Icon(Icons.phone,
                                                          color:
                                                              Colors.grey[700],
                                                          size: 19))),
                                          const SizedBox(height: 23),
                                          TextFormField(
                                              // we return "null" when something is valid
                                              validator: (email) {
                                                return email!.contains(RegExp(
                                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                                                    ? null
                                                    : "ادخل بريدًا صحيح";
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              controller: EmailOfUserCnt,
                                              textInputAction:
                                                  TextInputAction.next,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              obscureText: false,
                                              decoration:
                                                  decorationTextfield.copyWith(
                                                icon: Icon(
                                                  Icons.email,
                                                  color: Colors.grey[700],
                                                  size: 19,
                                                ),
                                                hintText:
                                                    "البريد الالكتروني : ",
                                              )),
                                          const SizedBox(height: 23),
                                          TextFormField(
                                              onChanged: (password) {
                                                onPasswordChanged(password);
                                              },
                                              validator: (password) {
                                                if (isPassword8Char == true &&
                                                    hasLowercase == true &&
                                                    hasUppercase == true &&
                                                    hasDigits == true) {
                                                  return null;
                                                } else {
                                                  return wrongPassword;
                                                }
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              textInputAction:
                                                  TextInputAction.done,
                                              controller: PasswordOfUserCnt,
                                              obscureText:
                                                  isVisable ? true : false,
                                              decoration:
                                                  decorationTextfield.copyWith(
                                                suffix: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        isVisable = !isVisable;
                                                      });
                                                    },
                                                    icon: isVisable
                                                        ? Icon(Icons.visibility,
                                                            color: Colors
                                                                .grey[700])
                                                        : Icon(
                                                            Icons
                                                                .visibility_off,
                                                            color: Colors
                                                                .lightBlue,
                                                          )),
                                                icon: Icon(
                                                  Icons.lock,
                                                  color: Colors.grey[700],
                                                  size: 19,
                                                ),
                                                hintText: "الرقم السري : ",
                                              )),
                                          const SizedBox(height: 40),
                                          ElevatedButton(
                                              onPressed: () async {
                                                clickOnRigister();
                                              },
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(
                                                      Color.fromARGB(
                                                          104, 107, 40, 6)),
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(
                                                              27)))),
                                              child: SizedBox(
                                                  height: 60,
                                                  width: double.infinity,
                                                  child: Center(
                                                      child: isLoding
                                                          ? CircularProgressIndicator(color: Colors.white)
                                                          : Text("تسجيل الحساب", style: TextStyle(fontSize: 24)))))
                                        ]))),
                                SizedBox(height: 40),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("لتسجيل الدخول",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      const Text("  عندك حساب ؟ ")
                                    ])
                              ]))),
                  Positioned(
                      left: 0,
                      child: Image.asset("assets/img/logo-2.jpeg", width: 100))
                ])))));
  }
}
