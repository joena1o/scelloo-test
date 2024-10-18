import 'package:get_it/get_it.dart';
import 'package:scelloo_blog_app/features/home_screen/data/repository/home_repository.dart';
import 'package:scelloo_blog_app/features/post_page/data/repository/post_repository.dart';
import 'package:scelloo_blog_app/utils/dialog_services.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository());
  getIt.registerLazySingleton<PostRepository>(() => PostRepository());
  getIt.registerLazySingleton<DialogServices>(() => DialogServices());
}
