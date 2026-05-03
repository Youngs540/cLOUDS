import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:clouds/shared/searchbar.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TopSearchBar(),
                        const SizedBox(height: 32),
                        _buildFeaturedHero(),
                        const SizedBox(height: 40),
                        _buildDiscographyHeader(),
                        const SizedBox(height: 24),
                        _buildTrackTable(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Large Hero with "Buy Now" button
  Widget _buildFeaturedHero() {
    return Container(
      height: 300,
      width: double.infinity, // Ensure it fills available width
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: AssetImage('assets/images/fam.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "NEW RELEASE",
              style: TextStyle(fontSize: 10, color: AppTheme.newPurple),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Odo",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          // REMOVED fixed SizedBox(width: 450)
          Flexible(
            child: Text(
              "An ethereal journey through soundscapes of the late hours...",
              style: TextStyle(color: AppTheme.textSecondary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 24),
          // Changed Row to Wrap for button responsiveness
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow, color: Colors.black),
                label: const Text(
                  "Buy Now",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.newPurple,
                  shape: const StadiumBorder(),
                ),
              ),
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Tab-style header
  Widget _buildDiscographyHeader() {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Discography",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Manage and explore your high-fidelity music collection.",
              style: TextStyle(color: AppTheme.textSecondary),
            ),
          ],
        ),
        // Wrap the tabs in a SingleChildScrollView for small screens
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _tabLabel("Popular", false),
              _tabLabel("All Tracks", true),
              _tabLabel("Albums", false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tabLabel(String text, bool active) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : AppTheme.textSecondary,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (active)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 20,
              color: Colors.white,
            ),
        ],
      ),
    );
  }

  // The Track List Table
  Widget _buildTrackTable() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          // Added SingleChildScrollView for horizontal safety
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              // Use a fixed minimum width to prevent vertical text squashing
              children: [
                const SizedBox(
                  width: 30,
                  child: Text(
                    "#",
                    style: TextStyle(color: AppTheme.textSecondary),
                  ),
                ),
                const SizedBox(
                  // Changed from Expanded to SizedBox with minWidth
                  width: 150,
                  child: Text(
                    "TRACK TITLE",
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 100,
                  child: Text(
                    "ARTIST",
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 60,
                  child: Icon(
                    Icons.access_time,
                    size: 16,
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(
                  width: 100,
                  child: Text(
                    "PRICE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.white10),
        _trackRow("01", "Rum it up", "Kojo Rain", "3:45", "\$1.29"),
        _trackRow("02", "Trending", "Kojo Rain", "4:12", "\$1.29"),
        _trackRow("03", "Gye", "Kojo Rain", "3:22", "\$1.29"),
      ],
    );
  }

  Widget _trackRow(
    String id,
    String title,
    String artist,
    String time,
    String price,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(id, style: TextStyle(color: AppTheme.textSecondary)),
          ),
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis, // Added ellipsis
            ),
          ),
          // Hide Artist or Time on very small screens if necessary,
          // or just use Expanded with ellipsis for all.
          Expanded(
            flex: 2,
            child: Text(
              artist,
              style: TextStyle(color: AppTheme.textSecondary),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(time, style: TextStyle(color: AppTheme.textSecondary)),
          ),
          // Use a more flexible container for the price button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.selected,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                price,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
