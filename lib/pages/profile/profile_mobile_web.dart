import 'package:flutter/material.dart';
import 'package:clouds/pages/profile/profile_smartphone.dart';

class ProfileMobileWeb extends StatelessWidget {
  const ProfileMobileWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 450),
        child: ProfileSmartphone(),
      ),
    );
  }
}
