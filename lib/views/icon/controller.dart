part of 'view.dart';

class IconViewController extends ViewController {
  BoxFit fit = BoxFit.contain;

  void setIconFit(BoxFit value) {
    onNotifyWithCallback(() => fit = value);
  }

  dynamic _icon;

  set icon(dynamic value) => _icon = value;

  void setIcon(dynamic value) {
    onNotifyWithCallback(() => icon = value);
  }

  ValueState<dynamic>? iconState;

  void setIconState(ValueState<dynamic>? value) {
    onNotifyWithCallback(() => iconState = value);
  }

  double _size = 24;

  set size(double value) => _size = value;

  void setIconSize(double value) {
    onNotifyWithCallback(() => size = value);
  }

  ValueState<double>? iconSizeState;

  void setIconSizeState(ValueState<double>? value) {
    onNotifyWithCallback(() => iconSizeState = value);
  }

  Color? _tint;

  set tint(Color? value) => _tint = value;

  void setIconTint(Color value) {
    onNotifyWithCallback(() => tint = value);
  }

  ValueState<Color>? tintState;

  void setIconTintState(ValueState<Color>? value) {
    onNotifyWithCallback(() => tintState = value);
  }

  BlendMode tintMode = BlendMode.srcIn;

  void setIconTintMode(BlendMode value) {
    onNotifyWithCallback(() => tintMode = value);
  }

  IconViewController fromIconView(IconView view) {
    super.fromView(view);
    fit = view.fit;
    icon = view.icon;
    iconState = view.iconState;
    size = view.size;
    tint = view.tint;
    tintState = view.tintState;
    tintMode = view.tintMode;
    return this;
  }

  dynamic get icon => iconState?.fromController(this) ?? _icon;

  double get size => iconSizeState?.fromController(this) ?? _size;

  double get iconSize => size - (paddingAll / 2);

  Color? get tint => tintState?.fromController(this) ?? _tint;
}
