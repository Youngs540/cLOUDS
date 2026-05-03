import 'package:clouds/shared/searchbar.dart';

import 'package:flutter/material.dart';
import 'package:clouds/shared/new_release.dart';
import 'package:clouds/core/themes/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopSearchBar(),
            SizedBox(height: 40),
            Text("New Release", style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 20),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  NewReleaseCard(
                    title: 'odo',
                    artisteName: 'Kojo Rain',
                    genre: 'HighLife',
                  ),
                  NewReleaseCard(
                    title: 'Lost Sheep',
                    artisteName: 'Kojo Rain',
                    genre: 'Rap',
                  ),
                  NewReleaseCard(
                    title: 'Im not a Leader',
                    artisteName: 'Kojo Rain',
                    genre: 'HighLife',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // lib/pages/home.dart
            // lib/pages/home.dart
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                // Hero Banner
                SizedBox(
                  width: MediaQuery.of(context).size.width > 1100
                      ? (MediaQuery.of(context).size.width - 314 - 20) *
                            0.64 // Reduced slightly for safety
                      : double.infinity,
                  child: _buildLatestReleaseHero(),
                ),
                // Tour Panel
                SizedBox(
                  width: MediaQuery.of(context).size.width > 1100
                      ? (MediaQuery.of(context).size.width - 314 - 20) *
                            0.32 // Balanced with Hero
                      : double.infinity,
                  child: _buildTourInfoPanel(),
                ),
              ],
            ),
            const SizedBox(height: 40),
            // lib/pages/home.dart
            Wrap(
              spacing: 40,
              runSpacing: 40,
              children: [
                // Favorite Tracks
                SizedBox(
                  width: MediaQuery.of(context).size.width > 900
                      ? (MediaQuery.of(context).size.width - 350) / 2
                      : double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Favorite Tracks",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 24),
                      _buildTrackTile(
                        number: "01",
                        title: "Odo",
                        artist: "Kojo Rain",
                        duration: "4:32",
                      ),
                      _buildTrackTile(
                        number: "02",
                        title: "Lost Sheep",
                        artist: "Kojo Rain",
                        duration: "3:58",
                      ),
                      _buildTrackTile(
                        number: "03",
                        title: "Im not a Leader",
                        artist: "Kojo Rain",
                        duration: "5:14",
                      ),
                    ],
                  ),
                ),
                // Last Tracks Played
                SizedBox(
                  width: MediaQuery.of(context).size.width > 900
                      ? (MediaQuery.of(context).size.width - 350) / 2
                      : double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Last Tracks Played",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 24),
                      _buildTrackTile(
                        number: "01",
                        title: "Odo",
                        artist: "Kojo Rain",
                        duration: "4:32",
                      ),
                      _buildTrackTile(
                        number: "02",
                        title: "Lost Sheep",
                        artist: "Kojo Rain",
                        duration: "3:58",
                      ),
                      _buildTrackTile(
                        number: "03",
                        title: "Im not a Leader",
                        artist: "Kojo Rain",
                        duration: "5:14",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// latest release banner
Widget _buildLatestReleaseHero() {
  return Container(
    height: 280,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      image: const DecorationImage(
        image: AssetImage('assets/images/fam.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          colors: [Colors.black.withValues(alpha: 0.8), Colors.transparent],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "LATEST RELEASE",
            style: TextStyle(
              color: AppTheme.textSecondary,
              letterSpacing: 1.5,
              fontSize: 12,
            ),
          ),
          const Text(
            "Odo",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          // Inside _buildLatestReleaseHero Column
          Wrap(
            // Change Row to Wrap here
            spacing: 12,
            runSpacing:
                12, // Allows buttons to stack vertically on small screens
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow, color: Colors.black),
                label: const Text(
                  "LISTEN NOW",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.newPurple,
                  shape: const StadiumBorder(),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white54),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  "SAVE TO PLAYLIST",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// tour section
// lib/pages/home.dart
Widget _buildTourInfoPanel() {
  return Container(
    height: 280,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: AppTheme.sdark,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Next Tour",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        const Text(
          "Nov 24, 2024",
          style: TextStyle(color: AppTheme.textSecondary),
        ),
        const Spacer(),
        // RESPONSIVE Currently Playing Card
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.selected,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            // Using Row but with Expanded text to prevent push-out
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                // Expanded ensures text wraps instead of overflowing
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Prism Echoes",
                      overflow:
                          TextOverflow.ellipsis, // Adds "..." if still too long
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Atmospheric Mix",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "GET EARLY ACCESS",
              style: TextStyle(
                color: AppTheme.newPurple,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// tracks section
Widget _buildTrackTile({
  required String number,
  required String title,
  required String artist,
  required String duration,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Row(
      children: [
        Text(
          number,
          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
        ),
        const SizedBox(width: 16),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppTheme.selected, // #2A2A2A
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.music_note,
            color: AppTheme.textSecondary,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "$artist • $duration",
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.favorite_border,
          color: AppTheme.textSecondary,
          size: 20,
        ),
      ],
    ),
  );
}
