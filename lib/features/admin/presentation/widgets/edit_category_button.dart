import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_detail_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/edit_category_screen.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';

class EditCategoryButton extends StatelessWidget {
  final Category category;

  const EditCategoryButton({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(29),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => Navigator.pushReplacementNamed(
            context,
            EDIT_CATEGORY_SCREEN_ROUTE,
            arguments: EditCategoryScreenArgs(
              category,
              (ctx, category) => Navigator.pushReplacementNamed(
                ctx,
                CATEGORY_DETAIL_SCREEN_ROUTE,
                arguments: CategoryDetailScreenArgs(category),
              ),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Icon(
              Icons.edit_outlined,
              size: 30,
              color: BASE_COLOR,
            ),
          ),
        ),
      ),
    );
  }
}
