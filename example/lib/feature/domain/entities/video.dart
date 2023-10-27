import 'package:data_management/core.dart';
import 'package:flutter_andomie/core.dart';

class Video extends Data {
  final String? name;
  final String? description;
  final String? thumbnail;
  final String? videoUrl;

  Video({
    super.id,
    super.timeMills,
    this.name,
    this.description,
    this.thumbnail,
    this.videoUrl,
  });

  @override
  Map<String, dynamic> get source {
    return super.source.attach({
      "name": name,
      "description": description,
      "thumbnail": thumbnail,
      "video_url": videoUrl,
    });
  }
}
