import 'package:flutter/material.dart';
import 'package:clouds/core/utils/layout_utils.dart';

import 'studio_desktop.dart';
import 'studio_tablet.dart';
import 'studio_mobile_web.dart';
import 'studio_smartphone.dart';

class StudioPage extends StatelessWidget {
  const StudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWrapper(
      desktop: _buildDesktop,
      tablet: _buildTablet,
      mobileWeb: _buildMobileWeb,
      smartphoneNative: _buildSmartphoneNative,
    );
  }

  static Widget _buildDesktop(BuildContext context) => const StudioDesktop();
  static Widget _buildTablet(BuildContext context) => const StudioTablet();
  static Widget _buildMobileWeb(BuildContext context) => const StudioMobileWeb();
  static Widget _buildSmartphoneNative(BuildContext context) => const StudioSmartphone();
}
