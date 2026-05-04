import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'widgets/studio_shared_widgets.dart';

class StudioTablet extends StatelessWidget {
  const StudioTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "cLOUDS studio",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 8),
          const Text(
            "Welcome back. Your audience grew by +12% this week.",
            style: TextStyle(color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 32),
          // Wrap stat cards for tablet
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              StudioSharedWidgets.buildStatCard(
                label: "TOTAL STREAMS",
                value: "1.2M",
                percentage: "8.4",
                width: 250, // Fixed width for wrap
              ),
              StudioSharedWidgets.buildStatCard(
                label: "MONTHLY LISTENERS",
                value: "428.5K",
                percentage: "12.1",
                width: 250,
              ),
              StudioSharedWidgets.buildStatCard(
                label: "SONG PURCHASERS",
                value: "14,202",
                percentage: "4.3",
                width: 250,
              ),
            ],
          ),
          const SizedBox(height: 40),
          StudioSharedWidgets.buildGrowthSection(context, stacked: true), // stacked for tablet
          const SizedBox(height: 40),
          Text(
            "Recent Activities",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 24),
          StudioSharedWidgets.buildActivityTile("Odo", "Single • 2.4k streams this week"),
          StudioSharedWidgets.buildActivityTile("cLOUDS World Tour", "Event • 84 tickets sold today"),
          const SizedBox(height: 60),
          Text(
            "Profile & About Editor",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 24),
          StudioSharedWidgets.buildProfileEditor(context, stacked: true), // stacked for tablet
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
