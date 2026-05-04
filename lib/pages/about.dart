import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace Placeholder with a scrollable view to prevent height conflicts
    return const SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text("About cLOUDS"),
        ),
      ),
    );
  }
}