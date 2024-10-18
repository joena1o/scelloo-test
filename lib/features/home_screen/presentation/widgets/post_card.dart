import 'package:flutter/material.dart';
import 'package:scelloo_blog_app/core/app_colors.dart';
import 'package:scelloo_blog_app/utils/responsive.dart';
import 'package:scelloo_blog_app/utils/utility_class.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UtilityClass.horizontalAndVerticalPadding,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
        border: Border.all(color: AppColors.borderGray)
      ),
      width: Responsive.getSize(context).width,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 10,
        title: Text(title, style: UtilityClass.titleTextStyle, overflow: TextOverflow.ellipsis,),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(subtitle, style: UtilityClass.bodyTextStyle, overflow: TextOverflow.ellipsis,),
        ),
      ),
    );
  }
}
