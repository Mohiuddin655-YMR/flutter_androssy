part of 'view.dart';

class InputTheme {
  final double? width;

  final double? height;

  final TextStyle? textStyle;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;

  final BoxConstraints? constraints;

  final BoxDecoration? decoration;

  const InputTheme({
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.textStyle,
    this.decoration,
    this.constraints,
  });

  InputTheme apply({required InputTheme theme}) {
    return InputTheme(
      width: this.width ?? theme.width,
      height: this.height ?? theme.height,
      textStyle: this.textStyle ?? theme.textStyle,
      constraints: this.constraints ?? theme.constraints,
      decoration: this.decoration ?? theme.decoration,
      padding: this.padding ?? theme.padding,
      margin: this.margin ?? theme.margin,
    );
  }

  InputTheme copyWith({
    double? width,
    double? height,
    TextStyle? textStyle,
    BoxConstraints? constraints,
    BoxDecoration? decoration,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) {
    return InputTheme(
      width: width ?? this.width,
      height: height ?? this.height,
      textStyle: textStyle ?? this.textStyle,
      constraints: constraints ?? this.constraints,
      decoration: decoration ?? this.decoration,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
    );
  }

  InputTheme copyDecorationWith({
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape? shape,
  }) {
    assert(decoration != null);
    return copyWith(
      decoration: decoration?.copyWith(
        color: color,
        image: image,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        gradient: gradient,
        backgroundBlendMode: backgroundBlendMode,
        shape: shape,
      ),
    );
  }

  InputTheme copyBorderWith({required Border border}) {
    assert(decoration != null);
    return copyWith(
      decoration: decoration?.copyWith(border: border),
    );
  }
}
