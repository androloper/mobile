import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:login_screen_with_tokens/services/api.dart';
import 'package:login_screen_with_tokens/ui/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginFormKey = GlobalKey<FormState>();
  var registerFormKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var pwdController = TextEditingController();
  var phoneController = TextEditingController();
  int groupValue = 0;
  final api = ApiServices();

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CupertinoPageScaffold(
          backgroundColor: Colors.red,
          child: SafeArea(
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: EdgeInsets.only(top: 64.0, bottom: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 64),
                      child: Text(
                        "Frontends Union",
                        style: TextStyle(
                          fontSize: 32,
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 32, right: 32),
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
                              groupValue: groupValue,
                              children: {0: Text("Login"), 1: Text("Register")},
                              onValueChanged: (groupValue) {
                                setState(() {
                                  this.groupValue = int.parse(groupValue.toString());
                                });
                              },
                            ),
                          ),
                          (groupValue == 0)? _buildLogin() : _buildRegister(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    else {
      // ANDROID
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.amberAccent,
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(top: 64.0, bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 32.0),
                    child: Text(
                      "Frontends Union",
                      style: TextStyle(
                        fontSize: 32,
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 32, right: 32),
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
                            groupValue: groupValue,
                            children: {0: Text("Login"), 1: Text("Register")},
                            onValueChanged: (groupValue) {
                              setState(() {
                                this.groupValue = int.parse(groupValue.toString());
                              });
                            },
                          ),
                        ),
                        (groupValue == 0)? _buildLogin() : _buildRegister(),
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
  }

  Form _buildLogin() {
    if(Platform.isIOS){
      return Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 15),
              child: CupertinoFormSection(
                children: [
                  CupertinoTextFormFieldRow(
                    validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? "Please enter valid e-mail."
                        : null,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                    ],
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    padding: EdgeInsets.all(16),
                    placeholder: "E-mail",
                    prefix: Icon(
                      CupertinoIcons.mail,
                      color: Colors.amberAccent,
                    ),
                    cursorColor: Colors.amberAccent,
                  ),
                  CupertinoTextFormFieldRow(
                    validator: (pwd){
                      if(pwd == null ||  pwd.isEmpty){
                        return "Please enter valid password.";
                      }else{
                        return null;
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                    ],
                    controller: pwdController,
                    obscureText: true,
                    padding: EdgeInsets.all(16),
                    maxLength: 30,
                    placeholder: "Password",
                    prefix: Icon(
                      CupertinoIcons.lock,
                      color: Colors.amberAccent,
                    ),
                    cursorColor: Colors.amberAccent,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: CupertinoButton(
                color: Colors.amberAccent,
                child: Text("Login"),
                onPressed: () async{
                  loginFormKey.currentState!.save();
                  if(loginFormKey.currentState!.validate()){
                    var prefs = await SharedPreferences.getInstance();
                    try{
                      await api.login(emailController.text.trim(), pwdController.text);
                      if(api.accessTokenData != null){
                        await prefs.setString('accessToken', api.accessTokenData);
                        await prefs.setString('refreshToken', api.refreshTokenData);
                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) => WelcomePageScreen()));
                      }
                    }catch(e){
                      return showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) => CupertinoAlertDialog(
                            title: Text("Wrong Attempt"),
                            content: Text("You have entered an incorrect email or password."),
                            actions: [
                              CupertinoDialogAction(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ));
                    }
                  }
                },
              ),
            ),
          ],
        ),
      );
    }else{
      return Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
              child: TextFormField(
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? "Please enter valid e-mail."
                    : null,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                ],
                textInputAction: TextInputAction.next,
                controller: emailController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.mail,
                    color: Colors.amberAccent,
                  ),
                  hintText: "E-mail",
                ),
                cursorColor: Colors.amberAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
              child: TextFormField(
                validator: (pwd){
                  if(pwd == null ||  pwd.isEmpty){
                    return "Please enter valid password.";
                  }else{
                    return null;
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                ],
                controller: pwdController,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.amberAccent,
                  ),
                  hintText: "Password",
                ),
                cursorColor: Colors.amberAccent,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
                child: Text("Login"),
                onPressed: () async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  loginFormKey.currentState!.save();
                  if(loginFormKey.currentState!.validate()){
                    try{
                      await api.login(emailController.text.trim(), pwdController.text);
                      if(api.accessTokenData != null){
                        await prefs.setString('accessToken', api.accessTokenData);
                        await prefs.setString('refreshToken', api.refreshTokenData);
                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) => WelcomePageScreen()));
                      }
                    }catch(e){
                      return showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text("Wrong Attempt"),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    Text("You have entered an incorrect email or password.")
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
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

  Form _buildRegister() {
    if(Platform.isIOS){
      return Form(
        key: registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 15),
              child: CupertinoFormSection(
                children: [
                  CupertinoTextFormFieldRow(
                    validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? "Please enter valid e-mail."
                        : null,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                    ],
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    padding: EdgeInsets.all(16),
                    placeholder: "E-mail",
                    prefix: Icon(
                      CupertinoIcons.mail,
                      color: Colors.amberAccent,
                    ),
                    cursorColor: Colors.amberAccent,
                  ),
                  CupertinoTextFormFieldRow(
                    validator: (phone){
                      if(phone!.length != 10){
                        return "Please enter valid phone number.";
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                    ],
                    textInputAction: TextInputAction.next,
                    controller: phoneController,
                    padding: EdgeInsets.all(16),
                    placeholder: "5XX XXX XX XX",
                    prefix: Icon(
                      CupertinoIcons.phone,
                      color: Colors.amberAccent,
                    ),
                    cursorColor: Colors.amberAccent,
                  ),
                  CupertinoTextFormFieldRow(
                    validator: (pwd){
                      if(pwd == null ||  pwd.isEmpty){
                        return "Please enter valid password.";
                      }else if(pwd.length <= 8){
                        return "Password must be at least 8 characters. ";
                      }else{
                        return null;
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                    ],
                    controller: pwdController,
                    obscureText: true,
                    padding: EdgeInsets.all(16),
                    maxLength: 20,
                    placeholder: "Password",
                    prefix: Icon(
                      CupertinoIcons.lock,
                      color: Colors.amberAccent,
                    ),
                    cursorColor: Colors.amberAccent,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: CupertinoButton(
                color: Colors.amberAccent,
                child: Text("Register"),
                onPressed: () async{
                  registerFormKey.currentState!.save();
                  if(registerFormKey.currentState!.validate()){
                    String token = await api.clientCredentials();
                    await api.signup(emailController.text, phoneController.text, pwdController.text, token);
                    if(token != null){
                      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) => WelcomePageScreen()));
                    }
                  }
                },
              ),
            ),
          ],
        ),
      );
    }else{
      return Form(
        key: registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
              child: TextFormField(
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? "Please enter valid e-mail."
                    : null,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                ],
                textInputAction: TextInputAction.next,
                controller: emailController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.mail,
                    color: Colors.amberAccent,
                  ),
                  hintText: "E-mail",
                ),
                cursorColor: Colors.amberAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
              child: TextFormField(
                validator: (phone){
                  if(phone!.length != 10){
                    return "Please enter valid phone number.";
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                ],
                textInputAction: TextInputAction.next,
                controller: phoneController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.amberAccent,
                  ),
                  hintText: "5XX XXX XX XX",
                ),
                cursorColor: Colors.amberAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
              child: TextFormField(
                validator: (pwd){
                  if(pwd == null ||  pwd.isEmpty){
                    return "Please enter valid password.";
                  }else{
                    return null;
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                ],
                controller: pwdController,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.amberAccent,
                  ),
                  hintText: "Password",
                ),
                cursorColor: Colors.amberAccent,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
                child: Text("Register"),
                onPressed: () async{
                  registerFormKey.currentState!.save();
                  if(registerFormKey.currentState!.validate()){
                    String token = await api.clientCredentials();
                    await api.signup(emailController.text, phoneController.text, pwdController.text, token);
                    if(token != null){

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => WelcomePageScreen()));
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
}
