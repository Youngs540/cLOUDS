import 'package:flutter/material.dart';
import 'package:clouds/shared/searchbar.dart';
import 'package:clouds/shared/new_release.dart';
import 'widgets/home_shared_widgets.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopSearchBar(),
            const SizedBox(height: 40),
            Text("New Release", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
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
            Row(
              children: [
                Expanded(flex: 3, child: HomeSharedWidgets.buildLatestReleaseHero(context)),
                const SizedBox(width: 20),
                Expanded(flex: 2, child: HomeSharedWidgets.buildTourInfoPanel(context)),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: HomeSharedWidgets.buildFavoriteTracksColumn(context)),
                const SizedBox(width: 40),
                Expanded(child: HomeSharedWidgets.buildLastPlayedColumn(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
