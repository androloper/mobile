import 'package:drinks_app/services/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ingredient_screen.dart';

class DrinkListScreen2 extends StatefulWidget {
  String? name;
  DrinkListScreen2({required this.name,Key? key}) : super(key: key);

  @override
  State<DrinkListScreen2> createState() => _DrinkListScreen2State();
}

class _DrinkListScreen2State extends State<DrinkListScreen2> {
  final List<dynamic>? drinks = Apis.drinkByAlcoholicness;
  List<dynamic>? _foundDrinks = [];
  final api = Apis();

  @override
  initState() {
    _foundDrinks = drinks;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<dynamic>? results = [];
    if (enteredKeyword.isEmpty) {
      results = drinks;
    } else {
      results = drinks
          ?.where((drink) =>
          drink["strDrink"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundDrinks = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.amberAccent,
          title: Text('${widget.name} Drinks'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                cursorColor: Colors.indigo,
                style: TextStyle(color: Colors.indigo),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo),
                    ),
                    labelStyle: TextStyle(color: Colors.indigo),
                    labelText: 'Search Drink', suffixIcon: Icon(Icons.search, color: Colors.indigo,)),
              ),
            ),
            Expanded(
                child: _foundDrinks!.isNotEmpty
                    ? ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: _foundDrinks!.length,
                    itemBuilder: (context, index) => Card(
                      key: ValueKey(_foundDrinks![index]["idDrink"]),
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical:2),
                      color: Colors.indigo,
                      child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: Image.network(_foundDrinks![index]["strDrinkThumb"]),
                          title:Text(_foundDrinks![index]["strDrink"], style: TextStyle(color: Colors.amberAccent),),
                          onTap: () async {
                            var id = int.parse(_foundDrinks![index]["idDrink"]);
                            await api.fetchIngredient(id);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => IngredientScreen()));
                          },
                      ),
                    )
                )
                    : Center(
                    child: const Text(
                      'Drink that you search could not be found',
                      style: TextStyle(color: Colors.indigo),
                      //androloper
                    )
                )
            ),
          ],
        )
    );
  }
}
