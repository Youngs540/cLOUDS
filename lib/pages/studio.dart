import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';

class StudioPage extends StatelessWidget {
  const StudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // 1. Add this to allow the page to scroll
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "cLOUDS studio",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 8),
          const Text(
            "Welcome back. Your audience grew by +12% this week.",
            style: TextStyle(color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 32),

          // 2. The Wrap handles the horizontal/vertical flow
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildStatCard(
                label: "TOTAL STREAMS",
                value: "1.2M",
                percentage: "8.4",
                context: context,
              ),
              _buildStatCard(
                label: "MONTHLY LISTENERS",
                value: "428.5K",
                percentage: "12.1",
                context: context,
              ),
              _buildStatCard(
                label: "SONG PURCHASERS",
                value: "14,202",
                percentage: "4.3",
                context: context,
              ),
            ],
          ),
          const SizedBox(height: 40),
          // charts section
          _buildGrowthSection(context),
          const SizedBox(height: 40),
          // recent
          Text(
            "Recent Activities",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 24),
          _buildActivityTile("Odo", "Single • 2.4k streams this week"),
          _buildActivityTile(
            "cLOUDS World Tour",
            "Event • 84 tickets sold today",
          ),
          const SizedBox(height: 60),
          Text(
            "Profile & About Editor", //about page editor
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 24),
          _buildProfileEditor(context),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
  //profile helper widgets a
  Widget _buildProfileEditor(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // If window is narrow, stack the bio and social sync vertically
        bool shouldStack = constraints.maxWidth < 850;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppTheme.sdark,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            children: [
              _buildBannerPicker(), // Top Banner Section
              const SizedBox(height: 48),
              if (shouldStack)
                Column(
                  children: [
                    _buildBioEditor(),
                    const SizedBox(height: 40),
                    _buildSocialSync(),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildBioEditor()),
                    const SizedBox(width: 40),
                    Expanded(flex: 2, child: _buildSocialSync()),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
  //b
  Widget _buildBannerPicker() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_a_photo_outlined, color: Colors.white, size: 32),
          SizedBox(height: 16),
          Text(
            "UPDATE COVER BANNER",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            "Recommended: 1920x600px",
            style: TextStyle(color: AppTheme.textSecondary, fontSize: 10),
          ),
        ],
      ),
    );
  }
  //c
  Widget _buildBioEditor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "ARTIST BIOGRAPHY",
          style: TextStyle(color: AppTheme.textSecondary, fontSize: 11),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.pdark,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const TextField(
            maxLines: 8,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter biography...",
            ),
            style: TextStyle(height: 1.6),
          ),
        ),
      ],
    );
  }
  //d
  Widget _buildSocialSync() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "SOCIAL SYNC",
          style: TextStyle(color: AppTheme.textSecondary, fontSize: 11),
        ),
        const SizedBox(height: 16),
        _buildSocialItem("Instagram", "CONNECTED", true),
        _buildSocialItem("Twitter (X)", "LINK", false),
        _buildSocialItem("Spotify", "CONNECTED", true),
      ],
    );
  }

  //c (end)
  Widget _buildSocialItem(String label, String status, bool active) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.pdark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.public, size: 18, color: Colors.white54),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          Text(
            status,
            style: TextStyle(
              color: active ? AppTheme.newPurple : AppTheme.textSecondary,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityTile(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.selected,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.music_note, color: AppTheme.newPurple),
          const SizedBox(width: 16),
          // Wrap text in Expanded to prevent it from pushing past the screen edge
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis, // Safety for long titles
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis, // Safety for long subtitles
                ),
              ],
            ),
          ),
          const SizedBox(width: 8), // Small buffer
          const Icon(Icons.chevron_right, color: AppTheme.textSecondary),
        ],
      ),
    );
  }

  // lib/pages/studio.dart
  Widget _buildGrowthSection(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Professional Breakpoint: If the container width is less than 700px, stack them vertically.
        bool shouldStack = constraints.maxWidth < 700;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(
            24,
          ), // Reduced slightly to save horizontal space
          decoration: BoxDecoration(
            color: AppTheme.sdark,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // Wrap title in Expanded
                    child: Text(
                      "Growth Trends",
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.more_horiz, color: AppTheme.textSecondary),
                ],
              ),
              const SizedBox(height: 32),

              // 2. The Conditional Layout
              if (shouldStack)
                // VERTICAL STACK (Narrow Screens)
                Column(
                  children: [
                    _buildChartArea(constraints.maxWidth),
                    const SizedBox(height: 32),
                    _buildInsightsArea(constraints.maxWidth),
                  ],
                )
              else
                // HORIZONTAL SPLIT (Wide Screens)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildChartArea(constraints.maxWidth),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 2,
                      child: _buildInsightsArea(constraints.maxWidth),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  // Helper for the Chart Area
  Widget _buildChartArea(double maxWidth) {
    return SizedBox(
      height: 180,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildBar("Mon", 0.4),
            const SizedBox(width: 14),
            _buildBar("Tue", 0.7),
            const SizedBox(width: 14),
            _buildBar("Wed", 0.5),
            const SizedBox(width: 14),
            _buildBar("Thu", 0.9),
            const SizedBox(width: 14),
            _buildBar("Fri", 0.6),
            const SizedBox(width: 14),
            _buildBar("Sat", 0.8),
            const SizedBox(width: 14),
            _buildBar("Sun", 1.0),
          ],
        ),
      ),
    );
  }

  // Helper for the Insights Area
  Widget _buildInsightsArea(double maxWidth) {
    return Column(
      children: [
        _buildInsightRow("Top Day", "Sunday", Icons.star_rounded),
        const Divider(color: Colors.white10, height: 24),
        _buildInsightRow("Avg. Growth", "+12.4%", Icons.trending_up_rounded),
        const Divider(color: Colors.white10, height: 24),
        _buildInsightRow("New Fans", "1,204", Icons.people_alt_rounded),
      ],
    );
  }

  // Helper for the Insight Rows on the right side
  Widget _buildInsightRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.newPurple, size: 20),
        const SizedBox(width: 12),
        // Use Expanded on the label so it can shrink if space is tight
        Expanded(
          child: Text(
            label,
            style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8), // Buffer
        // Wrap the value in Flexible to prevent it from pushing off-screen
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // lib/pages/studio.dart
  Widget _buildBar(String day, double heightFactor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // FIX: Changed from Expanded to a fixed height container
        Container(
          width: 32,
          height: 150 * heightFactor, // Use a base height multiplied by factor
          decoration: BoxDecoration(
            color: AppTheme.newPurple.withValues(alpha: heightFactor),
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppTheme.newPurple,
                AppTheme.newPurple.withValues(alpha: 0.3),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          day,
          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
        ),
      ],
    );
  }

  // stats card
  Widget _buildStatCard({
    required String label,
    required String value,
    required String percentage,
    required BuildContext context,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;

    // 3. Subtract Sidebar (250) and Page Padding (64 total)
    double availableWidth = screenWidth - 314;

    // Calculate width: If there's enough room, show 3 columns; otherwise, stack them.
    double cardWidth = availableWidth > 900
        ? (availableWidth - 40) /
              3 // 40 is the total spacing (20 * 2)
        : availableWidth;

    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.sdark, // #212121
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.arrow_outward,
                color: AppTheme.newPurple,
                size: 14,
              ),
              const SizedBox(width: 4),
              Text(
                "$percentage%",
                style: const TextStyle(
                  color: AppTheme.newPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
