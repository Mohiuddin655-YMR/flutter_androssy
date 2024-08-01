part of 'view.dart';

class _Icon extends StatefulWidget {
  final bool visibility;
  final dynamic icon;
  final double size;
  final Color? tint;
  final EdgeInsets margin;

  const _Icon({
    required this.visibility,
    required this.icon,
    required this.size,
    required this.tint,
    required this.margin,
  });

  @override
  State<_Icon> createState() => _IconState();
}

class _IconState extends State<_Icon> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.visibility) return const SizedBox.shrink();
    return Padding(
      padding: widget.margin,
      child: AndrossyIcon(
        icon: widget.icon,
        size: widget.size,
        color: widget.tint,
      ),
    );
  }
}
