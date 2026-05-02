import 'package:clouds/shared/searchbar.dart';
import 'package:clouds/shared/sidebar.dart';
import 'package:flutter/material.dart';
// import 'package:clouds/core/themes/themes.dart';

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
                    // TODO: Add your Horizontal Music Cards here
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
