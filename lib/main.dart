import 'package:clouds/core/providers/auth_provider.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:clouds/main_layout.dart';
import 'package:clouds/core/providers/music_player_provider.dart';
import 'package:clouds/pages/auth/auth_view.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
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
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // If Firebase has user data, the user is logged in
          if (snapshot.hasData) {
            return const MainLayout(); //
          }
          // Otherwise, show the AuthView (Login/Sign Up)
          return const AuthView(); //
        },
      ),
    );
  }
}
