import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/quiz.dart';
import 'package:flutter_quiz_app/models/result.dart';

class Api {
  // Future<List<Results>> fetchQuestions() async {
  //   var res = await http.get(Uri.parse("https://opentdb.com/api.php?amount=20"));
  //   var decRes = jsonDecode(res.body)["results"];
  //   // debugPrint(decRes[0]["question"]);
  //   final quiz = Quiz.fromJson(decRes);
  //   // debugPrint(quiz.results![0].question);
  //   // debugPrint(quiz.results![0].correctAnswer);
  //   List<Results>? results = quiz.results;
  //   return results!;
  // }

  Future<List<dynamic>> fetchQuestions() async {
    var response = await http.get(Uri.parse('https://opentdb.com/api.php?amount=20'));
    List<dynamic> quests = jsonDecode(response.body)["results"];
    return quests;
  }
}