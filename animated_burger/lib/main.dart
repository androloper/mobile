import 'package:flutter/material.dart';
import 'main_method.dart';
import 'model/data_position.dart';
import 'model/data_name.dart';
import 'model/data_value.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List foodItem = [];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(children: [
        Expanded(
          child: _animatedStack(),
        ),
        Expanded(
          child: checkBoxListview(),
        ),
      ]),
    );
  }

  Stack _animatedStack() {
    return Stack(
      children: [
        animatedPositioned(
            top: underBreadTop,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().underBreadPath,
                  width: width,
                  height: height2,
                ),
                opacity: open)),
        animatedPositioned(
            top: topLettuceTop,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().topLettucePath,
                  width: width,
                  height: height2,
                ),
                opacity: valueLettuce ? open : close)),
        animatedPositioned(
            top: valueLettuce ? burgerTop : burgerTop - 2,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().burgerPath,
                  width: width,
                  height: height,
                ),
                opacity: open)),
        animatedPositioned(
            top: foodItem.length < 2 ? cheeseTop : cheeseTop,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().cheesePath,
                  width: width,
                  height: height,
                ),
                opacity: valueCheese ? open : close)),
        animatedPositioned(
            top: valueCheese ? tomatoTop - 10 : tomatoTop,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().tomatoPath,
                  width: width,
                  height: height,
                ),
                opacity: valueTomato ? open : close)),
        animatedPositioned(
            top: valueCheese && valueTomato
                ? onionTop
                : valueTomato
                ? onionTop + 10
                : valueCheese
                ? onionTop + 20
                : onionTop + 30,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().onionPath,
                  width: width,
                  height: height,
                ),
                opacity: valueOnion ? open : close)),
        animatedPositioned(
            top: valueOnion && valueTomato && valueCheese
                ? pickleTop
                : valueOnion && valueTomato
                ? pickleTop + 10
                : valueOnion && valueCheese
                ? pickleTop + 20
                : valueTomato && valueCheese
                ? pickleTop + 5
                : valueTomato
                ? pickleTop + 25
                : valueCheese
                ? pickleTop + 35
                : valueOnion
                ? pickleTop + 25
                : pickleTop + 45,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().picklePath,
                  width: 340,
                  height: height,
                ),
                opacity: valuePickle ? open : close)),
        animatedPositioned(
            top: topp,
            animated: animatedOpacity(
                image: Image.asset(
                  ImagePath().overBread,
                  width: width,
                  height: height2,
                ),
                opacity: open)),
      ],
    );
  }

  ListView checkBoxListview() {
    return ListView(children: [
      checkBox(
          title: Text(FoodName().lettuceName),
          value: valueLettuce,
          selected: selectedLettuce,
          onChanged: (_) {
            setState(() {
              valueLettuce = !valueLettuce;
              valueLettuce
                  ? foodItem.add(selectedLettuce)
                  : foodItem.remove(selectedLettuce);
            });
          }),
      checkBox(
          title: Text(FoodName().tomatoName),
          value: valueTomato,
          selected: selectedTomato,
          onChanged: (_) {
            setState(() {
              valueTomato = !valueTomato;
              valueTomato
                  ? foodItem.add(selectedTomato)
                  : foodItem.remove(selectedTomato);
              valueTomato ? increase() : decrease();
            });
          }),
      checkBox(
          title: Text(FoodName().onionName),
          value: valueOnion,
          selected: selectedOnion,
          onChanged: (_) {
            setState(() {
              valueOnion = !valueOnion;
              valueOnion
                  ? foodItem.add(selectedOnion)
                  : foodItem.remove(selectedOnion);
              valueOnion ? increase() : decrease();
            });
          }),
      checkBox(
          title: Text(FoodName().pickleName),
          value: valuePickle,
          selected: selectedPickle,
          onChanged: (_) {
            setState(() {
              valuePickle = !valuePickle;
              valuePickle
                  ? foodItem.add(selectedPickle)
                  : foodItem.remove(selectedPickle);
              valuePickle ? increase() : decrease();
            });
          }),
      checkBox(
          title: Text(FoodName().cheeseName),
          value: valueCheese,
          selected: selectedCheese,
          onChanged: (_) {
            setState(() {
              valueCheese = !valueCheese;
              valueCheese
                  ? foodItem.add(selectedCheese)
                  : foodItem.remove(selectedCheese);
              valueCheese ? increase() : decrease();
            });
          })
    ]);
  }
}