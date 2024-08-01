import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef OnGestureRecognizerClickListener = void Function(BuildContext context);

class GestureRecognizers {
  final BuildContext context;

  const GestureRecognizers.of(this.context);

  GestureRecognizer? onClick(OnGestureRecognizerClickListener? callback) {
    if (callback != null) {
      return TapGestureRecognizer()..onTap = () => callback(context);
    } else {
      return null;
    }
  }

  GestureRecognizer? onDoubleClick(OnGestureRecognizerClickListener? callback) {
    if (callback != null) {
      return DoubleTapGestureRecognizer()
        ..onDoubleTap = () => callback(context);
    } else {
      return null;
    }
  }

  GestureRecognizer? onLongClick(OnGestureRecognizerClickListener? callback) {
    if (callback != null) {
      return LongPressGestureRecognizer()
        ..onLongPress = () => callback(context);
    } else {
      return null;
    }
  }

  static GestureRecognizer onTap(VoidCallback callback) {
    return TapGestureRecognizer()..onTap = callback;
  }

  static GestureRecognizer onDoubleTap(VoidCallback callback) {
    return DoubleTapGestureRecognizer()..onDoubleTap = callback;
  }

  static GestureRecognizer? onLongPress(VoidCallback callback) {
    return LongPressGestureRecognizer()..onLongPress = callback;
  }
}

extension ViewRecognizerExtension on BuildContext {
  GestureRecognizer? onClick(OnGestureRecognizerClickListener? callback) {
    return GestureRecognizers.of(this).onClick(callback);
  }

  GestureRecognizer? onDoubleClick(OnGestureRecognizerClickListener? callback) {
    return GestureRecognizers.of(this).onDoubleClick(callback);
  }

  GestureRecognizer? onLongClick(OnGestureRecognizerClickListener? callback) {
    return GestureRecognizers.of(this).onLongClick(callback);
  }
}
