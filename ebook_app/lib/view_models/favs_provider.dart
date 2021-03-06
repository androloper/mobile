import 'package:flutter/foundation.dart';

import '../database/fav_helper.dart';

class FavoritesProvider extends ChangeNotifier {
  List posts = [];
  bool loading = true;
  var db = FavoriteDB();

  getFavorites() async {
    setLoading(true);
    posts.clear();
    List all = await db.listAll();
    posts.addAll(all);
    setLoading(false);
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setPosts(value) {
    posts = value;
    notifyListeners();
  }

  List getPosts() {
    return posts;
  }
}