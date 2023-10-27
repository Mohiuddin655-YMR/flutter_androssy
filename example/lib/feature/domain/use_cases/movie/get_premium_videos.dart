import '../../../../index.dart';

class GetPremiumMovies {
  final MovieRepository repository;

  const GetPremiumMovies({
    required this.repository,
  });

  Future<List<Movie>> call() {
    return repository.getPremiumVideos();
  }
}
