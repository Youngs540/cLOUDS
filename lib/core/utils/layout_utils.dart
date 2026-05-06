import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum LayoutTier { desktop, tablet, mobileWeb, smartphoneNative }

// For retrieving the device type
class LayoutUtils {
  static LayoutTier getTier(BuildContext context) {
    // 1. Native Mobile Device Check
    // If the actual platform is iOS or Android (even if running in a web browser on that device),
    // return the smartphoneNative layout.
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      return LayoutTier.smartphoneNative;
    }

    // 2. Desktop/Web Width Checks
    // For Desktop OSs (Windows, macOS, Linux, Fuchsia), rely on the window width.
    final width = MediaQuery.of(context).size.width;

    return switch (width) {
      < 600 => LayoutTier.mobileWeb,
      < 1100 => LayoutTier.tablet,
      _ => LayoutTier.desktop,
    };
  }
}

class ResponsiveWrapper extends StatelessWidget {
  final WidgetBuilder? desktop;
  final WidgetBuilder? tablet;
  final WidgetBuilder? mobileWeb;
  final WidgetBuilder? smartphoneNative;

  const ResponsiveWrapper({
    super.key,
    this.desktop,
    this.tablet,
    this.mobileWeb,
    this.smartphoneNative,
  });

  @override
  Widget build(BuildContext context) {
    final tier = LayoutUtils.getTier(context);

    switch (tier) {
      case LayoutTier.desktop:
        if (desktop != null) return desktop!(context);
        break;
      case LayoutTier.tablet:
        if (tablet != null) return tablet!(context);
        break;
      case LayoutTier.mobileWeb:
        if (mobileWeb != null) return mobileWeb!(context);
        break;
      case LayoutTier.smartphoneNative:
        if (smartphoneNative != null) return smartphoneNative!(context);
        break;
    }

    // Fallbacks
    if (desktop != null) return desktop!(context);
    if (tablet != null) return tablet!(context);
    if (mobileWeb != null) return mobileWeb!(context);
    if (smartphoneNative != null) return smartphoneNative!(context);

    return const SizedBox.shrink();
  }
}
