import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:knitting_models_app/constants/colors.dart';
import 'package:knitting_models_app/constants/fonts.dart';
import 'package:knitting_models_app/screens/home_screen.dart';
import 'package:knitting_models_app/widgets/w_page_route_builder.dart';
import 'package:knitting_models_app/widgets/w_toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final col = AppColors();
  final font = AppFonts();
  var loginFormKey = GlobalKey<FormState>();
  var forgotFormKey = GlobalKey<FormState>();
  var registerFormKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: '');
  var pwdController = TextEditingController(text: '');
  var regEmailController = TextEditingController(text: '');
  var regPwdController = TextEditingController(text: '');
  int groupValue = 0;
  bool obscurePwd = true;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: col.thirdCol,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: height,
                maxHeight: double.infinity
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Opacity(
                          opacity: .85,
                          child: Image.asset(
                            'assets/background.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Opacity(
                          opacity: .85,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 32, top: 12, right: 32),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: col.thirdCol,
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            col.firstCol,
                                            col.secondCol
                                          ])),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top:width*.05, left: width*.05, right: width*.05),
                                        child: Image.asset(
                                          'assets/unifortunately-wide.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16, left: 16),
                                        child: CupertinoSlidingSegmentedControl(
                                          backgroundColor: col.firstCol,
                                          thumbColor: col.fourthCol,
                                          groupValue: groupValue,
                                          children: {
                                            0: Text(
                                             'Giriş Yap',
                                              textAlign: TextAlign.center,
                                              style:
                                              font.formSubHeader,
                                            ),
                                            // 1: Text(
                                            //  'Şifremi Unuttum',
                                            //   textAlign: TextAlign.center,
                                            //   style:
                                            //   font.formSubHeader,
                                            // ),
                                            1: Text(
                                             'Kayıt Ol',
                                              textAlign: TextAlign.center,
                                              style:
                                              font.formSubHeader,
                                            )
                                          },
                                          onValueChanged: (groupValue) {
                                            setState(() {
                                              this.groupValue =
                                                  int.parse(groupValue
                                                      .toString());
                                            });
                                          },
                                        ),
                                      ),
                                      (groupValue == 0)
                                          ? frmLogin()
                                          // : (groupValue == 1)
                                          // ? frmForgot()
                                          : frmRegister(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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

  Form frmLogin() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    late double placementY;
    late double placementX;
    return Form(
      key: loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 3),
            child: TextFormField(
              validator: (usr) {
                if (usr == null || usr.isEmpty) {
                  return 'Email gereklidir!';
                } else {
                  return null;
                }
              },
              style: font.formText,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  FeatherIcons.mail,
                  color: col.fourthCol,
                  size: 24,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                hintText: 'Örnek: info@unifortunately.com',
              ),
              cursorColor: col.fourthCol,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 3, 16, 6),
            child: TextFormField(
              validator: (pwd) {
                if (pwd == null || pwd.isEmpty) {
                  return 'Şifre gereklidir!';
                } else {
                  return null;
                }
              },
              style: font.formText,
              controller: pwdController,
              obscureText: obscurePwd,
              decoration: InputDecoration(
                prefixIcon: Icon(
                 FeatherIcons.lock,
                  color: col.fourthCol,
                  size: 24,
                ),
                suffixIcon: Tooltip(
                  message: obscurePwd ? 'Göster' : 'Gizle',
                  child: IconButton(
                    icon: Icon(
                      obscurePwd ? FeatherIcons.eyeOff : FeatherIcons.eye,
                      color: col.fourthCol,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePwd = !obscurePwd;
                      });
                    },
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                hintText: 'Örnek: 123456',
              ),
              cursorColor: col.fourthCol,
            ),
          ),
          Listener(
            onPointerDown: (PointerDownEvent event) {
              placementY = ((event.position.dy / height)) * 2 - 1;
              placementX = ((event.position.dx / width)) * 2 - 1;
            },
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 32,
                right: 32,
              ),
              child: CupertinoButton(
                  color: col.fourthCol,
                  onPressed: () async {
                    loginFormKey.currentState!.save();
                    if (loginFormKey.currentState!.validate()) {
                      if (emailController.text.length < 6 && pwdController.text.length<6) {
                        WToast.show(
                            context: context,
                            width: MediaQuery.of(context).size.width,
                            header: '',
                            content: 'Lütfen geçerli kombinasyonlarda giriş yapınız. Doğru formatta email adresi (info@unifortunately.com) ve istenilen formatta şifre(123456) giriniz.',
                            placement: ToastPlacementEnum.top,
                            type: ToastTypeEnum.warning);
                      } else {
                        // var result = await api.justLogin(phoneController.text, pwdController.text);
                        // if (result == true) {
                          Navigator.of(context).push(WPageRouteBuilderForMenu(
                              placementX,
                              placementY,
                              HomeScreen()));
                        // } else {
                        //   WToast.show(
                        //       context: context,
                        //       width: MediaQuery.of(context).size.width,
                        //       header: '',
                        //       content: AppLocalizations.of(context).translate('wrongCredentials'),
                        //       placement: ToastPlacementEnum.top,
                        //       type: ToastTypeEnum.error);
                        // }
                      }
                    }
                  },
                  child: Text(
                    'Giriş Yap',
                    style: font.formButton,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Form frmRegister() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    late double placementY;
    late double placementX;
    return Form(
      key: registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 3),
            child: TextFormField(
              validator: (usr) {
                if (usr == null || usr.isEmpty) {
                  return 'Email gereklidir!';
                } else {
                  return null;
                }
              },
              style: font.formText,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: regEmailController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  FeatherIcons.mail,
                  color: col.fourthCol,
                  size: 24,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                hintText: 'Örnek: info@unifortunately.com',
              ),
              cursorColor: col.fourthCol,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 3, 16, 6),
            child: TextFormField(
              validator: (pwd) {
                if (pwd == null || pwd.isEmpty) {
                  return 'Şifre gereklidir!';
                } else {
                  return null;
                }
              },
              style: font.formText,
              controller: regPwdController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                 FeatherIcons.lock,
                  color: col.fourthCol,
                  size: 24,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                hintText: 'Örnek: 123456',
              ),
              cursorColor: col.fourthCol,
            ),
          ),
          Listener(
            onPointerDown: (PointerDownEvent event) {
              placementY = ((event.position.dy / height)) * 2 - 1;
              placementX = ((event.position.dx / width)) * 2 - 1;
            },
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 32,
                right: 32,
              ),
              child: CupertinoButton(
                  color: col.fourthCol,
                  onPressed: () async {
                    registerFormKey.currentState!.save();
                    if (registerFormKey.currentState!.validate()) {
                      if (regEmailController.text.length < 6 && regPwdController.text.length<6) {
                        WToast.show(
                            context: context,
                            width: MediaQuery.of(context).size.width,
                            header: '',
                            content: 'Lütfen geçerli kombinasyonlarda giriş yapınız. Doğru formatta email adresi (info@unifortunately.com) ve istenilen formatta şifre(123456) giriniz.',
                            placement: ToastPlacementEnum.top,
                            type: ToastTypeEnum.warning);
                      } else {
                        // var result = await api.justLogin(phoneController.text, pwdController.text);
                        // if (result == true) {
                        WToast.show(
                            context: context,
                            width: MediaQuery.of(context).size.width,
                            header: '',
                            content: 'Üyeliğiniz başarıyla oluşturulmuştur. Giriş yapabilirsiniz.',
                            placement: ToastPlacementEnum.top,
                            type: ToastTypeEnum.success);
                        setState(() {
                          groupValue = 0;
                        });
                        // } else {
                        //   WToast.show(
                        //       context: context,
                        //       width: MediaQuery.of(context).size.width,
                        //       header: '',
                        //       content: AppLocalizations.of(context).translate('wrongCredentials'),
                        //       placement: ToastPlacementEnum.top,
                        //       type: ToastTypeEnum.error);
                        // }
                      }
                    }
                  },
                  child: Text(
                    'Kayıt Ol',
                    style: font.formButton,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
