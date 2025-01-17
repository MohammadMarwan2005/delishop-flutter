import 'package:delishop/core/lang/lang_code_cubit.dart';
import 'package:delishop/core/theme/theme.dart';
import 'package:delishop/core/widgets/loading.dart';
import 'package:delishop/delishop_app/first_route_helper.dart';
import 'package:delishop/feature/auth/cubit/auth_cubit.dart';
import 'package:delishop/feature/global/global_cubit.dart';
import 'package:delishop/feature/notifications/cubit/notifications_cubit.dart';
import 'package:delishop/feature/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/di/di_get_it.dart';
import '../core/lang/app_localization.dart';
import '../feature/cart/cubit/cart_cubit.dart';

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
          BlocProvider<AuthCubit>(create: (context) => getIt()),
          BlocProvider<LangCodeCubit>(create: (context) => getIt()),
          BlocProvider<CartCubit>(create: (context) => getIt()),
          BlocProvider<GlobalCubit>(create: (context) => getIt()),
          BlocProvider<SearchCubit>(create: (context) => getIt()),
          BlocProvider<NotificationsCubit>(create: (context) => getIt()),
        ],
        child: BlocBuilder<LangCodeCubit, LangCodeState>(
          builder: (context, state) {
            if (state is LangCodeLoaded) {
              return MaterialApp(
                locale: state.langCode != null ? Locale(state.langCode!) : null,
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                debugShowCheckedModeBanner: false,
                theme: DelishopTheme.lightTheme,
                home: FutureBuilder(
                  future: getFirstRoute(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Scaffold(
                          body: Loading());
                    } else if (snapshot.hasData) {
                      return snapshot.data!;
                    }
                    return const Placeholder();
                  },
                ),
              );
            } else {
              return const MaterialApp(
                home:
                    Scaffold(body: Center(child: CircularProgressIndicator())),
              );
            }
          },
        ),
      ),
    );
  }
}
