import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scelloo_blog_app/core/app_routes.dart';
import 'package:scelloo_blog_app/core/config/app_theme.dart';
import 'package:scelloo_blog_app/features/add_post/bloc/add_post_bloc.dart';
import 'package:scelloo_blog_app/features/home_screen/bloc/home_bloc.dart';
import 'package:scelloo_blog_app/features/home_screen/bloc/theme_bloc.dart';
import 'package:scelloo_blog_app/features/home_screen/data/repository/home_repository.dart';
import 'package:scelloo_blog_app/features/post_page/bloc/post_bloc.dart';
import 'package:scelloo_blog_app/features/post_page/data/repository/post_repository.dart';
import 'core/config/get_it_setup.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
              create: (_) => HomeBloc(homeRepository: getIt<HomeRepository>())),
          BlocProvider<AddPostBloc>(
              create: (_) => AddPostBloc(homeRepository: getIt<HomeRepository>())),
          BlocProvider<PostBloc>(
              create: (_) => PostBloc(postRepository: getIt<PostRepository>())),
          BlocProvider<ThemeBloc>(create: (_) => ThemeBloc())
        ],
        child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(
                    1.0)), // Set to 1.0 to prevent scaling
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return MaterialApp.router(
                    scaffoldMessengerKey: rootScaffoldMessengerKey,
                    debugShowCheckedModeBanner: false,
                    routerConfig: router,
                    title: 'Scelloo Task',
                    themeMode: (state is ThemeLight) ? ThemeMode.light : (state is ThemeSystem) ? ThemeMode.system : ThemeMode.dark,
                    darkTheme: MainAppTheme.darkTheme,
                    theme: MainAppTheme.lightTheme);
              },
            )));
  }

}
