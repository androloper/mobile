import 'dart:io';
import 'package:accordion/accordion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  double totalPrice;

  PaymentScreen({required this.totalPrice, Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController cardNoController;
  late TextEditingController cardDateController;
  late TextEditingController cardCVVController;
  final _headerStyle = const TextStyle(
      color: Colors.amberAccent, fontSize: 24, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Colors.amberAccent, fontSize: 16, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 16, fontWeight: FontWeight.normal);
  final _loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

  @override
  void initState() {
    cardNoController = TextEditingController(text: '0000-0000-0000-0000');
    cardDateController = TextEditingController(text: '00/00');
    cardCVVController = TextEditingController(text: '000');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // if(Platform.isIOS){
    //   return CupertinoPageScaffold(
    //     child: Container(
    //
    //     ),
    //   );
    // }
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.amberAccent,
        title: Text('Ödeme Ekranı'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Accordion(
              headerBackgroundColor: Colors.indigo,
              maxOpenSections: 1,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              children: [
                AccordionSection(
                  isOpen: true,
                  leftIcon: const Icon(
                    CupertinoIcons.creditcard,
                    color: Colors.amberAccent,
                    size: 36,
                  ),
                  rightIcon: const Icon(CupertinoIcons.chevron_down,
                      color: Colors.amberAccent),
                  headerBackgroundColorOpened: Colors.green,
                  header: Text('Kart İle Öde', style: _headerStyle),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 32,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 32, 16, 16),
                                  child: TextFormField(
                                    controller: cardNoController,
                                    decoration: InputDecoration(
                                      prefixStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
                                      labelText: "Kart Numarası",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width*.27,
                                        child: TextFormField(
                                          controller: cardDateController,
                                          decoration: InputDecoration(
                                            prefixStyle: TextStyle(
                                                fontWeight: FontWeight.w600),
                                            labelText: "Kart Tarihi",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width*.27,
                                        child: TextFormField(
                                          controller: cardCVVController,
                                          decoration: InputDecoration(
                                            prefixStyle: TextStyle(
                                                fontWeight: FontWeight.w600),
                                            labelText: "CVV",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                  contentBorderColor: Colors.green,
                  contentVerticalPadding: 16,
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 3,
                  // sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                  // sectionClosingHapticFeedback: SectionHapticFeedback.vibrate,
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(
                    CupertinoIcons.bitcoin,
                    color: Colors.amberAccent,
                    size: 36,
                  ),
                  rightIcon: const Icon(CupertinoIcons.chevron_down,
                      color: Colors.amberAccent),
                  header: Text('Kripto İle Öde', style: _headerStyle),
                  headerBackgroundColorOpened: Colors.deepPurpleAccent,
                  contentBorderColor: Colors.deepPurpleAccent,
                  contentVerticalPadding: 16,
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 3,
                  content: Row(
                    children: [
                      const Icon(
                          CupertinoIcons.chevron_left_slash_chevron_right,
                          size: 120,
                          color: Colors.deepPurpleAccent),
                      Padding(
                          padding: EdgeInsets.only(left: 32),
                          child: Text('Çok Yakında...',
                              style: TextStyle(fontSize: 20))),
                    ],
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
