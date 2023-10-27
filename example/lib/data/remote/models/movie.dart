import 'package:data_management/core.dart';
import 'package:flutter_andomie/core.dart';

class Movie extends Data {
  final String? thumbnail;
  final String? url;
  final String? link;
  final String? name;
  final String? description;

  Movie({
    super.id,
    super.timeMills,
    this.thumbnail,
    this.url,
    this.link,
    this.name,
    this.description,
  });

  factory Movie.from(Object? source) {
    return Movie(
      id: source.entityId,
      timeMills: source.entityTimeMills,
      thumbnail: source.entityValue("thumbnail"),
      url: source.entityValue("url"),
      link: source.entityValue("link"),
      name: source.entityValue("name"),
      description: source.entityValue("description"),
    );
  }
}
