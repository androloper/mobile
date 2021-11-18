import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hencoop_watch_app/models/alarms.dart';
import 'package:hencoop_watch_app/models/hencoops.dart';
import 'package:hencoop_watch_app/models/login_request.dart';
import 'package:hencoop_watch_app/services/api.dart';
import 'package:hencoop_watch_app/services/progressHud.dart';

import 'live_watching_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  LoginRequestModel? loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<Hencoop>>? futureHencoop;
  Future<List<Alarm>>? futureAlarm;
  var userController = TextEditingController();
  var pwController = TextEditingController();


  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHud(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text(
                          "Kümescell Giriş Ekranı",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          controller: userController,
                          keyboardType: TextInputType.text,
                          onSaved: (input) => loginRequestModel!.username = input,
                          validator: (input) => input!.length < 1
                              ? "Kullanıcı adınız 1 karakterden fazla olmalı!"
                              : null,
                          decoration: new InputDecoration(
                            hintText: "Kullanıcı Adınız",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          controller: pwController,
                          style:
                          TextStyle(color: Theme.of(context).accentColor),
                          keyboardType: TextInputType.text,
                          onSaved: (input2) =>
                          loginRequestModel!.password = input2,
                          validator: (input) => input!.length < 1
                              ? "Şifreniz 1 karakterden fazla olmalı!"
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: "Şifreniz",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            if (validateAndSave()) { //val#1
                              loginRequestModel!.username = userController.text;
                              loginRequestModel!.password = pwController.text;
                              var logreqs = LoginRequestModel(username: loginRequestModel!.username, password: loginRequestModel!.password);
                              //print(loginRequestModel.toJson());
                              setState(() {
                                isApiCallProcess = true;
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LiveWatching()));
                              });
                              APIService apiService = new APIService();
                              apiService.login(logreqs).then((value) {
                                if (value != null) { //val#2
                                  setState(() {
                                    isApiCallProcess = false;
                                    //apiService.login(logreqs);
                                    apiService.fetchData();
                                  });
                                } else {
                                  globalFormKey.currentState!.reset();
                                  return AlertDialog(
                                    title: Text("Hatalı Giriş"),
                                    content: Text("Kullanıcı adınız veya şifreniz hatalı."),
                                    actions: [
                                      ElevatedButton(child:Text('Tamam'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                }
                              }
                              );
                            }
                          },
                          child: Text(
                            "Giriş",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}