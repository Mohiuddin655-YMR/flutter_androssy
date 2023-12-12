import 'package:flutter/material.dart';

import '../view/view.dart';

part 'controller.dart';
part 'loading_state.dart';
part 'typedefs.dart';

class LoaderView<T> extends YMRView<LoaderViewController<T>> {
  final LoaderViewFutureDataLoader<T>? future;
  final LoaderViewStreamDataLoader<T>? stream;
  final LoaderViewBuilder<T>? onLoading;
  final LoaderViewBuilder<T> onLoaded;
  final LoaderViewBuilder<T>? onNullable;
  final LoaderViewBuilder<T>? onFailed;
  final bool connection;

  const LoaderView({
    /// BASE PROPERTIES
    super.key,
    super.controller,

    /// BORDER PROPERTIES
    super.borderColor,
    super.borderColorState,
    super.borderSize,
    super.borderSizeState,
    super.borderHorizontal,
    super.borderHorizontalState,
    super.borderVertical,
    super.borderVerticalState,
    super.borderTop,
    super.borderTopState,
    super.borderBottom,
    super.borderBottomState,
    super.borderStart,
    super.borderStartState,
    super.borderEnd,
    super.borderEndState,

    /// BORDER RADIUS PROPERTIES
    super.borderRadius,
    super.borderRadiusState,
    super.borderRadiusBL,
    super.borderRadiusBLState,
    super.borderRadiusBR,
    super.borderRadiusBRState,
    super.borderRadiusTL,
    super.borderRadiusTLState,
    super.borderRadiusTR,
    super.borderRadiusTRState,

    ///
    ///
    ///
    ///
    super.flex,
    super.gravity,
    this.connection = true,
    this.future,
    this.stream,
    this.onLoading,
    required this.onLoaded,
    this.onNullable,
    this.onFailed,
  });

  @override
  LoaderViewController<T> initController() => LoaderViewController();

  @override
  LoaderViewController<T> attachController(LoaderViewController<T> controller) {
    return controller.fromLoaderView(this);
  }

  @override
  Widget? attach(BuildContext context, LoaderViewController<T> controller) {
    if (connection) {
      if (stream != null) {
        return StreamBuilder(
          stream: stream?.call(),
          builder: (context, snapshot) {
            controller.data = snapshot.data;
            var state = LoadingState.from(snapshot);
            Widget? child;
            if (state.isLoading) {
              child = onLoading?.call(context, controller);
            } else if (state.isNullable) {
              child = onNullable?.call(context, controller);
            } else {
              return onLoaded(context, controller);
            }
            return child ?? onLoaded(context, controller);
          },
        );
      } else {
        return FutureBuilder(
          future: future?.call(),
          builder: (context, snapshot) {
            controller.data = snapshot.data;
            var state = LoadingState.from(snapshot);
            Widget? child;
            if (state.isLoading) {
              child = onLoading?.call(context, controller);
            } else if (state.isNullable) {
              child = onNullable?.call(context, controller);
            } else {
              return onLoaded(context, controller);
            }
            return child ?? onLoaded(context, controller);
          },
        );
      }
    } else {
      return onFailed?.call(context, controller) ??
          onLoaded(context, controller);
    }
  }
}
