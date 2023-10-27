import 'package:data_management/core.dart';

import '../../../index.dart';

class BackupMovieDataSource extends LocalDataSourceImpl<Movie> {
  BackupMovieDataSource({
    super.path = ApiInfo.movies,
  });

  @override
  Movie build(source) {
    return Movie.from(source);
  }
}
