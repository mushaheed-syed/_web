import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/widgets.dart';

class SizeType {
  SizeType._({
    required this.mediaQueryData,
    required this.windowType,
  });

  final MediaQueryData mediaQueryData;
  final AdaptiveWindowType windowType;

  double get shortestSide => mediaQueryData.size.shortestSide;

  /// Small Mobile
  bool get isXXSmall => shortestSide < 360;

  bool get isNotXXSmall => !isXXSmall;

  /// Regular Mobile
  bool get isXSmall => windowType == AdaptiveWindowType.xsmall;

  bool get isNotXSmall => !isXSmall;

  bool get isSmall => windowType == AdaptiveWindowType.small;

  bool get isNotSmall => !isSmall;

  bool get isMedium => windowType == AdaptiveWindowType.medium;

  bool get isNotMedium => !isMedium;

  bool get isLarge => windowType == AdaptiveWindowType.large;

  bool get isNotLarge => !isLarge;

  bool get isXLarge => windowType == AdaptiveWindowType.xlarge;

  bool get isNotXLarge => !isXLarge;

  /// Mobile
  bool get isSmallOrXSmall => isXSmall || isSmall;

  bool isSize({
    bool xxsmall = true,
    bool xsmall = true,
    bool small = true,
    bool medium = true,
    bool large = true,
    bool xlarge = true,
  }) {
    if (xxsmall && isXXSmall) return true;
    if (xsmall && isXSmall) return true;
    if (small && isSmall) return true;
    if (medium && isMedium) return true;
    if (large && isLarge) return true;
    if (xlarge && isXLarge) return true;
    return false;
  }

  bool isSizef({
    bool xxsmall = false,
    bool xsmall = false,
    bool small = false,
    bool medium = false,
    bool large = false,
    bool xlarge = false,
  }) =>
      isSize(
        xxsmall: xxsmall,
        xsmall: xsmall,
        small: small,
        medium: medium,
        large: large,
        xlarge: xlarge,
      );

  factory SizeType.of(BuildContext context) {
    final _media = MediaQuery.of(context);
    final _windowType = getWindowType(context);

    return SizeType._(
      mediaQueryData: _media,
      windowType: _windowType,
    );
  }
}
