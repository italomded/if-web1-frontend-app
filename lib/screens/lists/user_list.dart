import 'package:flutter/material.dart';
import 'package:projeto/api/id_action/delete_action_api.dart';
import 'package:projeto/api/id_action/update_action_api.dart';
import 'package:projeto/components/icon_button/icon_button_navigator_action.dart';
import 'package:projeto/models/model_generic.dart';
import 'package:projeto/models/model_user.dart';

import '../../api/endpoint/endpoint.dart';
import '../../api/endpoint/user_endpoint.dart';
import '../../api/token.dart';
import '../../components/item/user_item.dart';
import '../../measures/pattern_measures.dart';
import '../../components/error_screen.dart';

const String appBarTitle = "Users";

class UserList extends StatefulWidget {
  final Token token;

  const UserList({Key? key, required this.token}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UserListState();
  }
}

class _UserListState extends State<UserList> {
  late Future<List<Generic>> futureUserList;
  final Endpoint endpoint = UserEndpoint();

  @override
  void initState() {
    super.initState();
    futureUserList = endpoint.fetch(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        actions: [
          IconButtonNavigatorAction(
            token: widget.token,
            idActionApi: UpdateActionApi(endpoint: endpoint),
            iconData: Icons.extension_off,
          ),
          IconButtonNavigatorAction(
            token: widget.token,
            idActionApi: DeleteActionApi(endpoint: endpoint),
            iconData: Icons.delete,
          ),
        ],
      ),
      body: FutureBuilder<List<Generic>>(
        future: futureUserList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<User> userList = snapshot.data! as List<User>;
            return ListView.builder(
              padding: PatternMeasures.listCardPadding,
              itemBuilder: (context, index) {
                final User user = userList[index];
                return UserItem(
                  user: user,
                );
              },
              itemCount: userList.length,
            );
          } else if (snapshot.hasError) {
            return const ErrorScreen();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
