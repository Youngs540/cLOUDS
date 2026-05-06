import 'package:flutter/material.dart';
import 'package:clouds/core/utils/layout_utils.dart';
import 'home_desktop.dart';
import 'home_tablet.dart';
import 'home_mobile_web.dart';
import 'home_smartphone.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWrapper(
      desktop: _buildDesktop,
      tablet: _buildTablet,
      mobileWeb: _buildMobileWeb,
      smartphoneNative: _buildSmartphoneNative,
    );
  }

  static Widget _buildDesktop(BuildContext context) => const HomeDesktop();
  static Widget _buildTablet(BuildContext context) => const HomeTablet();
  static Widget _buildMobileWeb(BuildContext context) => const HomeMobileWeb();
  static Widget _buildSmartphoneNative(BuildContext context) => const HomeSmartphone();
}
