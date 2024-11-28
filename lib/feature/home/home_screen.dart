import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/core/di/di_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserDataRepo userDataRepo = getIt();
  String token = "";
  String name = "";

  @override
  void initState() {
    super.initState();
    fetchToken();
  }

  void fetchToken() async {
    String fetchedToken = await userDataRepo.getToken();
    String firstName = userDataRepo.getString(DataAccessKeys.firstNameKey);
    String lastName = userDataRepo.getString(DataAccessKeys.lastNameKey);
    setState(() {
      token = fetchedToken;
      name = "$firstName $lastName";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello, $name",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 16.h),
          Text(token),
        ],
      )),
    );
  }
}
