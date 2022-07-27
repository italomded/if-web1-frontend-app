import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/endpoint.dart';
import 'package:projeto/components/screen/list_tile_navigator.dart';

import 'package:projeto/components/screen/screen_list_base.dart';
import 'package:projeto/models/model_generic.dart';
import 'package:projeto/screens/create/create_profile.dart';
import 'package:projeto/screens/edit/profile_edit.dart';

import '../../api/endpoint/profile_endpoint.dart';
import '../../api/token.dart';
import '../../components/item/profile_item.dart';

const String appBarTitle = "Profiles";

const String menuResourceRelationsText = "Profile relations";

class ProfileList extends StatefulWidget {
  final Token token;

  const ProfileList({Key? key, required this.token}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileListState();
  }
}

class _ProfileListState extends State<ProfileList> {
  late Future<List<Generic>> futureGenericList;
  final Endpoint endpoint = ProfileEndpoint();

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
        return ProfileItem(generic: generic);
      },
      token: widget.token,
      createResourceRoute: const CreateProfile(),
      extraListTileNavigator: [
        ListTileNavigator(
          title: menuResourceRelationsText,
          route: const ProfileEdit(),
          token: widget.token,
          icon: Icons.extension,
          refreshScreen: refreshScreen,
        ),
      ],
    );
  }
}
