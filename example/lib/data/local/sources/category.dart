import 'package:data_management/core.dart';

import '../../../index.dart';

class BackupMovieCategoryDataSource
    extends LocalDataSourceImpl<MovieCategoryModel> {
  BackupMovieCategoryDataSource({
    super.path = ApiInfo.movieCategories,
  });

  @override
  MovieCategoryModel build(source) {
    return MovieCategoryModel.from(source);
  }
}
