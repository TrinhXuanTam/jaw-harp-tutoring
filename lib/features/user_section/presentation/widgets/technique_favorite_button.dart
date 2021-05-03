import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart';
import 'package:jews_harp/features/user_section/utils.dart';

/// Button to mark technique as favorite.
class TechniqueFavoriteButton extends StatelessWidget {
  final Technique technique;

  const TechniqueFavoriteButton({Key? key, required this.technique}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = getUser(context);
    final isFavorite = user.favoriteTechniques.contains(this.technique.id);
    final l10n = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () {
        final techniqueDetailBloc = BlocProvider.of<TechniqueDetailBloc>(context);
        final user = getUser(context);

        if (isFavorite)
          techniqueDetailBloc.add(RemoveTechniqueFromFavoritesEvent(technique, user));
        else
          techniqueDetailBloc.add(MarkTechniqueAsFavoriteEvent(technique, user));
      },
      child: Column(
        children: [
          Icon(
            isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            color: BASE_COLOR,
            size: 20,
          ),
          Text(
            l10n.translate("Favorite"),
            style: const TextStyle(
              fontSize: 12,
              color: BASE_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
