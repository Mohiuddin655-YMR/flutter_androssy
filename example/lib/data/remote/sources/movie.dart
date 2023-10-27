import 'package:data_management/core.dart';

import '../../../index.dart';

class MovieDataSource extends FireStoreDataSourceImpl<Movie> {
  MovieDataSource({
    super.path = ApiInfo.movies,
  });

  @override
  Movie build(source) {
    return Movie.from(source);
  }
}
