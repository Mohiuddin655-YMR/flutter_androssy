import 'package:data_management/core.dart';

import '../../index.dart';

class MovieDataController extends RemoteDataController<Movie> {
  MovieDataController(
    super.handler,
  );

  @override
  void gets<R>({OnDataSourceBuilder<R>? source}) async {
    emit(state.copy(loading: true));
    await Future.delayed(const Duration(microseconds: 2));
    emit(state.copy(
      result: List.generate(10, (index) => Movie()),
    ));
  }
}
