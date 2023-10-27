import 'package:flutter_andomie/core.dart';

import '../../../index.dart';

class Movie extends Video {
  Movie({
    super.id,
    super.timeMills,
    super.name,
    super.description,
    super.thumbnail,
    super.videoUrl,
  });

  factory Movie.from(Object? source) {
    return Movie(
      id: source.entityId,
      timeMills: source.entityTimeMills,
      name: source.entityValue("name"),
      description: source.entityValue("description"),
      thumbnail: source.entityValue("thumbnail"),
      videoUrl: source.entityValue("video_url"),
    );
  }
}
