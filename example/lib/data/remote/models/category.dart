import 'package:data_management/core.dart';
import 'package:flutter_andomie/core.dart';

import '../../../index.dart';

class MovieCategoryModel extends Data {
  final String? name;
  final MovieCategoryType? type;
  final List<Movie>? contents;

  MovieCategoryModel({
    super.id,
    super.timeMills,
    this.name,
    this.type,
    this.contents,
  });

  factory MovieCategoryModel.from(Object? source) {
    return MovieCategoryModel(
      id: source.entityId,
      timeMills: source.entityTimeMills,
      name: source.entityValue("name"),
      type: source.entityType("type", (value) {
        return MovieCategoryType.from(value);
      }),
      contents: source.entityObjects("movies", (value) {
        return Movie.from(value);
      }),
    );
  }
}

enum MovieCategoryType {
  banner,
  trailer,
  none;

  factory MovieCategoryType.from(String source) {
    if (source == MovieCategoryType.banner.name) {
      return MovieCategoryType.banner;
    }
    if (source == MovieCategoryType.trailer.name) {
      return MovieCategoryType.trailer;
    }
    return MovieCategoryType.none;
  }

  bool get isBanner => this == MovieCategoryType.banner;

  bool get isTrailer => this == MovieCategoryType.trailer;

  bool get isNone => this == MovieCategoryType.none;
}
