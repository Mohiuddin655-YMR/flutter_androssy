import 'package:data_management/core.dart';

import '../../index.dart';

class MovieCategoryDataController
    extends RemoteDataController<MovieCategoryModel> {
  MovieCategoryDataController(
    super.handler,
  );

  @override
  void gets<R>({OnDataSourceBuilder<R>? source}) async {
    emit(state.copy(loading: true));
    await Future.delayed(const Duration(microseconds: 2));
    emit(
      state.copy(
        result: List.generate(
          25,
          (index) => MovieCategoryModel(
            name: "Category [$index]",
            type: index % 5 == 0
                ? MovieCategoryType.banner
                : index % 5 == 4
                    ? MovieCategoryType.trailer
                    : MovieCategoryType.none,
            contents: List.generate(
              10,
              (index) => Movie(
                name: "Movie name [$index]",
                description: "Movie description [$index]",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
