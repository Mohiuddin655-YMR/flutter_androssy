import '../../../../index.dart';

class GetMostWatchedMovies {
  final MovieRepository repository;

  const GetMostWatchedMovies({
    required this.repository,
  });

  Future<List<Movie>> call() {
    return repository.getMostWatchedVideos();
  }
}
