import 'package:flutter/material.dart';

class AppBarWidgetInside extends StatelessWidget {
  const AppBarWidgetInside({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/666.png'),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      elevation: 22,
      bottom: const PreferredSize(preferredSize: Size.fromHeight(75), child: SizedBox()),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
    );
  }
}
