import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ResponsiveButton extends StatelessWidget {
  final ResponsiveScreen screen;
  const ResponsiveButton({Key? key, required this.screen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return screen.isDesktop

        ///`Desktop Widget`
        ? Container(
            color: Colors.red,
          )

        ///`Tablet Widget`
        : screen.isTablet
            ? Container(
                color: Colors.blue,
              )

            ///`Mobile Widget`
            : Container(
                color: Colors.amber,
              );
  }
}
