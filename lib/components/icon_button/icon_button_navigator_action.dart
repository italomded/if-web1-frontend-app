import 'package:flutter/material.dart';
import 'package:projeto/api/id_action/id_action_api.dart';
import 'package:projeto/screens/edit/id_action.dart';

import '../../api/token.dart';

class IconButtonNavigatorAction extends StatelessWidget {
  final Token token;
  final IdActionApi idActionApi;
  final IconData iconData;

  const IconButtonNavigatorAction({
    Key? key,
    required this.token,
    required this.idActionApi,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return IdAction(
                actionApi: idActionApi,
              );
            },
            settings: RouteSettings(arguments: token),
          ),
        );
      },
      icon: Icon(iconData),
    );
  }
}
