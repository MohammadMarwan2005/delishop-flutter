import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/delishop_app/delishop_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const DelishopApp());
}