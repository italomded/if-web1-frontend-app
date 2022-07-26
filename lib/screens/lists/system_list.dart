import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/system_endpoint.dart';
import 'package:projeto/components/screen/screen_list_base.dart';
import '../../api/endpoint/endpoint.dart';
import '../../api/token.dart';
import '../../components/item/system_item.dart';
import '../../models/model_generic.dart';
import '../create/create_system.dart';

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
  late Future<List<Generic>> futureGenericList;
  final Endpoint endpoint = SystemEndpoint();

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
        return SystemItem(generic: generic);
      },
      token: widget.token,
      createResourceRoute: const CreateSystem(),
    );
  }
}
