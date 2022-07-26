import 'package:flutter/material.dart';
import 'package:projeto/api/id_action/delete_action_api.dart';
import 'package:projeto/api/id_action/update_action_api.dart';
import 'package:projeto/components/screen/error_screen.dart';
import 'package:projeto/components/item/generic_item.dart';

import 'package:projeto/models/model_generic.dart';
import 'package:projeto/screens/edit/id_action.dart';
import 'package:projeto/screens/edit/search.dart';

import '../../api/endpoint/endpoint.dart';
import '../../api/token.dart';
import '../../measures/pattern_measures.dart';

import 'list_tile_navigator.dart';

const String menuCreateResourceText = "Create resource";
const String menuDeleteResourceText = "Delete resource";
const String menuUpdateResourceText = "Update resource";
const String menuSearchResourceText = "Search for resource";

class ScreenListBase extends StatelessWidget {
  final String appBarTitle;
  final Token token;
  final Endpoint endpoint;
  final Future<List<Generic>> futureGenericList;
  final GenericItem Function(Generic generic) convertToItemFunction;
  final Widget createResourceRoute;
  final List<ListTileNavigator>? extraListTileNavigator;

  final Function refreshScreen;

  const ScreenListBase({
    Key? key,
    required this.endpoint,
    required this.futureGenericList,
    required this.convertToItemFunction,
    required this.token,
    required this.appBarTitle,
    required this.createResourceRoute,
    required this.refreshScreen,
    this.extraListTileNavigator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        actions: [
          IconButton(
            onPressed: () {
              refreshScreen();
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTileNavigator(
                        refreshScreen: refreshScreen,
                        title: menuCreateResourceText,
                        icon: Icons.library_add,
                        route: createResourceRoute,
                        token: token,
                      ),
                      ListTileNavigator(
                        refreshScreen: refreshScreen,
                        title: menuDeleteResourceText,
                        icon: Icons.delete,
                        route: IdAction(
                          actionApi: DeleteActionApi(endpoint: endpoint),
                          appBarTitle: menuDeleteResourceText,
                        ),
                        token: token,
                      ),
                      ListTileNavigator(
                        refreshScreen: refreshScreen,
                        title: menuUpdateResourceText,
                        icon: Icons.extension_off,
                        route: IdAction(
                          actionApi: UpdateActionApi(endpoint: endpoint),
                          appBarTitle: menuUpdateResourceText,
                        ),
                        token: token,
                      ),
                      ListTileNavigator(
                        refreshScreen: refreshScreen,
                        title: menuSearchResourceText,
                        route: Search(endpoint: endpoint),
                        token: token,
                        icon: Icons.search,
                      ),
                      Column(
                        children: (extraListTileNavigator == null)
                            ? []
                            : extraListTileNavigator!,
                      )
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Generic>>(
        future: futureGenericList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Generic> genericList = snapshot.data!;
            return ListView.builder(
              padding: PatternMeasures.listCardPadding,
              itemBuilder: (context, index) {
                final Generic generic = genericList[index];
                return convertToItemFunction(generic);
              },
              itemCount: genericList.length,
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
