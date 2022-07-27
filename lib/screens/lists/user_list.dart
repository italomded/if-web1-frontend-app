import 'package:flutter/material.dart';
import 'package:projeto/components/screen/screen_list_base.dart';
import 'package:projeto/models/model_generic.dart';
import 'package:projeto/screens/create/create_profile.dart';
import 'package:projeto/screens/create/create_user.dart';

import '../../api/endpoint/endpoint.dart';
import '../../api/endpoint/user_endpoint.dart';
import '../../api/token.dart';
import '../../components/item/user_item.dart';

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
  late Future<List<Generic>> futureGenericList;
  final Endpoint endpoint = UserEndpoint();

  void refreshScreen() {
    setState(() {
      futureGenericList = endpoint.fetch(widget.token);
    });
  }

  @override
  void initState() {
    super.initState();
    futureGenericList = endpoint.fetch(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenListBase(
      refreshScreen: refreshScreen,
      appBarTitle: appBarTitle,
      endpoint: endpoint,
      futureGenericList: futureGenericList,
      convertToItemFunction: (Generic generic) {
        return UserItem(generic: generic);
      },
      token: widget.token,
      createResourceRoute: const CreateUser(),
    );
  }
}
