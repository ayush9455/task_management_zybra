import 'package:flutter/material.dart';
import 'package:task_management_zybra/utils/utils.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, this.header, this.body, this.headerHeight});
  final Widget? body;
  final Widget? header;
  final double? headerHeight;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Column(
      children: [
        Container(
          height: headerHeight,
          width: deviceSize.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueGrey, // Right color
                Colors.grey.shade700, // Left color
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Center(child: header),
        ),
        Expanded(
          child: Container(
            width: deviceSize.width,
            color: colors.surface,
            child: body,
          ),
        ),
      ],
    );
  }
}
