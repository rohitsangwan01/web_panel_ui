// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../utils/themeData.dart';

class ResponsiveHeader extends StatelessWidget {
  final ResponsiveScreen screen;
  String title;
  Widget? projectIcon;
  bool? mobileCenterIcon;
  ThemeData? themeData;
  GlobalKey<ScaffoldState> scaffoldKey;
  ResponsiveHeader({
    Key? key,
    required this.screen,
    required this.title,
    required this.scaffoldKey,
    this.themeData,
    this.mobileCenterIcon = true,
    this.projectIcon,
  }) : super(key: key);

  ThemeData get theme => themeData ?? globalThemData;

  @override
  Widget build(BuildContext context) {
    return screen.isDesktop || screen.isTablet

        ///`Desktop | Tablet Widget`
        ? Container(color: Colors.white, height: AppBar().preferredSize.height)

        ///`Mobile Widget`
        : Container(
            color: Colors.white,
            height: AppBar().preferredSize.height,
            child: Stack(
              children: [
                ///Button To `Open Drawer`
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (scaffoldKey.currentState!.isDrawerOpen) {
                            scaffoldKey.currentState!.openEndDrawer();
                          } else {
                            scaffoldKey.currentState!.openDrawer();
                          }
                        },
                        icon: const Icon(Icons.menu)),
                  ],
                ),

                ///Show App Title
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          );
  }
}
