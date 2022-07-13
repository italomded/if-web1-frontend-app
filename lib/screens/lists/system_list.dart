import 'package:flutter/material.dart';

import '../../api/system_api.dart';
import '../../components/item/system_item.dart';
import '../../models/model_system.dart';

const String appBarTitle = "System list";

class SystemList extends StatefulWidget {
  const SystemList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SystemListState();
  }
}

class SystemListState extends State<SystemList> {
  late Future<List<System>> futureSystemList;

  @override
  void initState() {
    super.initState();
    futureSystemList = SystemApi().fetchSystem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: FutureBuilder<List<System>>(
        future: futureSystemList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<System> systemList = snapshot.data!;
            return ListView.builder(
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
