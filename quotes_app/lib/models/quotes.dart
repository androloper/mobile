class Quotes {
  String? quote;
  String? length;
  String? author;
  List<String>? tags;
  String? category;
  String? language;
  String? date;
  String? permalink;
  String? id;
  String? background;
  String? title;

  Quotes(
      {this.quote,
        this.length,
        this.author,
        this.tags,
        this.category,
        this.language,
        this.date,
        this.permalink,
        this.id,
        this.background,
        this.title});

  Quotes.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
    length = json['length'];
    author = json['author'];
    tags = json['tags'].cast<String>();
    category = json['category'];
    language = json['language'];
    date = json['date'];
    permalink = json['permalink'];
    id = json['id'];
    background = json['background'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quote'] = this.quote;
    data['length'] = this.length;
    data['author'] = this.author;
    data['tags'] = this.tags;
    data['category'] = this.category;
    data['language'] = this.language;
    data['date'] = this.date;
    data['permalink'] = this.permalink;
    data['id'] = this.id;
    data['background'] = this.background;
    data['title'] = this.title;
    return data;
  }
}