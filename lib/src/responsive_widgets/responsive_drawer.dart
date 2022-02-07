// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../web_panel_ui.dart';

class ResponsiveDrawer extends StatelessWidget {
  final ResponsiveScreen screen;
  Color? drawerBackgroudnColor;
  String? title;
  Widget? projectIcon;
  List<DrawerTile> drawerTiles;

  ResponsiveDrawer(
      {Key? key,
      required this.drawerTiles,
      required this.screen,
      this.title = 'Dashboard',
      this.projectIcon,
      this.drawerBackgroudnColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: drawerBackgroudnColor,
      width: screen.isPhone ? Get.width / 1.2 : null,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: projectIcon ??
                Icon(
                  Icons.dashboard,
                  size: Get.width / 20,
                ),
          ),
          const Divider(),
          Material(
            color: Colors.transparent,
            child: Column(
                children: drawerTiles
                    .map((e) =>
                        ResponsiveDrawerTile(screen: screen, drawerTile: e))
                    .toList()),
          )

          ///Here Display All Items
        ],
      ),
    );
  }
}

class ResponsiveDrawerTile extends StatelessWidget {
  final ResponsiveScreen screen;
  final DrawerTile drawerTile;
  const ResponsiveDrawerTile(
      {Key? key, required this.screen, required this.drawerTile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

        /// Desktop
        Row(
      children: [
        Icon(drawerTile.icon),
        Text(
          drawerTile.title,
          style: const TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
