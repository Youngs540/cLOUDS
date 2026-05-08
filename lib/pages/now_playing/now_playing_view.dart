import 'package:flutter/material.dart';
import 'package:clouds/core/utils/layout_utils.dart';

import 'now_playing_desktop.dart';
import 'now_playing_smartphone.dart';
import 'now_playing_tablet.dart';

class NowPlayingView extends StatelessWidget {
  final ScrollController? scrollController;
  final VoidCallback? onCollapse;

  const NowPlayingView({super.key, this.scrollController, this.onCollapse});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      desktop: (context) => const NowPlayingDesktop(),
      tablet: (context) => const NowPlayingTablet(),
      mobileWeb: (context) => NowPlayingSmartphone(
        scrollController: scrollController,
        onCollapse: onCollapse,
      ),
      smartphoneNative: (context) => NowPlayingSmartphone(
        scrollController: scrollController,
        onCollapse: onCollapse,
      ),
    );
  }
}
