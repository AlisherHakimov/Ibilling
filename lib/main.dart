import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/features/contracts/presentation/bloc/contracts_bloc.dart';
import 'package:ibilling/home_screen.dart';
import 'package:ibilling/features/history/presentation/bloc/history_bloc.dart';
import 'package:ibilling/features/new/presentation/bloc/new_bloc.dart';
import 'package:ibilling/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:ibilling/features/saved/presentation/bloc/saved_bloc.dart';

import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
        Locale('uz'),
      ],
      startLocale: const Locale('uz', 'UZ'),
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<ContractsBloc>()),
        BlocProvider(create: (context) => SavedBloc()),
        BlocProvider(create: (context) => HistoryBloc()),
        BlocProvider(create: (context) => NewBloc()),
        BlocProvider(create: (context) => di.sl<ProfileBloc>()),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
              fontFamily: GoogleFonts.ubuntu().fontFamily,
              scaffoldBackgroundColor: black,
              colorScheme: const ColorScheme.dark(
                primary: white,
              ),
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
