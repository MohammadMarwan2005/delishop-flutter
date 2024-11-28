import 'package:delishop/core/theme/theme.dart';
import 'package:delishop/delishop_app/first_route_helper.dart';
import 'package:delishop/feature/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/di/di_get_it.dart';

class DelishopApp extends StatelessWidget {
  const DelishopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 810),
      minTextAdapt: true,
      splitScreenMode: true,
      // This bloc will be needed in many screens
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(create: (context) => getIt())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: DelishopTheme.lightTheme,
          home: FutureBuilder(
            future: getFirstRoute(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(body: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasData) {
                return snapshot.data!;
              }
              return const Placeholder();
            },
          ),
        ),
      ),
    );
  }
}
