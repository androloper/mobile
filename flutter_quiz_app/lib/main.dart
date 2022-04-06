import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/quiz.dart';
import 'models/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Quiz quiz;
  late List<Results> results;
  late Color c;
  int trues = 0;
  int falses = 0;
  Random random = Random();
  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchQuestions() async {
    // var res = await http.get(Uri.parse("https://opentdb.com/api.php?amount=20&difficulty=hard&type=multiple"));
    var res = await http.get(Uri.parse("https://opentdb.com/api.php?amount=20&type=multiple"));
    String fixed = res.body.replaceAll('&#039;', '\'').replaceAll(r"&quot;", "'");
    var decRes = jsonDecode(fixed);
    c = Colors.black;
    quiz = Quiz.fromJson(decRes);
    results = quiz.results!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent[100],
      appBar: AppBar(
        title: Text("IG @FrontendsUnion #QuizApp"),
        elevation: 0.0,
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.indigoAccent,
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder(
            future: fetchQuestions(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) return errorData(snapshot);
                  return questionList();
              }
            }),
      ),
    );
  }

  Padding errorData(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error: ${snapshot.error}',
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            child: Text("Try Again"),
            onPressed: () {
              fetchQuestions();
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  ListView questionList() {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => Card(
        elevation: 0.0,
        child: ExpansionTile(
          backgroundColor: Colors.grey[300],
          collapsedBackgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  results[index].question!,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FilterChip(
                        backgroundColor: Colors.indigoAccent,
                        label: Text(results[index].category!.toUpperCase(),
                          style: TextStyle(color: Colors.white),),
                        onSelected: (b) {},
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FilterChip(
                        backgroundColor: Colors.indigo,
                        label: Text(
                          results[index].difficulty!.toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                        onSelected: (b) {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          children: results[index].allAnswers!.map((m) {
            return AnswerWidget(results, index, m);
          }).toList(),
        ),
      ),
    );
  }

  Future refresh() async {
    await fetchQuestions().then((value) {
      setState(() {});
    });
  }
}

class AnswerWidget extends StatefulWidget {
  final List<Results> results;
  final int index;
  final String m;

  AnswerWidget(this.results, this.index, this.m);

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  Color c = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          if (widget.m == widget.results[widget.index].correctAnswer) {
            c = Colors.green;
          } else {
            c = Colors.red;
          }
        });
      },
      title: Text(
        widget.m,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          backgroundColor: c,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}