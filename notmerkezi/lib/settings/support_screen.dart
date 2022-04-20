import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kf_drawer/kf_drawer.dart';

class SupportScreen extends KFDrawerContent {
  SupportScreen({Key? key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // if(Platform.isIOS){
    //   return CupertinoPageScaffold(
    //       child: Container(
    //
    //     )
    //   );
    // }
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.amberAccent,
        title: Text('Destek'),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: TextFormField(
                        validator: (name) =>
                        name != null && name.length<1
                            ? "Geçerli bir ad giriniz."
                            : null,
                        controller: fullNameController,
                        decoration: InputDecoration(
                          prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                          labelText: "Adı",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: TextFormField(
                        validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? "Geçerli bir e-posta giriniz."
                            : null,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
                        ],
                        controller: emailController,
                        decoration: InputDecoration(
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
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: TextFormField(
                        validator: (subj) =>
                        subj != null && subj.length<1
                            ? "Geçerli bir konu giriniz."
                            : null,
                        controller: subjectController,
                        decoration: InputDecoration(
                          prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                          labelText: "Konu",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: TextFormField(
                        validator: (msg) =>
                        msg != null && msg.length<20
                            ? "Geçerli bir mesaj giriniz."
                            : null,
                        controller: messageController,
                        decoration: InputDecoration(
                          prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                          labelText: "Mesaj",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: SizedBox(
                          width: width*.4,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  primary: Colors.indigo
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                                child: Text("Gönder",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, color:Colors.amberAccent)),
                              ),
                            onPressed: () async {
                              formKey.currentState!.save();
                              if (formKey.currentState!.validate()) {
                                Fluttertoast.showToast(
                                    msg: "Destek talebiniz tarafımıza ulaşmıştır.",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.greenAccent,
                                    textColor: CupertinoColors.black,
                                    fontSize: 16.0);
                                formKey.currentState!.reset();
                                // await api.updateAccount(emailController.text, pwdController.text, phoneController.text);
                                // Navigator.pop(context);
                              }
                            },
                          )
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
