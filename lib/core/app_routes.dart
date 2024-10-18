import 'package:go_router/go_router.dart';
import 'package:scelloo_blog_app/features/add_post/presentation/pages/add_post_page.dart';
import 'package:scelloo_blog_app/features/home_screen/data/models/post_model.dart';
import 'package:scelloo_blog_app/features/home_screen/presentation/pages/home_page.dart';
import 'package:scelloo_blog_app/features/post_page/presentation/pages/post_page.dart';
import 'package:scelloo_blog_app/wrapper.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Wrapper()),
    GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
              path: 'post-page',
              builder: (context, state) {
                final arg = state.extra as PostModel;
                return PostPage(post: arg);
              }),
          GoRoute(
              path: 'add-post',
              builder: (context, state) {
                return const AddPostPage();
              }),
        ]),
  ],
);

GoRouter get router => _router;
