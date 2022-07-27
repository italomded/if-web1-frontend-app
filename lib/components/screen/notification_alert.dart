import 'package:flutter/material.dart';
import 'package:projeto/components/screen/alert/alert_chain.dart';
import 'package:projeto/components/screen/alert/bad_credentials_alert.dart';
import 'package:projeto/components/screen/alert/conflict_alert.dart';
import 'package:projeto/components/screen/alert/created_alert.dart';
import 'package:projeto/components/screen/alert/error_alert.dart';
import 'package:projeto/components/screen/alert/ok_alert.dart';
import 'package:projeto/components/screen/alert/unauthorized_alert.dart';
import 'package:projeto/components/screen/alert/unexpected_alert.dart';

class NotificationAlert {
  final BuildContext context;
  late AlertChain alertChain;

  NotificationAlert({required this.context});

  void process(List<String> responseList) {
    alertChain = CreatedAlert(
      context: context,
      nextAlert: OkAlert(
        context: context,
        nextAlert: ErrorAlert(
          context: context,
          nextAlert: BadCredentialsAlert(
            context: context,
            nextAlert: ConflictAlert(
              context: context,
              nextAlert: UnauthorizedAlert(
                context: context,
                nextAlert: UnexpectedAlert(
                  context: context,
                  nextAlert: null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    alertChain.doAction(responseList);
  }
}
