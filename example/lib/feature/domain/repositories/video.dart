import '../../../index.dart';

abstract class VideoRepository<T extends Video> {
  Future<List<T>> getLatestVideos();

  Future<List<T>> getPremiumVideos();

  Future<List<T>> getShortVideos();

  Future<List<T>> getTrailers();

  Future<List<T>> getFreeLimitedTimeVideos();

  Future<List<T>> getRecentWatchVideos();

  Future<List<T>> getSpecificHeroVideos(String heroName);

  Future<List<T>> getMostWatchedVideos();
}
