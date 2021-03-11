import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/big_app_bar_background.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/scrollable_category_list.dart';
import 'package:jews_harp/features/admin/presentation/widgets/scrollable_technique_list.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';

class CategoryDetailScreenArgs {
  final CategoryDetailBloc categoryDetailBloc;

  CategoryDetailScreenArgs(this.categoryDetailBloc);
}

class CategoryDetailScreen extends StatelessWidget {
  final CategoryDetailBloc categoryDetailBloc;

  factory CategoryDetailScreen.fromArgs(CategoryDetailScreenArgs args) {
    return CategoryDetailScreen(categoryDetailBloc: args.categoryDetailBloc);
  }

  const CategoryDetailScreen({
    Key? key,
    required this.categoryDetailBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: IconAppBar(
        backgroundColor: BASE_COLOR,
        iconColor: Colors.white,
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Colors.grey[200],
      body: CenteredStack(
        children: [
          Positioned(
            top: 0,
            child: BigAppBarBackground(height: size.height * 0.2),
          ),
          Container(
            width: size.width * 0.9,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoryDetailBloc.category!.getLocalizedTitle(l10n.locale.languageCode),
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            categoryDetailBloc.category!.getLocalizedDescription(l10n.locale.languageCode),
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {},
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
                    ),
                  ],
                ),
                SizedBox(height: 15),
                FutureBuilder<List<Technique>>(
                  future: categoryDetailBloc.techniques,
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      final items = snapshot.data!
                          .map((e) => ScrollableTechniqueListItem(
                                onTap: () {},
                                title: e.getLocalizedTitle(l10n.locale.languageCode),
                                productId: e.productId,
                                thumbnailUrl: e.thumbnailUrl,
                              ))
                          .toList();

                      return ScrollableTechniqueList(
                        items: items,
                        height: size.height * 0.7,
                      );
                    } else
                      return Container();
                    // TODO container
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
