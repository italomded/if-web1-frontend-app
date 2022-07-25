import 'package:flutter/material.dart';

import '../../api/token.dart';

class IconButtonNavigator extends StatelessWidget {
  final Widget route;
  final Token token;

  const IconButtonNavigator(
      {Key? key, required this.route, required this.token})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return route;
            },
            settings: RouteSettings(arguments: token),
          ),
        );
      },
      icon: const Icon(Icons.library_add),
    );
  }
}
