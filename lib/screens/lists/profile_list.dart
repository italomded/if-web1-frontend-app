import 'package:flutter/material.dart';
import 'package:projeto/models/model_generic.dart';
import 'package:projeto/models/model_profile.dart';

const String appBarTitle = "Profile list";

class ProfileList extends StatelessWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appBarTitle),
        ),
        body: ListView(
          children: [
            ProfileItem(
              profile: Profile(id: 1, name: "tal", status: true),
            ),
          ],
        ));
  }
}

class ProfileItem extends StatelessWidget {
  final Profile profile;

  const ProfileItem({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("Status: ${profile.status == true ? "Active" : "Inactive"}"),
        ],
      ),
    );
  }
}

class GenericItem extends StatelessWidget {
  final Generic generic;

  const GenericItem({Key? key, required this.generic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Text("Nome: ${generic.name}")),
            ],
          )
        ],
      ),
    );
  }
}
