import '../../../../index.dart';

class GetSpecificHeroVideos {
  final MovieRepository repository;

  const GetSpecificHeroVideos({
    required this.repository,
  });

  Future<List<Movie>> call(String heroName) {
    return repository.getSpecificHeroVideos(heroName);
  }
}
