// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:web_panel_ui/src/models/drawer_tile.dart';
import 'package:web_panel_ui/src/responsive_widgets/responsive_drawer.dart';

import '../responsive_widgets/responsive_header.dart';

class ResponsiveDashboard extends GetResponsiveView {
  Color? drawerBackgroundColor;
  Color? pageBackgroundColor;
  String? title;
  Widget? projectIcon;
  ThemeData? themeData;
  List<DrawerTile> drawerTiles;
  ResponsiveDashboard({
    Key? key,
    required this.drawerTiles,
    this.drawerBackgroundColor = Colors.blueAccent,
    this.pageBackgroundColor,
    this.title = 'Dashboard',
    this.themeData,
    this.projectIcon,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget builder() {
    ///here We will Divide it into Two Parts
    return Row(
      children: [
        ///Show Drawer on `Desktop and Tablet`
        screen.isDesktop || screen.isTablet
            ? Expanded(
                flex: 2,
                child: ResponsiveDrawer(
                  screen: screen,
                  drawerBackgroudnColor: drawerBackgroundColor,
                  drawerTiles: drawerTiles,
                ),
              )
            : const SizedBox(),
        Expanded(
          flex: 8,
          child: Scaffold(
              backgroundColor: pageBackgroundColor ?? Colors.grey.shade100,
              drawer: ResponsiveDrawer(
                screen: screen,
                drawerBackgroudnColor: drawerBackgroundColor,
                drawerTiles: drawerTiles,
              ),
              key: _key,
              body: SafeArea(
                child: Column(
                  children: [
                    ResponsiveHeader(
                      scaffoldKey: _key,
                      screen: screen,
                      title: title!,
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
