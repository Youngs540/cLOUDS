import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:clouds/core/providers/music_player_provider.dart';

class AlbumSharedWidgets {
  static Widget buildTrackRow(
    BuildContext context,
    String id,
    String title,
    String artist,
    String time,
    String price, {
    bool hideTime = false,
    bool hideArtist = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.read<MusicPlayerProvider>().playTrack(
            track: title,
            artist: artist,
            duration: time,
          );
        },
        hoverColor: AppTheme.selected, // Subtle background highlight
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              SizedBox(
                width: 30,
                child: Text(id, style: const TextStyle(color: AppTheme.textSecondary)),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (!hideArtist)
                Expanded(
                  flex: 2,
                  child: Text(
                    artist,
                    style: const TextStyle(color: AppTheme.textSecondary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              if (!hideTime)
                SizedBox(
                  width: 60,
                  child: Text(time, style: const TextStyle(color: AppTheme.textSecondary)),
                ),
              SizedBox(
                width: 80,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.sdark,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.white10),
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
        ),
      ),
    );
  }

  static Widget buildTrackTable(BuildContext context, {bool hideTime = false, bool hideArtist = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
                child: Text(
                  "#",
                  style: TextStyle(color: AppTheme.textSecondary),
                ),
              ),
              const Expanded(
                flex: 3,
                child: Text(
                  "TRACK TITLE",
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ),
              if (!hideArtist)
                const Expanded(
                  flex: 2,
                  child: Text(
                    "ARTIST",
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
              if (!hideTime)
                const SizedBox(
                  width: 60,
                  child: Icon(
                    Icons.access_time,
                    size: 16,
                    color: AppTheme.textSecondary,
                  ),
                ),
              const SizedBox(
                width: 80,
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
        const Divider(color: Colors.white10),
        buildTrackRow(context, "01", "Rum it up", "Kojo Rain", "3:45", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
        buildTrackRow(context, "02", "Trending", "Kojo Rain", "4:12", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
        buildTrackRow(context, "03", "Gye", "Kojo Rain", "3:22", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
        buildTrackRow(context, "04", "Lost Sheep", "Kojo Rain", "4:05", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
        buildTrackRow(context, "05", "Im not a Leader", "Kojo Rain", "5:14", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
        buildTrackRow(context, "06", "Odo", "Kojo Rain", "4:32", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
      ],
    );
  }

  static Widget buildSliverTrackList(BuildContext context, {bool hideTime = false, bool hideArtist = false}) {
    // For SliverList in mobile
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: buildTrackRow(context, "01", "Rum it up", "Kojo Rain", "3:45", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: buildTrackRow(context, "02", "Trending", "Kojo Rain", "4:12", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: buildTrackRow(context, "03", "Gye", "Kojo Rain", "3:22", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: buildTrackRow(context, "04", "Lost Sheep", "Kojo Rain", "4:05", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: buildTrackRow(context, "05", "Im not a Leader", "Kojo Rain", "5:14", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: buildTrackRow(context, "06", "Odo", "Kojo Rain", "4:32", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
          ),
          const SizedBox(height: 100), // padding for bottom bars
        ],
      ),
    );
  }
}
