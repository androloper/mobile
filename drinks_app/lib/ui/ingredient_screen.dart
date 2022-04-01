import 'package:drinks_app/models/ingredient.dart';
import 'package:flutter/material.dart';
import '../services/apis.dart';

class IngredientScreen extends StatefulWidget {
  IngredientScreen({Key? key}) : super(key: key);

  @override
  State<IngredientScreen> createState() => _IngredientScreenState();
}

class _IngredientScreenState extends State<IngredientScreen> {
  final Ingredient recipe = Apis.ingredientOfDrink!;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          foregroundColor: Colors.amberAccent,
          backgroundColor: Colors.indigo,
          title: Text('Recipe of ${recipe.drinks![0].strDrink}', style: TextStyle(fontSize: 17),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 16.0),
              //   child: CircleAvatar(
              //     backgroundImage: NetworkImage(recipe.drinks![0].strDrinkThumb!),
              //       radius: height*.2),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.amberAccent,
                        width: 3,
                      ),
                    ),
                    child: Image.network(recipe.drinks![0].strDrinkThumb!, height: height*.4,))
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.indigo,
                      width: 3,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          recipe.drinks![0].strDrink!,
                          style: TextStyle(color: Colors.indigo, fontSize: 22, fontWeight: FontWeight.w900),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.indigo,
                      width: 3,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${recipe.drinks![0].strCategory} - ${recipe.drinks![0].strAlcoholic}',
                          style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                    //androloper
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 8,16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.indigo,
                          width: 3,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(child: Text('Ingredients', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.indigo))),
                            recipe.drinks![0].strIngredient1 != null ? Row(
                                children: [
                                  Text(recipe.drinks![0].strIngredient1!,
                                      style: TextStyle(color: Colors.indigo)),
                                  Text(" - ${recipe.drinks![0].strMeasure1}",
                                      style: TextStyle(color: Colors.indigo)),
                                ]
                            ) : Container(),
                            recipe.drinks![0].strIngredient2 != null ? Row(
                                children: [
                                  Text(recipe.drinks![0].strIngredient2!,
                                      style: TextStyle(color: Colors.indigo)),
                                  Text(" - ${recipe.drinks![0].strMeasure2}",
                                      style: TextStyle(color: Colors.indigo)),
                                ]
                            ) : Container(),
                            recipe.drinks![0].strIngredient3 != null ? Row(
                                children: [
                                  Text(recipe.drinks![0].strIngredient3!,
                                      style: TextStyle(color: Colors.indigo)),
                                  Text(" - ${recipe.drinks![0].strMeasure3}",
                                      style: TextStyle(color: Colors.indigo)),
                                ]
                            ) : Container(),
                            recipe.drinks![0].strIngredient4 != null ? Row(
                                children: [
                                  Text(recipe.drinks![0].strIngredient4!,
                                      style: TextStyle(color: Colors.indigo)),
                                  Text(" - ${recipe.drinks![0].strMeasure4}",
                                      style: TextStyle(color: Colors.indigo)),
                                ]
                            ) : Container(),
                            recipe.drinks![0].strIngredient5 != null ? Row(
                                children: [
                                  Text(recipe.drinks![0].strIngredient5!,
                                      style: TextStyle(color: Colors.indigo)),
                                  Text(" - ${recipe.drinks![0].strMeasure5}",
                                      style: TextStyle(color: Colors.indigo)),
                                ]
                            ) : Container(),
                            recipe.drinks![0].strIngredient6 != null ? Row(
                                children: [
                                  Text(recipe.drinks![0].strIngredient6!,
                                      style: TextStyle(color: Colors.indigo)),
                                  Text(" - ${recipe.drinks![0].strMeasure6}",
                                      style: TextStyle(color: Colors.indigo)),
                                ]
                            ) : Container(),
                            recipe.drinks![0].strIngredient7 != null ? Row(
                                children: [
                                  Text(recipe.drinks![0].strIngredient7!,
                                      style: TextStyle(color: Colors.indigo)),
                                  Text(" - ${recipe.drinks![0].strMeasure7}",
                                      style: TextStyle(color: Colors.indigo)),
                                ]
                            ) : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8,16,16,16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.indigo,
                            width: 3,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Center(child: Text('Instructions', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800, color: Colors.indigo))),
                              Text(
                                "${recipe.drinks![0].strInstructions}",
                                maxLines: 15,
                                softWrap: true,
                                style: TextStyle(color: Colors.indigo, fontSize: 14.0),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
