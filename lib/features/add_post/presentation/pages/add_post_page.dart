import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scelloo_blog_app/features/add_post/bloc/add_post_bloc.dart';
import 'package:scelloo_blog_app/utils/responsive.dart';
import 'package:scelloo_blog_app/utils/utility_class.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
      ),
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: BlocConsumer<AddPostBloc, AddPostState>(
            listener: (context, state){
              if(state is PostAddedState){
                setState((){
                  title.text = "";
                  body.text = "";
                });
              }
            },
            builder: (context, state) {
              return Column(
                children: [

                  const SizedBox(height: 20,),

                  const Text("Title"),
                  const SizedBox(height: 10,),

                  Padding(
                    padding: UtilityClass.horizontalPadding,
                    child: TextFormField(
                      controller: title,
                      validator: (String? e) {
                        if (e!.isEmpty) {
                          return "Title field is empty";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: "Enter title here"
                      ),
                    ),
                  ),

                  const SizedBox(height: 30,),

                  const Text("Body"),
                  const SizedBox(height: 10,),

                  Padding(
                    padding: UtilityClass.horizontalPadding,
                    child: TextFormField(
                      controller: body,
                      validator: (String? e) {
                        if (e!.isEmpty) {
                          return "Body field is empty";
                        }
                        return null;
                      },
                      maxLines: 5,
                      decoration: const InputDecoration(
                          labelText: "Enter body here"
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  (state is AddPostLoadingState) ?
                    Container(
                      margin: UtilityClass.horizontalAndVerticalPadding,
                      child: const CircularProgressIndicator(),
                    )
                    : Container(
                    margin: UtilityClass.horizontalPadding,
                    width: Responsive
                        .getSize(context)
                        .width,
                    decoration: UtilityClass.buttonDecorationFill,
                    child: ElevatedButton(onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AddPostBloc>(context).add(
                            AddingPostEvent(title: title.text, body: body.text));
                      }
                    }, child: const Text("Add Post")),
                  )


                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
