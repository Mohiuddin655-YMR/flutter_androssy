import '../../../../index.dart';

class GetRecentWatchMovies {
  final MovieRepository repository;

  const GetRecentWatchMovies({
    required this.repository,
  });

  Future<List<Movie>> call() {
    return repository.getRecentWatchVideos();
  }
}
