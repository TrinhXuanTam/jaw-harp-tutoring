import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/settings.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart';

class TechniqueSearchBar extends StatefulWidget {
  @override
  _TechniqueSearchBarState createState() => _TechniqueSearchBarState();
}

class _TechniqueSearchBarState extends State<TechniqueSearchBar> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return RoundedTextField(
      onChanged: (_) {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(
          Duration(milliseconds: DEBOUNCE_TIME),
          () => BlocProvider.of<TechniquesBloc>(context).add(TextSearchPerformed(_searchController.text)),
        );
      },
      icon: Icons.search_rounded,
      color: Colors.white.withOpacity(0.6),
      padding: EdgeInsets.symmetric(horizontal: 20),
      controller: _searchController,
    );
  }
}
