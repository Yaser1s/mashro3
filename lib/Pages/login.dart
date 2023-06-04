import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:test10/Pages/forgetpass.dart';
import 'package:test10/firebases/auth.dart';
import 'package:test10/shared/colors.dart';
import 'package:test10/shared/custom_textfield.dart';
import 'package:test10/Pages/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //
  //

  // final _formKey = GlobalKey<FormState>();

  bool isLoding = false;
  bool isVisable = true;

  //

  @override
  void dispose() {
    userNameCnt.dispose();
    passwordOfUserCnt.dispose();
    super.dispose();
  }

  final userNameCnt = TextEditingController();
  final passwordOfUserCnt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: backgrond,
            body: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(children: [
                  SingleChildScrollView(
                      child: SizedBox(
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 35,
                                ),
                                const Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "myfont"),
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/signup.svg",
                                  height: 238,
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 23),
                                      SizedBox(
                                        height: 50,
                                        child: TextField(
                                            controller: userNameCnt,
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
                                              hintText: "البريد الالكتروني : ",
                                            )),
                                      ),
                                      const SizedBox(height: 23),
                                      SizedBox(
                                        height: 50,
                                        child: TextField(
                                            textInputAction:
                                                TextInputAction.done,
                                            controller: passwordOfUserCnt,
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
                                                          size: 20,
                                                          color:
                                                              Colors.grey[700])
                                                      : const Icon(
                                                          Icons.visibility_off,
                                                          size: 20,
                                                          color:
                                                              Colors.lightBlue,
                                                        )),
                                              icon: Icon(
                                                Icons.lock,
                                                color: Colors.grey[700],
                                                size: 19,
                                              ),
                                              hintText: "الرقم السري : ",
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 23),
                                Padding(
                                    padding: const EdgeInsets.only(left: 100),
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          setState(() {
                                            isLoding = !isLoding;
                                          });

                                          await AuthMethod().signIn(
                                              emaill: userNameCnt.text,
                                              passwordd: passwordOfUserCnt.text,
                                              context: context);

                                          setState(() {
                                            isLoding = !isLoding;
                                          });
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    buttons),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            27)))),
                                        child: isLoding
                                            ? const CircularProgressIndicator(
                                                color: Colors.white)
                                            : const Text("تسجيل الدخول",
                                                style:
                                                    TextStyle(fontSize: 24)))),
                                const SizedBox(height: 7),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ForgetPass()));
                                    },
                                    style: const ButtonStyle(
                                        textStyle: MaterialStatePropertyAll(
                                            TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Color.fromARGB(
                                                    255, 70, 151, 218)))),
                                    child: const Text("هل نسيت كلمة المرور ؟")),
                                const SizedBox(height: 3),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Register()));
                                          },
                                          child: const Text("تسجيل جديد",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Color.fromARGB(
                                                      255, 70, 151, 218)))),
                                      const Text(" ليس لديك حساب ؟ "),
                                    ])
                              ]))),
                  Positioned(
                      left: 0,
                      top: 30,
                      child: SvgPicture.asset("assets/icons/logo-t.svg",
                          width: 100))
                ]))));
  }
}

  // }