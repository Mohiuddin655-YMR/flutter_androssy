import 'package:data_management/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../index.dart';

class MoviesFragment extends StatelessWidget {
  final String Function(String value) translate;

  const MoviesFragment({
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
        BlocBuilder<MovieCarouselController, DataResponse<Movie>>(
          builder: (context, response) {
            return MainCarousel(
              margin: const EdgeInsets.symmetric(vertical: 12),
              placeholderMode: response.isLoading,
              items: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result.getRange(4, 9).toList(),
            );
          },
        ),
        BlocBuilder<MovieLatestController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("New Movies"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result.reversed.toList(),
            );
          },
        ),
        BlocBuilder<MovieRecentWatchController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Top Bongo Movies"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result,
            );
          },
        ),
        BlocBuilder<MovieTrailerController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForTrailer(
              category: 'Trailers',
              translate: translate,
              placeholderMode: response.isLoading,
              movie: response.isLoading
                  ? Movie()
                  : response.result[0],
            );
          },
        ),
        BlocBuilder<MovieFreeController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Riaz-Purnima Hits"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result,
            );
          },
        ),
        BlocBuilder<MovieShortController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Special Spotlight"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result.reversed.toList(),
            );
          },
        ),
        BlocBuilder<MovieTrailerController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForTrailer(
              category: 'Trailers',
              translate: translate,
              placeholderMode: response.isLoading,
              movie: response.isLoading
                  ? Movie()
                  : response.result[1],
            );
          },
        ),
        BlocBuilder<MovieShortController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Shakib-Apu"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result,
            );
          },
        ),
        BlocBuilder<MovieShortController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Action Movies"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result.reversed.toList(),
            );
          },
        ),
        BlocBuilder<MovieShortController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForSmall(
              category: translate("Bangla Classic Movies"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result,
            );
          },
        ),
      ],
    );
  }
}
