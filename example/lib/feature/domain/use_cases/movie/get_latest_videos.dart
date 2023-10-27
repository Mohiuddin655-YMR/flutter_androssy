import '../../../../index.dart';

class GetLatestMovies {
  final MovieRepository repository;

  const GetLatestMovies({
    required this.repository,
  });

  Future<List<Movie>> call() {
    return repository.getLatestVideos();
  }
}
