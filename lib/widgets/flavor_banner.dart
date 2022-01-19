import 'package:flutter/material.dart';

/// Widget for draw banner
class FlavorBanner extends StatelessWidget {
  /// Widget inside FlavorBanner
  final Widget? child;

  final Color? color;

  final String? name;

  final BannerLocation? location;

  const FlavorBanner({
    Key? key,
    this.child,
    this.color,
    this.name,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (name == null || name!.isEmpty) {
      return child!;
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        color: color ?? Colors.red,
        message: name!,
        location: location != null ? location! : BannerLocation.bottomEnd,
        child: child,
        textStyle: TextStyle(
          color: HSLColor.fromColor(color ?? Colors.red).lightness < 0.8
              ? Colors.white
              : Colors.black87,
          fontSize: 12.0 * 0.85,
          fontWeight: FontWeight.w900,
          height: 1.0,
        ),
      ),
    );
  }
}
