import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/endpoint.dart';
import 'package:projeto/components/error_screen.dart';
import 'package:projeto/components/item/generic_item.dart';
import 'package:projeto/models/model_generic.dart';
import '../../api/token.dart';
import '../../components/form/input_field.dart';
import '../../measures/pattern_measures.dart';

const String appBarTitle = "Search resource";
const String idNameLabelText = "Resource ID";
const String searchButtonText = "Search";

class Search extends StatefulWidget {
  final Endpoint endpoint;

  const Search({Key? key, required this.endpoint}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search> {
  final TextEditingController _idNameController = TextEditingController();
  late Future<Generic> _futureGeneric;
  late Token _token;

  @override
  Widget build(BuildContext context) {
    _token = ModalRoute.of(context)!.settings.arguments as Token;
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: Column(
        children: [
          InputField(
            labelController: _idNameController,
            labelText: idNameLabelText,
            secret: false,
            padding: PatternMeasures.lastInputFieldPaddingPattern,
          ),
          ElevatedButton(
            onPressed: () {
              setState(
                () {
                  _futureGeneric =
                      widget.endpoint.fetchOne(_token, _idNameController.text);
                },
              );
            },
            child: const Text(searchButtonText),
          ),
          const Divider(),
          FutureBuilder<Generic>(
            future: _futureGeneric,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Generic generic = snapshot.data!;
                return ListView(
                  padding: PatternMeasures.listCardPadding,
                  children: [
                    GenericItem(
                      generic: generic,
                    ),
                  ],
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
        ],
      ),
    );
  }
}
