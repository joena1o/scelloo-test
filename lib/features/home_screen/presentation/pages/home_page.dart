import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scelloo_blog_app/core/app_colors.dart';
import 'package:scelloo_blog_app/features/home_screen/bloc/home_bloc.dart';
import 'package:scelloo_blog_app/features/home_screen/bloc/theme_bloc.dart';
import 'package:scelloo_blog_app/features/home_screen/presentation/widgets/post_card.dart';
import 'package:scelloo_blog_app/utils/utility_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomePost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scello Blog App"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
              customBottomSheet();
            }, icon: const Icon(Icons.light_mode, size: 24,)),
          )
        ],
        elevation: 2,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {

            if(state is HomeLoadingPostState) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }

            if(state is HomeLoadedState) {
              return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: state.posts!.length,
                itemBuilder: (BuildContext ctx, int index) {
                  final post = state.posts![index];
                  return GestureDetector(
                      onTap: (){
                        context.push("/home/post-page", extra: post);
                      },
                      child: PostCard(title: post.title!, subtitle: post.body!));
                },
              ));
            }

            return SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(Icons.feed, size: 50, color: AppColors.borderGray,),
                    const SizedBox(height: 20,),
                    const Text("No posts available")
                ],
              ),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.push("/home/add-post");
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void customBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        isScrollControlled: true,
        builder: (BuildContext context) {
          Size size = MediaQuery
              .of(context)
              .size;
          return SizedBox(
            width: size.width,
            height: 320,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: ()  {
                   BlocProvider.of<ThemeBloc>(context).add(const ToggleTheme(mode: 'd'));
                    context.pop();
                  },
                  child: Container(
                    margin: UtilityClass.horizontalPadding,
                    padding:
                    const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.tertiaryColor,
                        foregroundColor: Theme.of(context).cardColor,
                        child: const Icon(
                          Icons.dark_mode,
                          size: 20,
                        ),
                      ),
                      title: const Text("Dark"),
                    ),
                  ),
                ),
                Container(
                  padding: UtilityClass.horizontalPadding,
                  height: 10,
                ),
                GestureDetector(
                  onTap: ()  {
                    BlocProvider.of<ThemeBloc>(context).add(const ToggleTheme(mode: 'l'));
                    context.pop();
                  },
                  child: Container(
                    margin: UtilityClass.horizontalPadding,
                    padding:
                    const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.tertiaryColor,
                        foregroundColor: Theme.of(context).cardColor,
                        child: const Icon(
                          Icons.light_mode,
                          size: 20,
                        ),
                      ),
                      title: const Text("Light"),
                    ),
                  ),
                ),
                Container(
                  padding: UtilityClass.horizontalPadding,
                  height: 10,
                ),
                GestureDetector(
                  onTap: ()  {
                    BlocProvider.of<ThemeBloc>(context).add(const ToggleTheme(mode: 's'));
                    context.pop();
                  },
                  child: Container(
                    margin: UtilityClass.horizontalPadding,
                    padding:
                    const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.tertiaryColor,
                        foregroundColor: Theme.of(context).cardColor,
                        child: const Icon(
                          Icons.brightness_2_rounded,
                          size: 20,
                        ),
                      ),
                      title: const Text("System"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        });
  }
}
