import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/system_endpoint.dart';
import 'package:projeto/api/fetch_all_api.dart';

import '../../api/token.dart';
import '../../components/item/system_item.dart';
import '../../measures/pattern_measures.dart';
import '../../models/model_generic.dart';
import '../../models/model_system.dart';

const String appBarTitle = "Systems";

class SystemList extends StatefulWidget {
  final Token token;

  const SystemList({Key? key, required this.token}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SystemListState();
  }
}

class SystemListState extends State<SystemList> {
  late Future<List<Generic>> futureSystemList;

  @override
  void initState() {
    super.initState();
    futureSystemList =
        FetchAllApi(endpoint: SystemEndpoint()).fetch(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
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
