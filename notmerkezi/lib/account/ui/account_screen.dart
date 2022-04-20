import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import '../models/account.dart';

class AccountScreen extends KFDrawerContent {
  final Account account;

  AccountScreen({required this.account, Key? key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // final api = ApiServices();
  var formKey = GlobalKey<FormState>();
  late TextEditingController fullNameController;
  late TextEditingController birthdayController;
  late TextEditingController phoneController;
  late TextEditingController universityController;
  late TextEditingController departmentController;
  late TextEditingController studentController;

  @override
  void initState() {
    fullNameController = TextEditingController(text: widget.account.fullName);
    birthdayController = TextEditingController(text: widget.account.birthDate);
    phoneController = TextEditingController(text: widget.account.phoneNo);
    universityController =
        TextEditingController(text: widget.account.university);
    departmentController =
        TextEditingController(text: widget.account.department);
    studentController = TextEditingController(text: widget.account.studentNo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // if(Platform.isIOS){
    //   return GestureDetector(
    //     onTap: () => FocusScope.of(context).unfocus(),
    //     child: CupertinoPageScaffold(
    //       navigationBar: CupertinoNavigationBar(
    //         middle: Text("Hesap Detayları", style: TextStyle(color: Colors.white),),
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
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.amberAccent,
          title: Text("Kişisel Bilgiler"),
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
                          controller: fullNameController,
                          decoration: InputDecoration(
                            prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                            labelText: "Adı",
                            hintText: 'Ramazan Baybörek',
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
                          controller: birthdayController,
                          decoration: InputDecoration(
                            prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                            labelText: "Doğum Tarihi",
                            hintText: '10/03/1997',
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
                          controller: phoneController,
                          validator: (k) {
                            if (k!.length <= 7) {
                              return "Please enter the valid password";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                            labelText: "Telefon Numarası",
                            hintText: "5XXXXXXXXX",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onFieldSubmitted: (value) {}, // lazım olur
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: TextFormField(
                          controller: universityController,
                          decoration: InputDecoration(
                            prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                            labelText: "Üniversite",
                            hintText: 'İzmir Ekonomi Üniversitesi',
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
                          controller: departmentController,
                          decoration: InputDecoration(
                            prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                            labelText: "Bölüm",
                            hintText: 'Yazılım Mühendisliği',
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
                          controller: studentController,
                          decoration: InputDecoration(
                            prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                            labelText: "Öğrenci Numarası",
                            hintText: '20170601042',
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
                                  child: Text("Güncelle",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20, color:Colors.amberAccent)),
                                ),
                                onPressed: () async {
                                  //api request
                                }
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
      ),
    );
  }
}
