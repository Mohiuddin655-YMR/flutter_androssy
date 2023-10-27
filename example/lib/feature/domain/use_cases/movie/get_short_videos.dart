import '../../../../index.dart';

class GetShortMovies {
  final MovieRepository repository;

  const GetShortMovies({
    required this.repository,
  });

  Future<List<Movie>> call() {
    return repository.getShortVideos();
  }
}
