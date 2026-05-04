import 'package:flutter/material.dart';
import 'package:clouds/core/utils/layout_utils.dart';

import 'music_desktop.dart';
import 'music_tablet.dart';
import 'music_mobile_web.dart';
import 'music_smartphone.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWrapper(
      desktop: _buildDesktop,
      tablet: _buildTablet,
      mobileWeb: _buildMobileWeb,
      smartphoneNative: _buildSmartphoneNative,
    );
  }

  static Widget _buildDesktop(BuildContext context) => const MusicDesktop();
  static Widget _buildTablet(BuildContext context) => const MusicTablet();
  static Widget _buildMobileWeb(BuildContext context) => const MusicMobileWeb();
  static Widget _buildSmartphoneNative(BuildContext context) => const MusicSmartphone();
}
