import '../../../index.dart';

class MovieRepository extends VideoRepository<Movie> {
  final MovieSource source;

  MovieRepository({
    required this.source,
  });

  @override
  Future<List<Movie>> getFreeLimitedTimeVideos() {
    return source.getFreeLimitedTimeVideos();
  }

  @override
  Future<List<Movie>> getLatestVideos() {
    return source.getLatestVideos();
  }

  @override
  Future<List<Movie>> getMostWatchedVideos() {
    return source.getMostWatchedVideos();
  }

  @override
  Future<List<Movie>> getPremiumVideos() {
    return source.getPremiumVideos();
  }

  @override
  Future<List<Movie>> getRecentWatchVideos() {
    return source.getRecentWatchVideos();
  }

  @override
  Future<List<Movie>> getShortVideos() {
    return source.getShortVideos();
  }

  @override
  Future<List<Movie>> getSpecificHeroVideos(String heroName) {
    return source.getSpecificHeroVideos(heroName);
  }

  @override
  Future<List<Movie>> getTrailers() {
    return source.getTrailers();
  }
}
