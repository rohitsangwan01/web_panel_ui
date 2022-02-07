import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DrawerTile {
  String title;
  IconData icon;
  var onTap;
  DrawerTile({required this.title, required this.icon, onTap});
}
