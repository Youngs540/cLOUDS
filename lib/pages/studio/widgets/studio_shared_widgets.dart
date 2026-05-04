import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';

class StudioSharedWidgets {
  static Widget buildStatCard({
    required String label,
    required String value,
    required String percentage,
    double? width,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.sdark,
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

  static Widget buildActivityTile(String title, String subtitle) {
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
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: AppTheme.textSecondary),
        ],
      ),
    );
  }

  static Widget buildGrowthSection(BuildContext context, {bool stacked = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.sdark,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
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
          if (stacked)
            Column(
              children: [
                _buildChartArea(),
                const SizedBox(height: 32),
                _buildInsightsArea(),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _buildChartArea()),
                const SizedBox(width: 40),
                Expanded(flex: 2, child: _buildInsightsArea()),
              ],
            ),
        ],
      ),
    );
  }

  static Widget _buildChartArea() {
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

  static Widget _buildBar(String day, double heightFactor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: 150 * heightFactor,
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

  static Widget _buildInsightsArea() {
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

  static Widget _buildInsightRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.newPurple, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
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

  static Widget buildProfileEditor(BuildContext context, {bool stacked = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.sdark,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          _buildBannerPicker(),
          const SizedBox(height: 48),
          if (stacked)
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
  }

  static Widget _buildBannerPicker() {
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

  static Widget _buildBioEditor() {
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

  static Widget _buildSocialSync() {
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

  static Widget _buildSocialItem(String label, String status, bool active) {
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
}
