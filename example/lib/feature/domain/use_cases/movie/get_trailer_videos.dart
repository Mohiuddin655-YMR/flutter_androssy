import '../../../../index.dart';

class GetTrailerVideos {
  final MovieRepository repository;

  const GetTrailerVideos({
    required this.repository,
  });

  Future<List<Movie>> call() {
    return repository.getTrailers();
  }
}
