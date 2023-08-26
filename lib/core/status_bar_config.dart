part of 'core.dart';

class StatusBarConfig {
  final bool? contrastEnforced;
  final Color? color;
  final Brightness? brightness;
  final Brightness? iconBrightness;

  const StatusBarConfig({
    this.contrastEnforced,
    this.color,
    this.brightness,
    Brightness? iconBrightness,
  }) : iconBrightness = iconBrightness ?? brightness;

  factory StatusBarConfig.light([Color color = Colors.transparent]) {
    return StatusBarConfig(
      color: color,
      brightness: Brightness.dark,
    );
  }

  factory StatusBarConfig.dark([Color color = Colors.transparent]) {
    return StatusBarConfig(
      color: color,
      brightness: Brightness.light,
    );
  }

  StatusBarConfig copyWith({
    bool? contrastEnforced,
    Color? color,
    Brightness? brightness,
    Brightness? iconBrightness,
  }) {
    return StatusBarConfig(
      contrastEnforced: contrastEnforced ?? this.contrastEnforced,
      color: color ?? this.color,
      brightness: brightness ?? this.brightness,
      iconBrightness: iconBrightness ?? this.iconBrightness,
    );
  }
}
