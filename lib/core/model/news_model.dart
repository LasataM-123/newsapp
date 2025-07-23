// To parse this JSON data, do
//
//     final topNewsModel = topNewsModelFromJson(jsonString);

import 'dart:convert';

TopNewsModel topNewsModelFromJson(String str) =>
    TopNewsModel.fromJson(json.decode(str));

String topNewsModelToJson(TopNewsModel data) => json.encode(data.toJson());

class TopNewsModel {
  final Meta? meta;
  final List<Datum>? data;

  TopNewsModel({this.meta, this.data});

  factory TopNewsModel.fromJson(Map<String, dynamic> json) => TopNewsModel(
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    data: json["data"] == null
        ? []
        : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta?.toJson(),
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? uuid;
  final String? title;
  final String? description;
  final String? keywords;
  final String? snippet;
  final String? url;
  final String? imageUrl;
  final Language? language;
  final DateTime? publishedAt;
  final String? source;
  final List<Category>? categories;
  final dynamic relevanceScore;
  final Locale? locale;

  Datum({
    this.uuid,
    this.title,
    this.description,
    this.keywords,
    this.snippet,
    this.url,
    this.imageUrl,
    this.language,
    this.publishedAt,
    this.source,
    this.categories,
    this.relevanceScore,
    this.locale,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uuid: json["uuid"],
    title: json["title"],
    description: json["description"],
    keywords: json["keywords"],
    snippet: json["snippet"],
    url: json["url"],
    imageUrl: json["image_url"],
    language: languageValues.map[json["language"]]!,
    publishedAt: json["published_at"] == null
        ? null
        : DateTime.parse(json["published_at"]),
    source: json["source"],
    categories: json["categories"] == null
        ? []
        : List<Category>.from(
            json["categories"]!.map((x) => categoryValues.map[x]!),
          ),
    relevanceScore: json["relevance_score"],
    locale: localeValues.map[json["locale"]]!,
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "title": title,
    "description": description,
    "keywords": keywords,
    "snippet": snippet,
    "url": url,
    "image_url": imageUrl,
    "language": languageValues.reverse[language],
    "published_at": publishedAt?.toIso8601String(),
    "source": source,
    "categories": categories == null
        ? []
        : List<dynamic>.from(categories!.map((x) => categoryValues.reverse[x])),
    "relevance_score": relevanceScore,
    "locale": localeValues.reverse[locale],
  };
}

enum Category { ENTERTAINMENT, GENERAL, POLITICS }

final categoryValues = EnumValues({
  "entertainment": Category.ENTERTAINMENT,
  "general": Category.GENERAL,
  "politics": Category.POLITICS,
});

enum Language { EN }

final languageValues = EnumValues({"en": Language.EN});

enum Locale { US }

final localeValues = EnumValues({"us": Locale.US});

class Meta {
  final int? found;
  final int? returned;
  final int? limit;
  final int? page;

  Meta({this.found, this.returned, this.limit, this.page});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    found: json["found"],
    returned: json["returned"],
    limit: json["limit"],
    page: json["page"],
  );

  Map<String, dynamic> toJson() => {
    "found": found,
    "returned": returned,
    "limit": limit,
    "page": page,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
