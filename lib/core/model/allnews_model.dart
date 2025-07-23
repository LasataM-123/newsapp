// To parse this JSON data, do
//
//     final allNewsModel = allNewsModelFromJson(jsonString);

import 'dart:convert';

AllNewsModel allNewsModelFromJson(String str) => AllNewsModel.fromJson(json.decode(str));

String allNewsModelToJson(AllNewsModel data) => json.encode(data.toJson());

class AllNewsModel {
    final Meta? meta;
    final List<Datum>? data;

    AllNewsModel({
        this.meta,
        this.data,
    });

    factory AllNewsModel.fromJson(Map<String, dynamic> json) => AllNewsModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
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
    final String? language;
    final DateTime? publishedAt;
    final String? source;
    final List<String>? categories;
    final dynamic relevanceScore;

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
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        title: json["title"],
        description: json["description"],
        keywords: json["keywords"],
        snippet: json["snippet"],
        url: json["url"],
        imageUrl: json["image_url"],
        language: json["language"],
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        source: json["source"],
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
        relevanceScore: json["relevance_score"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "title": title,
        "description": description,
        "keywords": keywords,
        "snippet": snippet,
        "url": url,
        "image_url": imageUrl,
        "language": language,
        "published_at": publishedAt?.toIso8601String(),
        "source": source,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
        "relevance_score": relevanceScore,
    };
}

class Meta {
    final int? found;
    final int? returned;
    final int? limit;
    final int? page;

    Meta({
        this.found,
        this.returned,
        this.limit,
        this.page,
    });

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
