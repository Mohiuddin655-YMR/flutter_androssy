import '../../../../index.dart';

class GetFreeForLimitedTimeMovies {
  final MovieRepository repository;

  const GetFreeForLimitedTimeMovies({
    required this.repository,
  });

  Future<List<Movie>> call() {
    return repository.getFreeLimitedTimeVideos();
  }
}
