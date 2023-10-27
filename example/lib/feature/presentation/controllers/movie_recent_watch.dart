import 'package:data_management/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../index.dart';

class MovieRecentWatchController extends Cubit<DataResponse<Movie>> {
  final GetRecentWatchMovies get;

  MovieRecentWatchController({
    required this.get,
  }) : super(DataResponse(loading: true));

  void fetch() async {
    emit(state.copy(loading: true));
    var data = await get.call();
    if (data.isNotEmpty) {
      emit(state.copy(result: data));
    } else {
      emit(state.copy(exception: "Data not found!"));
    }
  }
}
