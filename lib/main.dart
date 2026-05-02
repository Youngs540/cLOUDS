import 'package:clouds/core/themes/themes.dart';
import 'package:clouds/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const cLOUDS());
}

// ignore: camel_case_types
class cLOUDS extends StatelessWidget {
  const cLOUDS({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

