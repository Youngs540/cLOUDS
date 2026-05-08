import 'package:flutter/material.dart';
import 'package:clouds/core/utils/layout_utils.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:clouds/pages/profile/profile_smartphone.dart';
import 'package:clouds/pages/profile/profile_mobile_web.dart';
import 'package:clouds/pages/profile/profile_tablet.dart';
import 'package:clouds/pages/profile/profile_desktop.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pdark,
      body: Stack(
        children: [
          ResponsiveWrapper(
            smartphoneNative: (context) => ProfileSmartphone(),
            mobileWeb: (context) => ProfileMobileWeb(),
            tablet: (context) => ProfileTablet(),
            desktop: (context) => ProfileDesktop(),
          ),
          if (Navigator.canPop(context))
            Positioned(
              top: 16,
              left: 16,
              child: SafeArea(
                child: CircleAvatar(
                  backgroundColor: Colors.black.withValues(alpha: 0.3),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
