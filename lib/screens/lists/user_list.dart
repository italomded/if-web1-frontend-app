import 'package:flutter/material.dart';
import 'package:projeto/api/fetch_all_api.dart';
import 'package:projeto/models/model_generic.dart';
import 'package:projeto/models/model_user.dart';

import '../../api/endpoint/user_endpoint.dart';
import '../../api/token.dart';
import '../../components/item/user_item.dart';
import '../../measures/pattern_measures.dart';

const String appBarTitle = "Users";

class UserList extends StatefulWidget {
  final Token token;

  const UserList({Key? key, required this.token}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserListState();
  }
}

class UserListState extends State<UserList> {
  late Future<List<Generic>> futureUserList;

  @override
  void initState() {
    super.initState();
    futureUserList = FetchAllApi(endpoint: UserEndpoint()).fetch(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
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
            return Text("${snapshot.error}");
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
