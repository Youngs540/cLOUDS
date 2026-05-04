import 'package:flutter/material.dart';
import 'package:clouds/shared/searchbar.dart';
import 'package:clouds/shared/new_release.dart';
import 'package:clouds/core/themes/themes.dart';
import 'widgets/home_shared_widgets.dart';

class HomeSmartphone extends StatelessWidget {
  const HomeSmartphone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 120.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('cLOUDS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppTheme.pdark, AppTheme.sdark],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
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
                      const SizedBox(height: 80), // Padding for DraggableScrollableSheet
                    ],
                  ),
                ),
              ),
            ],
          ),
          // DraggableScrollableSheet for "Now Playing" bar
          DraggableScrollableSheet(
            initialChildSize: 0.12,
            minChildSize: 0.12,
            maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppTheme.sdark,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      // Handle
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      // Mini Player (Visible when collapsed)
                      const ListTile(
                        leading: Icon(Icons.music_note, color: AppTheme.newPurple),
                        title: Text("Now Playing: Odo", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        subtitle: Text("Kojo Rain", style: TextStyle(color: AppTheme.textSecondary)),
                        trailing: Icon(Icons.play_arrow, color: Colors.white),
                      ),
                      // Expanded Player content would go here
                      const SizedBox(height: 400, child: Center(child: Text("Expanded Player View", style: TextStyle(color: Colors.white)))),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
