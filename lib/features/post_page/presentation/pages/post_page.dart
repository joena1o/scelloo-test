import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scelloo_blog_app/core/app_colors.dart';
import 'package:scelloo_blog_app/features/home_screen/data/models/post_model.dart';
import 'package:scelloo_blog_app/features/post_page/bloc/post_bloc.dart';
import 'package:scelloo_blog_app/utils/responsive.dart';
import 'package:scelloo_blog_app/utils/utility_class.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.post});

  final PostModel post;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostBloc>(context)
        .add(FetchPostEvent(id: widget.post.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
        elevation: 2,
      ),
      body: SizedBox(
        width: Responsive.getSize(context).width,
        height: Responsive.getSize(context).height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: UtilityClass.horizontalAndVerticalPadding,
                child: Text(widget.post.title!,
                    style: UtilityClass.titleTextStyle),
              ),
              Padding(
                padding: UtilityClass.horizontalPadding,
                child: Text(
                  widget.post.body!,
                  style: UtilityClass.bodyTextStyle,
                ),
              ),
              Padding(
                padding: UtilityClass.horizontalAndVerticalPadding,
                child: Text(
                  "Comments",
                  style: UtilityClass.titleTextStyle,
                ),
              ),

              BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {

                  if (state is PostLoading) {
                    return Container(
                          alignment: Alignment.center,
                          margin: UtilityClass.horizontalAndVerticalPadding,
                          child: const CircularProgressIndicator(),
                    );
                  }

                    if(state is PostLoaded) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(state.comments.length, (index) {
                            final comment = state.comments[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: AppColors.borderGray))),
                              child:  ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(comment.name!),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(comment.email!, style: UtilityClass.bodyTextStyle),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(comment.body!),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                    }

                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.comment, size: 50, color: AppColors.borderGray,),
                        const SizedBox(height: 20,),
                        const Text("No comments available")
                      ],
                    ),
                  );

                },
              ),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
