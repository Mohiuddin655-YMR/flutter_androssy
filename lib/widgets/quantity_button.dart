part of '../widgets.dart';

class QuantityButton extends StatefulWidget {
  final double? width, height;
  final EdgeInsets? margin, padding;
  final double borderRadius;
  final int counter;
  final int initial;
  final int maxCount;
  final int minCount;

  final Function(int value)? onChange;

  const QuantityButton({
    Key? key,
    this.width = 100,
    this.height = 40,
    this.margin,
    this.padding,
    this.borderRadius = 0,
    this.counter = -1,
    this.initial = 1,
    this.maxCount = 1000,
    this.minCount = 1,
    this.onChange,
  }) : super(key: key);

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  late int counter = widget.counter > 1 ? widget.counter : 1;
  late int maxCount = widget.maxCount > 0 ? widget.maxCount : 1000;
  late int minCount = widget.minCount > 0 ? widget.minCount : 0;
  late int value = widget.initial > 0 ? widget.initial : 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withAlpha(50),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Row(
        children: [
          _QBIcon(
            icon: Icons.add,
            isCountable: value < maxCount,
            onClick: () {
              setState(() {
                value = value + counter;
                value = min(value, maxCount);
                if (widget.onChange != null) widget.onChange?.call(value);
              });
            },
          ),
          const Spacer(),
          Text("$value"),
          const Spacer(),
          _QBIcon(
            icon: Icons.remove,
            isCountable: value > minCount,
            onClick: () {
              setState(() {
                value = value - counter;
                value = max(value, minCount);
                if (widget.onChange != null) widget.onChange?.call(value);
              });
            },
          ),
        ],
      ),
    );
  }
}

class _QBIcon extends StatelessWidget {
  final bool isCountable;
  final IconData icon;
  final Function() onClick;

  const _QBIcon({
    Key? key,
    required this.isCountable,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isCountable ? onClick : null,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(
          icon,
          color: Colors.black.withAlpha(isCountable ? 100 : 50),
        ),
      ),
    );
  }
}
