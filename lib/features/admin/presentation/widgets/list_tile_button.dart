import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';

class ListTileButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Function onTap;

  const ListTileButton({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.description,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final localizations = AppLocalizations.of(context);

    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 3,
      child: InkWell(
        onTap: this.onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          width: size.width * 0.9,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localizations.translate(this.title),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: BASE_COLOR,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      localizations.translate(this.description),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Icon(
                this.icon,
                color: BASE_COLOR,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
