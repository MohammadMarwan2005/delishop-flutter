import 'package:delishop/core/helpers/error_handling_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:flutter/material.dart';

import '../data/model/domain_error_model.dart';
import '../widgets/my_alert_dialog.dart';

extension AlertDialogHelper on BuildContext {
  void setupErrorState(DomainErrorModel error) {
    String title = error.message;
    List<String> details = error.details ?? [];

    error.when(onUnprocessableEntity: () {
      title = "Unproccessable Entity!".tr(this);
    }, onUnauthorized: () {
      title = "Wrong Credentials!".tr(this);
      details = ["Check your information!"];
    }, onNoInternet: () {
      title = "No Internet Connection!".tr(this);
      details = ["Check you connection".tr(this)];
    }, onConflict: () {
      title = "Opps!".tr(this);
      details = [error.message];
    }, onNotFound: () {
      title = "Opps!".tr(this);
      details = [error.message];
    }, onUnknown: () {
      title = "Opps!".tr(this);
      details = ["Unknown Error!".tr(this)];
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