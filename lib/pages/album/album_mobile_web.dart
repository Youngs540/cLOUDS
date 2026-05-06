import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'widgets/album_shared_widgets.dart';

class AlbumMobileWeb extends StatelessWidget {
  const AlbumMobileWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pdark,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Odo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/fam.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppTheme.pdark,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Kojo Rain",
                    style: TextStyle(
                      color: AppTheme.newPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "HighLife • 2024 • 6 songs",
                    style: TextStyle(color: AppTheme.textSecondary),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shuffle, color: Colors.black),
                      label: const Text(
                        "SHUFFLE PLAY",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.newPurple,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          AlbumSharedWidgets.buildSliverTrackList(context, hideTime: true, hideArtist: false),
        ],
      ),
    );
  }
}
