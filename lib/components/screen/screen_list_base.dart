/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto/models/model_generic.dart';

import '../../api/endpoint/endpoint.dart';
import '../../api/token.dart';
import '../../measures/pattern_measures.dart';
import '../../screens/create/create_profile.dart';
import '../icon_button/icon_button_navigator.dart';
import '../icon_button/icon_button_navigator_status.dart';
import '../item/profile_item.dart';

class ScreenListBase extends StatelessWidget {
  final Future<List<Generic>> futureResourceList;
  final Token token;
  final Endpoint endpoint;
  final Widget turnRoute;


  const ScreenListBase({
    Key? key,
    required this.futureResourceList,
    required this.token,
    required this.endpoint,
    required this.turnRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        actions: [
          IconButtonNavigator(route: const CreateProfile(), token: token),
          IconButtonNavigatorStatus(
            turnRoute: turnRoute,
            token: token,
            endpoint: endpoint,
          ),
        ],
      ),
      body: FutureBuilder<List<Generic>>(
        future: futureResourceList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Generic> profileList = snapshot.data! as List<Generic>;
            return ListView.builder(
              padding: PatternMeasures.listCardPadding,
              itemBuilder: (context, index) {
                final Generic profile = profileList[index];
                return ProfileItem(
                  profile: profile,
                );
              },
              itemCount: profileList.length,
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
*/