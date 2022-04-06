import 'author.dart';
import 'entry.dart';
import 'id.dart';
import 'link.dart';

class Feed {
  String? xmlLang;
  String? xmlns;
  String? xmlnsDcterms;
  String? xmlnsThr;
  String? xmlnsApp;
  String? xmlnsOpensearch;
  String? xmlnsOpds;
  String? xmlnsXsi;
  String? xmlnsOdl;
  String? xmlnsSchema;
  Id? id;
  Id? title;
  Id? updated;
  Id? icon;
  Author? author;
  List<Link>? link;
  Id? opensearchTotalResults;
  Id? opensearchItemsPerPage;
  Id? opensearchStartIndex;
  List<Entry>? entry;

  Feed(
      {this.xmlLang,
        this.xmlns,
        this.xmlnsDcterms,
        this.xmlnsThr,
        this.xmlnsApp,
        this.xmlnsOpensearch,
        this.xmlnsOpds,
        this.xmlnsXsi,
        this.xmlnsOdl,
        this.xmlnsSchema,
        this.id,
        this.title,
        this.updated,
        this.icon,
        this.author,
        this.link,
        this.opensearchTotalResults,
        this.opensearchItemsPerPage,
        this.opensearchStartIndex,
        this.entry});

  Feed.fromJson(Map<String, dynamic> json) {
    xmlLang = json['xml:lang'];
    xmlns = json[r'xmlns'];
    xmlnsDcterms = json[r'xmlns$dcterms'];
    xmlnsThr = json[r'xmlns$thr'];
    xmlnsApp = json[r'xmlns$app'];
    xmlnsOpensearch = json[r'xmlns$opensearch'];
    xmlnsOpds = json[r'xmlns$opds'];
    xmlnsXsi = json[r'xmlns$xsi'];
    xmlnsOdl = json[r'xmlns$odl'];
    xmlnsSchema = json[r'xmlns$schema'];
    id = json['id'] != null ? Id.fromJson(json['id']) : null;
    title = json['title'] != null ? Id.fromJson(json['title']) : null;
    updated = json['updated'] != null ? Id.fromJson(json['updated']) : null;
    icon = json['icon'] != null ? Id.fromJson(json['icon']) : null;
    author =
    json['author'] != null ? Author.fromJson(json['author']) : null;
    if (json['link'] != null) {
      link = <Link>[];
      json['link'].forEach((v) {
        link!.add(Link.fromJson(v));
      });
    }
    opensearchTotalResults = json[r'opensearch$totalResults'] != null
        ? Id.fromJson(json[r'opensearch$totalResults'])
        : null;
    opensearchItemsPerPage = json[r'opensearch$itemsPerPage'] != null
        ? Id.fromJson(json[r'opensearch$itemsPerPage'])
        : null;
    opensearchStartIndex = json[r'opensearch$startIndex'] != null
        ? Id.fromJson(json[r'opensearch$startIndex'])
        : null;
    if (json['entry'] != null) {
      String? t = json['entry'].runtimeType.toString();
      if (t == 'List<dynamic>' || t == '_GrowableList<dynamic>') {
        entry = <Entry>[];
        json['entry'].forEach((v) {
          entry!.add(Entry.fromJson(v));
        });
      } else {
        entry = <Entry>[];
        entry!.add(Entry.fromJson(json['entry']));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['xml:lang'] = this.xmlLang;
    data[r'xmlns'] = this.xmlns;
    data[r'xmlns$dcterms'] = this.xmlnsDcterms;
    data[r'xmlns$thr'] = this.xmlnsThr;
    data[r'xmlns$app'] = this.xmlnsApp;
    data[r'xmlns$opensearch'] = this.xmlnsOpensearch;
    data[r'xmlns$opds'] = this.xmlnsOpds;
    data[r'xmlns$xsi'] = this.xmlnsXsi;
    data[r'xmlns$odl'] = this.xmlnsOdl;
    data[r'xmlns$schema'] = this.xmlnsSchema;
    if (this.id != null) {
      data['id'] = this.id!.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.updated != null) {
      data['updated'] = this.updated!.toJson();
    }
    if (this.icon != null) {
      data['icon'] = this.icon!.toJson();
    }
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link!.map((v) => v.toJson()).toList();
    }
    if (this.opensearchTotalResults != null) {
      data[r'opensearch$totalResults'] = this.opensearchTotalResults!.toJson();
    }
    if (this.opensearchItemsPerPage != null) {
      data[r'opensearch$itemsPerPage'] = this.opensearchItemsPerPage!.toJson();
    }
    if (this.opensearchStartIndex != null) {
      data[r'opensearch$startIndex'] = this.opensearchStartIndex!.toJson();
    }
    if (this.entry != null) {
      data['entry'] = this.entry!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}