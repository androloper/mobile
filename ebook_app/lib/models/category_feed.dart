import 'feed.dart';

class CategoryFeed {
  String? version;
  String? encoding;
  Feed? feed;

  CategoryFeed({this.version, this.encoding, this.feed});

  CategoryFeed.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    encoding = json['encoding'];
    feed = json['feed'] != null ? Feed.fromJson(json['feed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['version'] = this.version;
    data['encoding'] = this.encoding;
    if (this.feed != null) {
      data['feed'] = this.feed!.toJson();
    }
    return data;
  }
}