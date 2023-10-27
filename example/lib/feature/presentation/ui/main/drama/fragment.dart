import 'package:data_management/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../index.dart';

class DramaFragment extends StatelessWidget {
  final String Function(String value) translate;

  const DramaFragment({
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
                  : response.result.reversed.toList(),
            );
          },
        ),
        BlocBuilder<MovieShortController, DataResponse<Movie>>(
          builder: (context, response) {
            return CategoryMoviesForMedium(
              category: translate("Popular Drama"),
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
              category: translate("Best Drama Shorts"),
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
            return CategoryMoviesForMedium(
              category: translate("Weekly TOp Drama"),
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
            return CategoryMoviesForMedium(
              category: translate("Bongo BOB"),
              translate: translate,
              placeholderMode: response.isLoading,
              movies: response.isLoading
                  ? List.generate(10, (index) => Movie())
                  : response.result.reversed.toList(),
            );
          },
        ),
      ],
    );
  }
}
