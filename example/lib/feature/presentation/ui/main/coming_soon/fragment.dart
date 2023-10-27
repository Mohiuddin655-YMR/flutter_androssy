import 'package:data_management/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../index.dart';

class ComingSoonFragment extends StatelessWidget {
  final String Function(String value) translate;

  const ComingSoonFragment({
    super.key,
    required this.translate,
  });

  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      width: double.infinity,
      scrollable: true,
      scrollingType: ViewScrollingType.bouncing,
      paddingBottom: 16,
      children: [
        BlocBuilder<MovieTrailerController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForTrailer(
              category: 'Trailers',
              translate: translate,
              placeholderMode: response.isLoading,
              movie: response.isLoading ? Movie() : response.result[1],
            );
          },
        ),
        BlocBuilder<MovieTrailerController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForTrailer(
              category: 'Trailers',
              translate: translate,
              placeholderMode: response.isLoading,
              movie: response.isLoading ? Movie() : response.result[3],
            );
          },
        ),
        BlocBuilder<MovieTrailerController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForTrailer(
              category: 'Trailers',
              translate: translate,
              placeholderMode: response.isLoading,
              movie: response.isLoading ? Movie() : response.result[5],
            );
          },
        ),
      ],
    );
  }
}
