import 'package:clouds/shared/searchbar.dart';
import 'package:clouds/shared/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:clouds/shared/new_release.dart';
import 'package:clouds/core/themes/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopSearchBar(),
                    SizedBox(height: 40),
                    Text(
                      "New Release",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // LEFT SIDE: LATEST RELEASE HERO
                        Expanded(
                          flex: 2, // Takes up more space
                          child: _buildLatestReleaseHero(),
                        ),
                        const SizedBox(width: 20),
                        // RIGHT SIDE: TOUR & MINI PLAYER
                        Expanded(
                          flex: 1, // Narrower side panel
                          child: _buildTourInfoPanel(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // FAVORITE TRACKS
                        Expanded(
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
                        const SizedBox(width: 40),
                        // LAST TRACKS PLAYED
                        Expanded(
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
            ),
          ),
        ],
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
        image: AssetImage('assets/images/headphones.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          colors: [Colors.black.withOpacity(0.8), Colors.transparent],
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
          Row(
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
                  shape: StadiumBorder(),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white54),
                  shape: StadiumBorder(),
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
Widget _buildTourInfoPanel() {
  return Container(
    height: 280,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: AppTheme.sdark, // #212121
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
        // Currently Playing Card
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.selected, // #2A2A2A
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Prism Echoes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Atmospheric Mix",
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                ],
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
