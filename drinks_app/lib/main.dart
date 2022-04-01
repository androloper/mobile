import 'package:drinks_app/services/apis.dart';
import 'package:drinks_app/ui/drink_list_screen.dart';
import 'package:drinks_app/ui/drink_list_screen2.dart';
import 'package:flutter/material.dart';

void main() async{
  // await Apis().fetchIngredient(15346);
  // await Apis().fetchDrinksByAlcoholicness('Optional_Alcohol');
  // await Apis().fetchDrinksByCategory('Cocktail');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frontends Union',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'IG @FrontendsUnion #DrinksApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final api = Apis();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        foregroundColor: Colors.amberAccent,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48.0, 24.0, 48.0, 24.0),
        child: SingleChildScrollView(
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Alcoholic",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await Apis().fetchDrinksByAlcoholicness('Alcoholic');
                              Navigator.push(context,MaterialPageRoute(
                                  builder: (context) => DrinkListScreen2(name: 'Alcoholic',)));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Non-Alcoholic",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await Apis().fetchDrinksByAlcoholicness('Non_Alcoholic');
                              Navigator.push(context,MaterialPageRoute(
                                  builder: (context) => DrinkListScreen2(name: 'Non-Alcoholic',)));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              //androloper
                            shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Optional Alcohol",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await Apis().fetchDrinksByAlcoholicness('Optional_Alcohol');
                              Navigator.push(context,MaterialPageRoute(
                                       builder: (context) => DrinkListScreen2(name: 'Optional Alcohol',)));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Cocktail",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await api.fetchDrinksByCategory('Cocktail');
                              Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => DrinkListScreen(name: 'Cocktail')));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Coffee / Tea",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await api.fetchDrinksByCategory('Coffee_/_Tea');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => DrinkListScreen(name: 'Coffee / Tea')));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Cocoa",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await api.fetchDrinksByCategory('Cocoa');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => DrinkListScreen(name: 'Cocoa')));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Ordinary",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await api.fetchDrinksByCategory('Ordinary_Drink');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => DrinkListScreen(name: 'Ordinary')));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Homemade Liqueur",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await api.fetchDrinksByCategory('Homemade_Liqueur');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => DrinkListScreen(name: 'Homemade Liqueur')));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Punch / Party",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await api.fetchDrinksByCategory('Punch_/_Party_Drink');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => DrinkListScreen(name: 'Punch / Party')));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Beer",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await api.fetchDrinksByCategory('Beer');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => DrinkListScreen(name: 'Beer')));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Soft",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await api.fetchDrinksByCategory('Soft_Drink');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => DrinkListScreen(name: 'Soft')));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Shot",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await api.fetchDrinksByCategory('Shot');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => DrinkListScreen(name: 'Shot')));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Shake",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await api.fetchDrinksByCategory('Shake');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => DrinkListScreen(name: 'Shake')));
                            })),
                    SizedBox(
                        width: width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
                              child: Text("Other / Unknown",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: height*.02, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              await api.fetchDrinksByCategory('Other/Unknown');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => DrinkListScreen(name: 'Other / Unknown')));
                            })),
                  ],
          ),
        ),
      ),
    );
  }
}
