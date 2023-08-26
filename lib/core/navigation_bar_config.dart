part of 'core.dart';

class NavigationBarConfig {
  final bool? contrastEnforced;
  final Color? color;
  final Color? dividerColor;
  final Brightness? brightness;

  const NavigationBarConfig({
    this.contrastEnforced,
    this.color,
    Color? dividerColor,
    this.brightness,
  }) : dividerColor = dividerColor ?? color;

  factory NavigationBarConfig.light([Color color = Colors.transparent]) {
    return NavigationBarConfig(
      color: color,
      brightness: Brightness.dark,
    );
  }

  factory NavigationBarConfig.dark([Color color = Colors.black]) {
    return NavigationBarConfig(
      color: color,
      brightness: Brightness.light,
    );
  }

  NavigationBarConfig copyWith({
    bool? contrastEnforced,
    Color? color,
    Color? dividerColor,
    Brightness? brightness,
  }) {
    return NavigationBarConfig(
      contrastEnforced: contrastEnforced ?? this.contrastEnforced,
      color: color ?? this.color,
      dividerColor: dividerColor ?? this.dividerColor,
      brightness: brightness ?? this.brightness,
    );
  }
}
