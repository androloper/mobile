import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class RefreshScreen extends StatefulWidget {
  final Widget child;
  final Future Function() onRefresh;
  const RefreshScreen({Key? key, required this.onRefresh, required this.child})
      : super(key: key);

  @override
  _RefreshScreenState createState() => _RefreshScreenState();
}

class _RefreshScreenState extends State<RefreshScreen> {
  @override
  Widget build(BuildContext context){
    if(Platform.isIOS){
      return buildIOS();
    }else{
      return buildAndroid();
    }
  }

  Widget buildAndroid() => RefreshIndicator(
    onRefresh: widget.onRefresh,
    child: widget.child,
  );

  Widget buildIOS() => CustomScrollView(
    slivers: [
      CupertinoSliverRefreshControl(onRefresh: widget.onRefresh),
      SliverToBoxAdapter(child: widget.child),
    ],
  );
}