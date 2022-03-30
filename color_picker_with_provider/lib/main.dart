import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) => MaterialApp(
                  title: 'Theme Provider Example',
                  theme: ThemeData(
                    primarySwatch: Colors.indigo,
                    appBarTheme: AppBarTheme(brightness: Brightness.dark),
                  ),
                  home: const MainScaffold(),
                )
        )
    );
  }
}

class MainScaffold extends StatelessWidget {
  const MainScaffold({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _ThemedAppBar(
        title: Text('Theme Provider Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.colorize),
            onPressed: () => _showColorPicker(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Text(
                'Lorem',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: themeProvider.mainColor,
                    ),
              ),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: themeProvider.mainColor,
                    ),
              ),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: themeProvider.mainColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showColorPicker(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        content: Wrap(
          children: [
            ColorPicker(
              pickerColor: themeProvider.mainColor,
              onColorChanged: (color) => themeProvider.changeThemeColor(color),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          )
        ],
      ),
    );
  }
}

class _ThemedAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Size preferredSize;
  _ThemedAppBar({
    Key? key,
    this.title,
    this.actions,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => AppBar(
        title: title,
        actions: actions,
        backgroundColor: themeProvider.mainColor,
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  Color mainColor = Colors.indigo;
  void changeThemeColor(Color color) {
    mainColor = color;
    notifyListeners();
  }
}
