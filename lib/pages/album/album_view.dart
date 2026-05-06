import 'package:flutter/material.dart';
import 'package:clouds/core/utils/layout_utils.dart';

import 'album_desktop.dart';
import 'album_tablet.dart';
import 'album_mobile_web.dart';
import 'album_smartphone.dart';

class AlbumView extends StatelessWidget {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWrapper(
      desktop: _buildDesktop,
      tablet: _buildTablet,
      mobileWeb: _buildMobileWeb,
      smartphoneNative: _buildSmartphoneNative,
    );
  }

  static Widget _buildDesktop(BuildContext context) => const AlbumDesktop();
  static Widget _buildTablet(BuildContext context) => const AlbumTablet();
  static Widget _buildMobileWeb(BuildContext context) => const AlbumMobileWeb();
  static Widget _buildSmartphoneNative(BuildContext context) => const AlbumSmartphone();
}
