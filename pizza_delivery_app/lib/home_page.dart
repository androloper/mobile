import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pizza_delivery_app/provider/current_pizza_index_notifier.dart';
import 'package:pizza_delivery_app/widgets/custom_tag.dart';
import 'package:pizza_delivery_app/widgets/home_widgets/home_header.dart';
import 'package:pizza_delivery_app/widgets/pizza_palate.dart';
import 'package:provider/provider.dart';

import 'helpers/styles.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentPizzaIndexNotifier(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 45),
            decoration: BoxDecoration(gradient: Styles.backgroundGradient),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HomeHeader(),
                SizedBox(height: 30),
                CustomTag(),
                SizedBox(height: 20),
                PizzaPalate(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
