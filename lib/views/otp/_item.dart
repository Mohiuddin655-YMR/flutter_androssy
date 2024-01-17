part of 'view.dart';

class _Item extends StatelessWidget {
  final _RawOtpViewState state;
  final int index;

  const _Item({
    required this.state,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final pinTheme = _pinTheme(index);

    return Flexible(
      child: AnimatedContainer(
        height: pinTheme.height,
        width: pinTheme.width,
        constraints: pinTheme.constraints,
        padding: pinTheme.padding,
        margin: pinTheme.margin,
        decoration: pinTheme.decoration,
        alignment: state.widget.inputContentAlignment,
        duration: state.widget.inputAnimationDuration,
        curve: state.widget.inputAnimationCurve,
        child: AnimatedSwitcher(
          switchInCurve: state.widget.inputAnimationCurve,
          switchOutCurve: state.widget.inputAnimationCurve,
          duration: state.widget.inputAnimationDuration,
          transitionBuilder: _getTransition,
          child: _buildFieldContent(index, pinTheme),
        ),
      ),
    );
  }

  InputTheme _pinTheme(int index) {
    if (!state.isEnabled) {
      return _pinThemeOrDefault(state.widget.disabledInputTheme);
    }

    if (state.showErrorState) {
      return _pinThemeOrDefault(state.widget.errorInputTheme);
    }

    if (state.hasFocus &&
        index == state.selectedIndex.clamp(0, state.widget.inputSize - 1)) {
      return _pinThemeOrDefault(state.widget.focusedInputTheme);
    }

    if (index < state.selectedIndex) {
      return _pinThemeOrDefault(state.widget.submittedInputTheme);
    }

    return _pinThemeOrDefault(state.widget.followingInputTheme);
  }

  InputTheme _getDefaultPinTheme() =>
      state.widget.inputTheme ?? _Constants._defaultInputTheme;

  InputTheme _pinThemeOrDefault(InputTheme? theme) =>
      theme ?? _getDefaultPinTheme();

  Widget _buildFieldContent(int index, InputTheme pinTheme) {
    final pin = state.text;
    final key = ValueKey<String>(index < pin.length ? pin[index] : '');
    final isSubmittedPin = index < pin.length;

    if (isSubmittedPin) {
      if (state.widget.obscureText && state.widget.obscuringWidget != null) {
        return SizedBox(key: key, child: state.widget.obscuringWidget);
      }

      return Text(
        state.widget.obscureText ? state.widget.obscuringCharacter : pin[index],
        key: key,
        style: pinTheme.textStyle,
      );
    }

    final isActiveField = index == pin.length;
    final focused =
        state.effectiveFocusNode.hasFocus || !state.widget.useNativeKeyboard;
    final shouldShowCursor =
        state.widget.showCursor && state.isEnabled && isActiveField && focused;

    if (shouldShowCursor) {
      return _buildCursor(pinTheme);
    }

    if (state.widget.initialFilledWidget != null) {
      return SizedBox(key: key, child: state.widget.initialFilledWidget);
    }

    return Text('', key: key, style: pinTheme.textStyle);
  }

  Widget _buildCursor(InputTheme pinTheme) {
    if (state.widget.isCursorAnimationEnabled) {
      return _PinputAnimatedCursor(
        textStyle: pinTheme.textStyle,
        cursor: state.widget.cursor,
      );
    }

    return _PinputCursor(
      textStyle: pinTheme.textStyle,
      cursor: state.widget.cursor,
    );
  }

  Widget _getTransition(Widget child, Animation<double> animation) {
    if (child is _PinputAnimatedCursor) {
      return child;
    }

    switch (state.widget.inputAnimationType) {
      case InputAnimationType.none:
        return child;
      case InputAnimationType.fade:
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      case InputAnimationType.scale:
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      case InputAnimationType.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin:
                state.widget.slideTransitionBeginOffset ?? const Offset(0.8, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case InputAnimationType.rotation:
        return RotationTransition(
          turns: animation,
          child: child,
        );
    }
  }
}
