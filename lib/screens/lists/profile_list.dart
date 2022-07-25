import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/endpoint.dart';
import 'package:projeto/api/id_action/delete_action_api.dart';
import 'package:projeto/api/id_action/update_action_api.dart';
import 'package:projeto/components/icon_button/icon_button_navigator.dart';
import 'package:projeto/components/icon_button/icon_button_navigator_action.dart';
import 'package:projeto/models/model_generic.dart';
import 'package:projeto/screens/create/create_profile.dart';
import 'package:projeto/screens/edit/profile_edit.dart';
import 'package:projeto/components/error_screen.dart';

import '../../api/endpoint/profile_endpoint.dart';
import '../../api/token.dart';
import '../../components/item/profile_item.dart';
import '../../measures/pattern_measures.dart';
import '../../models/model_profile.dart';

const String appBarTitle = "Profiles";

class ProfileList extends StatefulWidget {
  final Token token;

  const ProfileList({Key? key, required this.token}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProfileListState();
  }
}

class ProfileListState extends State<ProfileList> {
  late Future<List<Generic>> futureProfileList;
  final Endpoint endpoint = ProfileEndpoint();

  @override
  void initState() {
    super.initState();
    futureProfileList = endpoint.fetch(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        actions: [
          IconButtonNavigator(
              route: const CreateProfile(), token: widget.token),
          IconButtonNavigatorAction(
            token: widget.token,
            idActionApi: DeleteActionApi(endpoint: endpoint),
            iconData: Icons.delete,
          ),
          IconButtonNavigatorAction(
            token: widget.token,
            idActionApi: UpdateActionApi(endpoint: endpoint),
            iconData: Icons.extension_off,
          ),
          IconButton(
            icon: const Icon(Icons.extension),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ProfileEdit();
                  },
                  settings: RouteSettings(arguments: widget.token),
                ),
              );
            },
          )
        ],
      ),
      body: FutureBuilder<List<Generic>>(
        future: futureProfileList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Profile> profileList = snapshot.data! as List<Profile>;
            return ListView.builder(
              padding: PatternMeasures.listCardPadding,
              itemBuilder: (context, index) {
                final Profile profile = profileList[index];
                return ProfileItem(
                  profile: profile,
                );
              },
              itemCount: profileList.length,
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
