import 'package:clouds/core/themes/themes.dart';
import 'package:clouds/main_layout.dart';
import 'package:clouds/core/providers/music_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MusicPlayerProvider()),
      ],
      child: const cLOUDS(),
    ),
  );
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
      home: const MainLayout(),
    );
  }
}
