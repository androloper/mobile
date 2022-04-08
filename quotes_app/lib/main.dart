import 'package:flutter/material.dart';
import 'package:quotes_app/services/api.dart';
import 'package:quotes_app/ui/quote_screen.dart';

void main() async{
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
      home: const MyHomePage(title: 'IG @FrontendsUnion #QuotesApp'),
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
  final api = Api();
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
        padding: const EdgeInsets.fromLTRB(60.0, 30.0, 60.0, 30.0),
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
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                        child: Text("Quote of the Day",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.02, color: Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        await api.todaysQuote();
                        Navigator.push(context,MaterialPageRoute(
                            builder: (context) => QuoteScreen(name: 'Quote of the Day',)));
                      })),
              SizedBox(
                  width: width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                        child: Text("Inspiring",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.02, color: Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        await api.todaysQuoteOfCategory('inspire');
                        Navigator.push(context,MaterialPageRoute(
                            builder: (context) => QuoteScreen(name: 'Inspiring Quote of the Day',)));
                      })),
              SizedBox(
                  width: width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        //androloper
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                        child: Text("Management",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.02, color: Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        await api.todaysQuoteOfCategory('management');
                        Navigator.push(context,MaterialPageRoute(
                            builder: (context) => QuoteScreen(name: 'Management Quote of the Day',)));
                      })),
              SizedBox(
                  width: width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                        child: Text("Sports",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.02, color: Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        await api.todaysQuoteOfCategory('sports');
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => QuoteScreen(name: 'Sports Quote of the Day')));
                      })),
              SizedBox(
                  width: width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                        child: Text("Life",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.02, color: Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        await api.todaysQuoteOfCategory('life');
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => QuoteScreen(name: 'Quote of the Day About Life')));
                      })),
              SizedBox(
                  width: width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                        child: Text("Funny",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.02, color: Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        await api.todaysQuoteOfCategory('funny');
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => QuoteScreen(name: 'Funny Quote of the Day')));
                      })),
              SizedBox(
                  width: width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                        child: Text("Love",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.02, color: Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        await api.todaysQuoteOfCategory('love');
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => QuoteScreen(name: 'Quote of the Day About Love')));
                      })),
              SizedBox(
                  width: width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                        child: Text("Art",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.02, color: Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        await api.todaysQuoteOfCategory('art');
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => QuoteScreen(name: 'Art Quote of the Day')));
                      })),
              SizedBox(
                  width: width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                        child: Text("Students",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.02, color: Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        await api.todaysQuoteOfCategory('students');
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => QuoteScreen(name: 'Quote of the Day For Students')));
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
