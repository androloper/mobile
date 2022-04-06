import 'author1.dart';
import 'category.dart';
import 'id.dart';
import 'link1.dart';
import 'schema_series.dart';

class Entry {
  Id? title;
  Id? id;
  Author1? author;
  Id? published;
  Id? updated;
  Id? dctermsLanguage;
  Id? dctermsPublisher;
  Id? dctermsIssued;
  Id? summary;
  List<Category>? category;
  List<Link1>? link;
  SchemaSeries? schemaSeries;

  Entry(
      {this.title,
        this.id,
        this.author,
        this.published,
        this.updated,
        this.dctermsLanguage,
        this.dctermsPublisher,
        this.dctermsIssued,
        this.summary,
        this.category,
        this.link,
        this.schemaSeries});

  Entry.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Id.fromJson(json['title']) : null;
    id = json['id'] != null ? Id.fromJson(json['id']) : null;
    if (json['author'] != null) {
      if (json['author'].runtimeType.toString() == 'List<dynamic>') {
        author = Author1.fromJson(json['author'][0]);
      } else {
        author = Author1.fromJson(json['author']);
      }
    }

    published =
    json['published'] != null ? Id.fromJson(json['published']) : null;
    updated = json['updated'] != null ? Id.fromJson(json['updated']) : null;
    dctermsLanguage = json[r'dcterms$language'] != null
        ? Id.fromJson(json[r'dcterms$language'])
        : null;
    dctermsPublisher = json[r'dcterms$publisher'] != null
        ? Id.fromJson(json[r'dcterms$publisher'])
        : null;
    dctermsIssued = json[r'dcterms$issued'] != null
        ? Id.fromJson(json[r'dcterms$issued'])
        : null;
    summary = json['summary'] != null ? Id.fromJson(json['summary']) : null;
    if (json['category'] != null) {
      String? t = json['category'].runtimeType.toString();
      if (t == 'List<dynamic>' || t == '_GrowableList<dynamic>') {
        category = <Category>[];
        json['category'].forEach((v) {
          category!.add(Category.fromJson(v));
        });
      } else {
        category = <Category>[];
        category!.add(Category.fromJson(json['category']));
      }
    }
    if (json['link'] != null) {
      link = <Link1>[];
      json['link'].forEach((v) {
        link!.add(Link1.fromJson(v));
      });
    }
    schemaSeries = json[r'schema$Series'] != null
        ? SchemaSeries.fromJson(json[r'schema$Series'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.id != null) {
      data['id'] = this.id!.toJson();
    }
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.published != null) {
      data['published'] = this.published!.toJson();
    }
    if (this.updated != null) {
      data['updated'] = this.updated!.toJson();
    }
    if (this.dctermsLanguage != null) {
      data[r'dcterms$language'] = this.dctermsLanguage!.toJson();
    }
    if (this.dctermsPublisher != null) {
      data[r'dcterms$publisher'] = this.dctermsPublisher!.toJson();
    }
    if (this.dctermsIssued != null) {
      data[r'dcterms$issued'] = this.dctermsIssued!.toJson();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.link != null) {
      data['link'] = this.link!.map((v) => v.toJson()).toList();
    }
    if (this.schemaSeries != null) {
      data[r'schema$Series'] = this.schemaSeries!.toJson();
    }
    return data;
  }
}