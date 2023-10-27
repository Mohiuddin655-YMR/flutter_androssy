import 'package:data_management/core.dart';

import '../../../index.dart';

class MovieCategoryDataSource extends FireStoreDataSourceImpl<MovieCategoryModel> {
  MovieCategoryDataSource({
    super.path = ApiInfo.movies,
  });

  @override
  MovieCategoryModel build(source) {
    return MovieCategoryModel.from(source);
  }
}
