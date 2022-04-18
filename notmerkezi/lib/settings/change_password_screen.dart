import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../account/models/login.dart';

class ChangePasswordScreen extends StatefulWidget {
  final Login credentials;

  ChangePasswordScreen({Key? key, required this.credentials}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  // final api = ApiServices();
  var formKey = GlobalKey<FormState>();
  var pwdController = TextEditingController();
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController(text: widget.credentials.email);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // if(Platform.isIOS){
    //   return GestureDetector(
    //     onTap: () => FocusScope.of(context).unfocus(),
    //     child: CupertinoPageScaffold(
    //       navigationBar: CupertinoNavigationBar(
    //         middle: Text("Şifremi ", style: TextStyle(color: Colors.white),),
    //         backgroundColor: Colors.grey,
    //       ),
    //       child: SafeArea(
    //         child: SingleChildScrollView(
    //           reverse: true,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               Container(
    //                 margin: EdgeInsets.only(left: 32,top: height*0.1, right: 32,),
    //                 alignment: Alignment.center,
    //                 decoration: BoxDecoration(
    //                   color: CupertinoColors.systemGroupedBackground,
    //                   borderRadius: BorderRadius.circular(30),
    //                 ),
    //                 child: Form(
    //                   key: formKey,
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
    //                         child: CupertinoFormSection(
    //                           header: Text("Hesap Detayları"),
    //                           children: [
    //                             CupertinoTextFormFieldRow(
    //                               prefix: Text("E-posta:",style: TextStyle(fontWeight: FontWeight.w600),),
    //                               padding: EdgeInsets.all(16),
    //                               controller: emailController,
    //                               textInputAction: TextInputAction.next,
    //                               cursorColor: mainColor,
    //                               validator: (email) =>
    //                               email != null && !EmailValidator.validate(email)
    //                                   ? "Geçerli E-posta giriniz."
    //                                   : null,
    //                             ),
    //                             CupertinoTextFormFieldRow(
    //                               prefix: Text("Şifre:",style: TextStyle(fontWeight: FontWeight.w600),),
    //                               padding: EdgeInsets.all(16),
    //                               controller: pwdController,
    //                               textInputAction: TextInputAction.next,
    //                               cursorColor: mainColor,
    //                               obscureText: true,
    //                               validator: (pwd){
    //                                 if(pwd == null ||  pwd.isEmpty){
    //                                   return "Geçerli şifre Giriniz.";
    //                                 }else if(pwd.length <= 7){
    //                                   return "Şifre 8 karakterden az olamaz.";
    //                                 }else{
    //                                   return null;
    //                                 }
    //                               },
    //                             ),
    //                             CupertinoTextFormFieldRow(
    //                               textInputAction: TextInputAction.done,
    //                               prefix: Text("Tel. No:",style: TextStyle(fontWeight: FontWeight.w600),),
    //                               padding: EdgeInsets.all(16),
    //                               controller: phoneController,
    //                               cursorColor: mainColor,
    //                               validator: (phone){
    //                                 if(phone!.length != 10){
    //                                   return "Geçerli telefon numarası giriniz.";
    //                                 }
    //                               },
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
    //                         child: CupertinoButton(
    //                           child: Text("Güncelle"),
    //                           onPressed: () async{
    //                             formKey.currentState!.save();
    //                             if(formKey.currentState!.validate()){
    //                               await api.updateAccount(emailController.text, pwdController.text, phoneController.text);
    //                               Navigator.pop(context);
    //                             }
    //                           },
    //                           color: mainColor,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }
    // else{
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hesap Bilgileri"),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 32,
                  top: height * 0.1,
                  right: 32,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                        child: TextFormField(
                          controller: emailController,
                          enabled: false,
                          decoration: InputDecoration(
                            prefixText: "E-posta: ",
                            prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                            labelText: "E-posta",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: TextFormField(
                          controller: pwdController,
                          decoration: InputDecoration(
                            prefixText: "Şifre: ",
                            prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                            labelText: "Şifre",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          obscureText: true,
                          onFieldSubmitted: (value) {}, // lazım olur
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                        child: ElevatedButton(
                          child: Text("Güncelle"),
                          onPressed: () async {
                            formKey.currentState!.save();
                            if (formKey.currentState!.validate()) {
                              // await api.updateAccount(emailController.text, pwdController.text);
                              Navigator.pop(context);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
