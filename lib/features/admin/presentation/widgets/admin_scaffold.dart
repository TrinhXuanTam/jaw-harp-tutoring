import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/big_app_bar_background.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';

/// Admin header with description.
class AdminScaffold extends StatelessWidget {
  final String title;
  final String description;
  final Widget body;
  final VoidCallback onClose;
  final List<Widget> actions;

  const AdminScaffold({
    Key? key,
    required this.title,
    required this.description,
    required this.body,
    required this.onClose,
    this.actions = const [],
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
        onPressed: this.onClose,
      ),
      backgroundColor: Colors.grey[200],
      body: CenteredStack(
        children: [
          Positioned(
            top: 0,
            child: BigAppBarBackground(height: size.height * 0.2),
          ),
          Column(
            children: [
              Container(
                width: size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.translate(this.title),
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                l10n.translate(this.description),
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ...this.actions,
                      ],
                    ),
                    const SizedBox(height: 15),
                    this.body,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
