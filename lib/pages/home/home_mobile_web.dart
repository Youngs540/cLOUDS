import 'package:flutter/material.dart';
import 'package:clouds/shared/searchbar.dart';
import 'package:clouds/shared/new_release.dart';
import 'widgets/home_shared_widgets.dart';

class HomeMobileWeb extends StatelessWidget {
  const HomeMobileWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopSearchBar(),
            const SizedBox(height: 24),
            Text("New Release", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  NewReleaseCard(title: 'odo', artisteName: 'Kojo Rain', genre: 'HighLife'),
                  NewReleaseCard(title: 'Lost Sheep', artisteName: 'Kojo Rain', genre: 'Rap'),
                  NewReleaseCard(title: 'Im not a Leader', artisteName: 'Kojo Rain', genre: 'HipLife'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            HomeSharedWidgets.buildLatestReleaseHero(context),
            const SizedBox(height: 20),
            HomeSharedWidgets.buildTourInfoPanel(context),
            const SizedBox(height: 32),
            HomeSharedWidgets.buildFavoriteTracksColumn(context),
            const SizedBox(height: 32),
            HomeSharedWidgets.buildLastPlayedColumn(context),
          ],
        ),
      ),
    );
  }
}
