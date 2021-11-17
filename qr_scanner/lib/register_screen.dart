import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  String? barcode;
  RegisterScreen({required this.barcode, Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var snoController = TextEditingController();
  var wifiController = TextEditingController();
  var pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    snoController.text = barcode!;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Cihaz Aktivasyon"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 32,top: height*0.1, right: 32,),
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
                        controller: snoController,
                        enabled: false,
                        validator: (sno){
                          if(sno!.isEmpty || sno.length != 13 ) {
                            return "Seri Numarası 13 haneli olmalı.";
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text("NO",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                          ),
                          labelText: "Cihaz Seri Numarası",
                          hintText: "Cihaz Seri Numarası",
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
                        controller: wifiController,
                        validator: (wifi){
                          if(wifi!.length <= 0) {
                            return "Geçerli WiFi adı giriniz.";
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.wifi,color: Colors.blue,),
                          labelText: "Wifi Adınız",
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
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextFormField(
                        obscureText: true,
                        controller: pwdController,
                        validator: (pwd){
                          if(pwd!.length <= 7 ){
                            return "Geçerli şifre giriniz.";
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,color: Colors.blue,),
                          labelText: "Wifi Şifreniz",
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
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                      child: ElevatedButton(
                        child: Text("Aktive Et"),
                        onPressed: (){
                              Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}