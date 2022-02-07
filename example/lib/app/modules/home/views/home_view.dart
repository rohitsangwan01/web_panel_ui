// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_panel_ui/web_panel_ui.dart';
import '../controllers/home_controller.dart';

///Responsive Dashboard Example
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveDashboard(
      drawerTiles: [DrawerTile(title: 'Demo', icon: Icons.dangerous)],
    );
  }
}

///Responsive Button Example
class HomeView2 extends GetResponsiveView<HomeController> {
  @override
  Widget builder() {
    return Scaffold(body: ResponsiveButton(screen: screen));
  }
}
