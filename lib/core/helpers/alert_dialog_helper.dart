import 'package:delishop/core/helpers/error_handling_helper.dart';
import 'package:flutter/material.dart';

import '../data/model/domain_error_model.dart';
import '../widgets/my_alert_dialog.dart';

extension AlertDialogHelper on BuildContext {
  void setupErrorState(DomainErrorModel error) {
    String title = error.message;
    List<String> details = error.details ?? [];

    error.when(onUnprocessableEntity: () {
      title = "Unproccessable Entity!";
    }, onUnauthorized: () {
      title = "Wrong Credentials!";
      details = ["Check your information!"];
    }, onNoInternet: () {
      title = "No Internet Connection!";
      details = ["Check you connection"];
    }, onConflict: () {
      title = "Opps!";
      details = [error.message];
    }, onNotFound: () {
      title = "Opps!";
      details = [error.message];
    }, onUnknown: () {
      title = "Opps!";
      details = ["Unknown Error!"];
    });
    showDialog(
        context: this,
        builder: (context) => MyAlertDialog(
          title: title,
          details: details,
          isError: true,
        ));
  }

}