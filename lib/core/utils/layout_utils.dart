import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum LayoutTier {
  desktop,
  tablet,
  mobileWeb,
  smartphoneNative,
}

class LayoutUtils {
  static LayoutTier getTier(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Mobile Web: Width < 600px AND kIsWeb == true. (A "shrunk" browser view).
    if (kIsWeb && width < 600) {
      return LayoutTier.mobileWeb;
    }

    // Smartphone Native: Device is Android/iOS (Native)
    bool isNativeMobile = false;
    if (!kIsWeb) {
      isNativeMobile = Platform.isAndroid || Platform.isIOS;
    }

    if (isNativeMobile || width < 600) {
      return kIsWeb ? LayoutTier.mobileWeb : LayoutTier.smartphoneNative;
    }

    // Tablet: Width between 600px and 1100px.
    if (width >= 600 && width <= 1100) {
      return LayoutTier.tablet;
    }

    // Desktop: Width > 1100px.
    return LayoutTier.desktop;
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
