import 'package:blog_app/helpers/ad_helper.dart';
import 'package:blog_app/models/post.dart';
import 'package:blog_app/routes/route_constants.dart';
import 'package:blog_app/widgets/post_card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../models/post.dart';
import '../providers/theme_notifier.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = 'posts';
  List<Post> postsList = <Post>[];
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  bool switchValue = false;
  late Query postQuery;
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();

    _database.ref().child(nodeName).onChildAdded.listen(_childAdded);
    _database.ref().child(nodeName).onChildRemoved.listen(_childRemoves);
    _database.ref().child(nodeName).onChildChanged.listen(_childChanged);
    postQuery = _database.ref().child('posts');

    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DarkThemeProvider themeChange =
        Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        key: _globalKey,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.receipt),
              onPressed: () {
                Navigator.pushNamed(context, RouteConstant.MEDIUM_ARTICLES);
              },
            )
          ],
          title: Image.asset(
            themeChange.darkTheme
                ? 'assets/blog_flutter_dark.png'
                : 'assets/blog_flutter_light.png',
            height: kToolbarHeight + 100,
          ),
          leading: IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: () => _globalKey.currentState!.openDrawer()),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Visibility(
                  visible: postsList.isEmpty,
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text('No post to show'),
                    ),
                  ),
                ),
                Visibility(
                  visible: postsList.isNotEmpty,
                  child: Flexible(
                    child: FirebaseAnimatedList(
                        query: postQuery,
                        itemBuilder: (_, DataSnapshot snap,
                            Animation<double> animation, int index) {
                          if (snap.exists)
                            return PostCard(post: postsList[index]);
                          return const Center(
                              child: CircularProgressIndicator());
                        }),
                  ),
                ),
              ],
            ),
            if (_isBannerAdReady)
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: _bannerAd.size.width.toDouble(),
                  height: _bannerAd.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                ),
              ),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: _bannerAd.size.height + 10),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteConstant.ADD_POST);
            },
            tooltip: 'Add a post',
            child: const Icon(
              Icons.add,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        drawer: BlogDrawer());
  }

  void _childAdded(dynamic event) {
    setState(() {
      postsList.add(Post.fromSnapshot(event.snapshot));
    });
  }

  void _childRemoves(dynamic event) {
    final Post deletedPost = postsList.singleWhere((Post post) {
      return post.key == event.snapshot.key;
    });

    setState(() {
      postsList.removeAt(postsList.indexOf(deletedPost));
    });
  }

  void _childChanged(dynamic event) {
    final Post changedPost = postsList.singleWhere((Post post) {
      return post.key == event.snapshot.key;
    });
    setState(() {
      postsList[postsList.indexOf(changedPost)] =
          Post.fromSnapshot(event.snapshot);
    });
  }
}
