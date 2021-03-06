import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:notmerkezi/account/models/user.dart';
import 'package:notmerkezi/account/services/account_api.dart';
import 'package:notmerkezi/ui/widgets/kf-drawer/main_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _validatePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool _validateMobile(String value) {
    String pattern = r'(^[0-9]{10}$)';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  var loginFormKey = GlobalKey<FormState>();
  var registerFormKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var pwdController = TextEditingController();
  var nameController = TextEditingController();
  var schoolController = TextEditingController();
  var phoneController = TextEditingController();
  int groupValue = 0;

  final api = AccountAPI();

  @override
  Widget build(BuildContext context) {
    // if (Platform.isIOS) {
    //   return GestureDetector(
    //     onTap: () => FocusScope.of(context).unfocus(),
    //     child: CupertinoPageScaffold(
    //       backgroundColor: Colors.indigo,
    //       child: SafeArea(
    //         child: SingleChildScrollView(
    //           reverse: true,
    //           child: Padding(
    //             padding: EdgeInsets.only(top: 64.0, bottom: 8.0),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Padding(
    //                   padding: EdgeInsets.only(bottom: 50),
    //                   child: Column(
    //                     children: [
    //                       Text(
    //                         "Most Otomasyon",
    //                         style: TextStyle(
    //                           fontSize: 28,
    //                           color: Colors.amberAccent,
    //                           fontWeight: FontWeight.w700,
    //                         ),
    //                       ),
    //                       Text(
    //                         "Fabrika Kontrol Paneli",
    //                         style: TextStyle(
    //                           fontSize: 28,
    //                           color: Colors.amberAccent,
    //                           fontWeight: FontWeight.w700,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: EdgeInsets.only(left: 24, right: 24),
    //                   alignment: Alignment.center,
    //                   decoration: BoxDecoration(
    //                     color: CupertinoColors.white,
    //                     borderRadius: BorderRadius.circular(40),
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(bottom: 24.0, top: 24),
    //                         child: CupertinoSlidingSegmentedControl(
    //                           backgroundColor: Colors.amberAccent,
    //                           groupValue: groupValue,
    //                           thumbColor: Colors.indigo,
    //                           children: {0: Text("Giri?? Yap", style: TextStyle(color: CupertinoColors.white),), 1: Text("??ifremi Unuttum", style: TextStyle(color: CupertinoColors.white),)},
    //                           onValueChanged: (groupValue) {
    //                             setState(() {
    //                               this.groupValue = int.parse(groupValue.toString());
    //                             });
    //                           },
    //                         ),
    //                       ),
    //                       (groupValue == 0)? _buildLogin() : _buildRegister(),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }
    // else {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.indigo,
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
                        "Not Merkezi",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.amberAccent,
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
                          backgroundColor: Colors.amberAccent,
                          thumbColor: Colors.indigo,
                          groupValue: groupValue,
                          children: {
                            0: Text(
                              "Giri?? Yap",
                              style: TextStyle(color: CupertinoColors.white),
                            ),
                            1: Text(
                              "Kay??t Ol",
                              style: TextStyle(color: CupertinoColors.white),
                            )
                          },
                          onValueChanged: (groupValue) {
                            setState(() {
                              this.groupValue = int.parse(groupValue.toString());
                            });
                          },
                        ),
                      ),
                      (groupValue == 0) ? _buildLogin() : _buildRegister(),
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
    // if(Platform.isIOS){
    //   return Form(
    //     key: loginFormKey,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.fromLTRB(25, 0, 25, 15),
    //           child: CupertinoFormSection(
    //             decoration: BoxDecoration(
    //               color: CupertinoColors.white,
    //             ),
    //             children: [
    //               CupertinoTextFormFieldRow(
    //                 validator: (username) =>
    //                 username!.length<4 || username == null
    //                     ? "L??tfen kullan??c?? ad??n??z?? do??ru giriniz."
    //                     : null,
    //                 inputFormatters: [
    //                   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
    //                 ],
    //                 textInputAction: TextInputAction.next,
    //                 controller: usernameController,
    //                 padding: EdgeInsets.all(16),
    //                 placeholder: "Kullan??c?? Ad??",
    //                 placeholderStyle: TextStyle(color: CupertinoColors.systemGrey),
    //                 style: TextStyle(color: Colors.indigo),
    //                 prefix: Icon(
    //                   CupertinoIcons.profile_circled,
    //                   color: Colors.indigo,
    //                 ),
    //                 cursorColor: Colors.indigo,
    //               ),
    //               CupertinoTextFormFieldRow(
    //                 validator: (pwd){
    //                   if(pwd == null ||  pwd.isEmpty || pwd.length<2){
    //                     return "L??tfen ??ifrenizi do??ru giriniz.";
    //                   }else{
    //                     return null;
    //                   }
    //                 },
    //                 inputFormatters: [
    //                   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
    //                 ],
    //                 controller: pwdController,
    //                 obscureText: true,
    //                 padding: EdgeInsets.all(16),
    //                 maxLength: 30,
    //                 placeholder: "??ifre",
    //                 placeholderStyle: TextStyle(color: CupertinoColors.systemGrey),
    //                 style: TextStyle(color: Colors.indigo),
    //                 prefix: Icon(
    //                   CupertinoIcons.lock,
    //                   color: Colors.indigo,
    //                 ),
    //                 cursorColor: Colors.indigo,
    //               ),
    //             ],
    //           ),
    //         ),
    //
    //         Padding(
    //           padding: const EdgeInsets.only(bottom: 24.0),
    //           child: CupertinoButton(
    //             color: Colors.indigo,
    //             child: Text("Giri?? Yap", style: TextStyle(color:CupertinoColors.white),),
    //             onPressed: () async{
    //               loginFormKey.currentState!.save();
    //               if(loginFormKey.currentState!.validate()){
    //                 try{
    //                   final response = await api.login(usernameController.text, pwdController.text);
    //                   final prefs = await SharedPreferences.getInstance();
    //                   final messaging = FirebaseMessaging.instance;
    //                   messaging.requestPermission(sound: true, alert: true, badge: true, criticalAlert: true);
    //                   messaging.getToken().then((value) async {
    //                     await prefs.setString('fcmToken', value!);
    //                   });
    //                   if(response != null){
    //                     var token = prefs.getString('fcmToken');
    //                     Response resp = await api.loginComplete(LoginApi.userId, token!=null ? token : generateRandomString(128));
    //                     // if(resp.statusCode == 200) {
    //                     Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) => MainWidget()));
    //                     // }
    //                   }
    //                 }catch(e){
    //                   if(Platform.isIOS){
    //                     return showCupertinoDialog(
    //                       context: context,
    //                       builder: (BuildContext context) => CupertinoAlertDialog(
    //                         title: Text("Hatal?? Deneme"),
    //                         content: Text("Yanl???? kullan??c?? ad?? veya ??ifre girdiniz."),
    //                         actions: [
    //                           CupertinoDialogAction(
    //                             child: Text("Tamam",style: TextStyle(color: CupertinoColors.systemRed),),
    //                             onPressed: (){
    //                               Navigator.pop(context);
    //                             },
    //                           ),
    //                         ],
    //                       ),);
    //                   }
    //                   if(Platform.isAndroid) {
    //                     return showDialog(
    //                         context: context,
    //                         builder: (BuildContext context) {
    //                           return AlertDialog(
    //                             title: Text("Hatal?? Deneme"),
    //                             content: SingleChildScrollView(
    //                               child: ListBody(
    //                                 children: [
    //                                   Text(
    //                                       "Yanl???? kullan??c?? ad?? veya ??ifre girdiniz.")
    //                                 ],
    //                               ),
    //                             ),
    //                             actions: [
    //                               TextButton(
    //                                 child: const Text('Tamam'),
    //                                 onPressed: () {
    //                                   Navigator.of(context).pop();
    //                                 },
    //                               ),
    //                             ],
    //                           );
    //                         }
    //                     );
    //                   }
    //                 }
    //               }
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    // else{
    return Form(
      key: loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
            child: TextFormField(
              validator: (email) => email != null && !EmailValidator.validate(email)
                  ? "Ge??erli bir e-posta giriniz."
                  : null,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
              ],
              textInputAction: TextInputAction.next,
              controller: emailController,
              style: TextStyle(color: Colors.indigo),
              decoration: InputDecoration(
                icon: Icon(
                  CupertinoIcons.mail,
                  color: Colors.indigo,
                ),
                hintText: "E-posta",
              ),
              cursorColor: Colors.indigo,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
            child: TextFormField(
              style: TextStyle(color: Colors.indigo),
              validator: (pwd) {
                if (pwd == null || pwd.isEmpty || pwd.length < 2) {
                  return "L??tfen ??ifrenizi do??ru giriniz.";
                } else {
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
                  color: Colors.indigo,
                ),
                hintText: "??ifre",
              ),
              cursorColor: Colors.indigo,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)),
              child: Text("Giri?? Yap"),
              onPressed: () async {
                // loginFormKey.currentState!.save();
                // if (loginFormKey.currentState!.validate()) {
                //   try {
                //     final response = await api.login(emailController.text, pwdController.text);
                //     final prefs = await SharedPreferences.getInstance();
                    // final messaging = FirebaseMessaging.instance;
                    // messaging.requestPermission(sound: true, alert: true, badge: true, criticalAlert: true);
                    // messaging.getToken().then((value) async {
                    //   await prefs.setString('fcmToken', value!);
                    // });
                    // if(response != null){
                    //   var token = prefs.getString('fcmToken');
                    //   Response resp = await api.loginComplete(LoginApi.userId, token!=null ? token : generateRandomString(128));
                    // if (response.statusCode == 200) {
                    //   prefs.setString('email', emailController.text);
                    //   prefs.setString('password', pwdController.text);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) => MainWidget()));
                      // }
              //       } else {
              //         debugPrint('buraya d????t??');
              //       }
              //     } catch (e) {
              //       print(e);
              //       return showCupertinoDialog(
              //           context: context,
              //           builder: (BuildContext context) => CupertinoAlertDialog(
              //                 title: Text("Hatal?? Deneme"),
              //                 content: Text("Yanl???? kullan??c?? ad?? veya ??ifre girdiniz."),
              //                 actions: [
              //                   CupertinoDialogAction(
              //                     child: Text("Tamam"),
              //                     onPressed: () {
              //                       Navigator.pop(context);
              //                     },
              //                   ),
              //                 ],
              //               ));
              //     }
              //   }
              },
            ),
          ),
        ],
      ),
    );
  }

  Form _buildRegister() {
    // if(Platform.isIOS){
    //   return Form(
    //     key: registerFormKey,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.fromLTRB(25, 0, 25, 15),
    //           child: CupertinoFormSection(
    //             decoration: BoxDecoration(
    //               color: CupertinoColors.white,
    //             ),
    //             children: [
    //               CupertinoTextFormFieldRow(
    //                 validator: (username) =>
    //                 username!.length<4 || username == null
    //                     ? "L??tfen kullan??c?? ad??n??z?? do??ru giriniz."
    //                     : null,
    //                 inputFormatters: [
    //                   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
    //                 ],
    //                 textInputAction: TextInputAction.next,
    //                 controller: usernameController,
    //                 padding: EdgeInsets.all(16),
    //                 placeholder: "Kullan??c?? ad??",
    //                 placeholderStyle: TextStyle(color: CupertinoColors.systemGrey),
    //                 style: TextStyle(color: Colors.indigo),
    //                 prefix: Icon(
    //                   CupertinoIcons.profile_circled,
    //                   color: Colors.indigo,
    //                 ),
    //                 cursorColor: Colors.indigo,
    //               ),
    //             ],
    //           ),
    //         ),
    //
    //         Padding(
    //           padding: const EdgeInsets.only(bottom: 24.0),
    //           child: CupertinoButton(
    //             color: Colors.indigo,
    //             child: Text("??ifreni Al", style: TextStyle(color: CupertinoColors.white),),
    //             onPressed: () async{
    //               Navigator.push(context, CupertinoPageRoute(
    //                   builder: (context) => ComingSoonScreen()));
    //               // registerFormKey.currentState!.save();
    //               // if(registerFormKey.currentState!.validate()){
    //               // String token = await api.clientCredentials();
    //               // await api.signup(usernameController.text, phoneController.text, pwdController.text, token);
    //               // if(token != null){
    //               // Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) => MainWidget()));
    //               // }
    //               // }
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }else{
    return Form(
      key: registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
            child: TextFormField(
              validator: (email) => email != null && !EmailValidator.validate(email)
                  ? "Ge??erli bir e-posta giriniz."
                  : null,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
              ],
              textInputAction: TextInputAction.next,
              controller: emailController,
              style: TextStyle(color: Colors.indigo),
              decoration: InputDecoration(
                icon: Icon(
                  CupertinoIcons.mail,
                  color: Colors.indigo,
                ),
                hintText: "E-posta",
              ),
              cursorColor: Colors.indigo,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
            child: TextFormField(
              validator: (phone) {
                if (!_validateMobile(phone!)) {
                  return "Ge??erli bir telefon numaras?? giriniz.";
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
                  color: Colors.indigo,
                ),
                hintText: "5XXXXXXXXX",
              ),
              cursorColor: Colors.indigo,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
            child: TextFormField(
              validator: (pwd) {
                if (pwd == null || pwd.isEmpty || pwd.length < 2) {
                  return "L??tfen ??ifrenizi do??ru giriniz.";
                } else {
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
                  color: Colors.indigo,
                ),
                hintText: "??ifre",
              ),
              cursorColor: Colors.indigo,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
            child: TextFormField(
              validator: (pwd) {
                if (pwd == null || pwd.isEmpty || pwd.length < 2) {
                  return "L??tfen ??ifrenizi do??ru giriniz.";
                } else {
                  return null;
                }
              },
              controller: nameController,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.account_box,
                  color: Colors.indigo,
                ),
                hintText: "Ad",
              ),
              cursorColor: Colors.indigo,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 24, 16),
            child: TextFormField(
              validator: (pwd) {
                if (pwd == null || pwd.isEmpty || pwd.length < 2) {
                  return "L??tfen ??ifrenizi do??ru giriniz.";
                } else {
                  return null;
                }
              },
              controller: schoolController,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.school,
                  color: Colors.indigo,
                ),
                hintText: "Okul",
              ),
              cursorColor: Colors.indigo,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)),
              child: Text("Kay??t Ol"),
              onPressed: () async {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => MainWidget()));
                registerFormKey.currentState!.save();
                if (registerFormKey.currentState!.validate()) {
                  UserModel a = UserModel();
                  a.id=0;
                  a.email=emailController.text;
                  a.phone=phoneController.text;
                  a.password=pwdController.text;
                  a.name=nameController.text;
                  a.schoolId=int.parse(schoolController.text);
                  var response = await api.register(a);
                  if (response.statusCode == 200) {
                    //kay??t ba??ar??l?? flutter toast message
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
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
