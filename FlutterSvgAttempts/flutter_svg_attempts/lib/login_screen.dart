import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_attempts/login_api.dart';
import 'package:flutter_svg_attempts/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  var loginFormKey = GlobalKey<FormState>();
  var registerFormKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var pwdController = TextEditingController();
  var phoneController = TextEditingController();
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(top: 64.0, bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Column(
                      children: [
                        Text(
                          "Unifortunately",
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 28, right: 28),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 24.0, top: 24),
                          child: CupertinoSlidingSegmentedControl(
                            backgroundColor: Colors.blueGrey,
                            thumbColor: Colors.blue,
                            groupValue: groupValue,
                            children: {
                              0: Text("Giriş Yap", style: TextStyle(color: CupertinoColors.white),),
                              1: Text("Şifremi Unuttum", style: TextStyle(color: CupertinoColors.white),)
                            },
                            onValueChanged: (groupValue) {
                              setState(() {
                                this.groupValue = int.parse(groupValue.toString());
                              });
                            },
                          ),
                        ),
                        (groupValue == 0)? _buildLogin() : _buildLogin(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

  Form _buildLogin() {
      return Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
              child: TextFormField(
                validator: (username) =>
                username!.length<4 || username == null
                    ? "Lütfen kullanıcı adınızı doğru giriniz."
                    : null,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                ],
                textInputAction: TextInputAction.next,
                controller: usernameController,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.blue,
                  ),
                  hintText: "Kullanıcı Adı",
                ),
                cursorColor: Colors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
              child: TextFormField(
                style: TextStyle(color: Colors.blue),
                validator: (pwd){
                  if(pwd == null ||  pwd.isEmpty || pwd.length<2){
                    return "Lütfen şifrenizi doğru giriniz.";
                  }else{
                    return null;
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                ],
                controller: pwdController,
                obscureText: hidePassword,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                  hintText: "Şifre",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    color: Colors.blue,
                    icon: Icon(hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                cursorColor: Colors.blue,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                child: Text("Giriş Yap"),
                onPressed: () async{
                  loginFormKey.currentState!.save();
                  if(loginFormKey.currentState!.validate()){
                    try{
                        final response = await LoginApi().login(
                            usernameController.text, pwdController.text);
                        debugPrint(response.id.toString());
                        if (response.id != 0) {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (BuildContext context) => MyHomePage()));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Hatalı Deneme"),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        Text(
                                            "İnternet bağlantınızı, kullanıcı adı veya şifrenizi kontrol edip tekrar deneyiniz.")
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Tamam'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              }
                          );
                        }
                    }
                    catch(e){
                      debugPrint(e.toString());
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Hatalı Deneme"),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    Text(
                                        "İnternet bağlantınızı, kullanıcı adı veya şifrenizi kontrol edip tekrar deneyiniz.")
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('Tamam'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          }
                      );
                    }
                  }
                },
              ),
            ),

          ],
        ),
      );
    }
  }
