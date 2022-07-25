import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/system_endpoint.dart';
import 'package:projeto/api/id_action/delete_action_api.dart';
import 'package:projeto/api/id_action/update_action_api.dart';

import '../../api/endpoint/endpoint.dart';
import '../../api/token.dart';
import '../../components/icon_button/icon_button_navigator.dart';
import '../../components/icon_button/icon_button_navigator_action.dart';
import '../../components/item/system_item.dart';
import '../../measures/pattern_measures.dart';
import '../../models/model_generic.dart';
import '../../models/model_system.dart';
import '../create/create_system.dart';
import '../../components/error_screen.dart';

const String appBarTitle = "Systems";

class SystemList extends StatefulWidget {
  final Token token;

  const SystemList({Key? key, required this.token}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SystemListState();
  }
}

class _SystemListState extends State<SystemList> {
  late Future<List<Generic>> futureSystemList;
  final Endpoint endpoint = SystemEndpoint();

  @override
  void initState() {
    super.initState();
    futureSystemList = endpoint.fetch(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        actions: [
          IconButtonNavigator(
            route: const CreateSystem(),
            token: widget.token,
          ),
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
        future: futureSystemList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<System> systemList = snapshot.data! as List<System>;
            return ListView.builder(
              padding: PatternMeasures.listCardPadding,
              itemBuilder: (context, index) {
                final System system = systemList[index];
                return SystemItem(
                  system: system,
                );
              },
              itemCount: systemList.length,
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
