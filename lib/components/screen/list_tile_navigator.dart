import 'package:flutter/material.dart';

import '../../api/token.dart';

class ListTileNavigator extends StatelessWidget {
  final Widget route;
  final Token token;
  final IconData icon;
  final String title;

  final Function refreshScreen;

  const ListTileNavigator({
    Key? key,
    required this.route,
    required this.token,
    required this.icon,
    required this.title,
    required this.refreshScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return route;
            },
            settings: RouteSettings(arguments: token),
          ),
        ).then((value) => refreshScreen());
      },
      leading: Icon(icon),
    );
  }
}
