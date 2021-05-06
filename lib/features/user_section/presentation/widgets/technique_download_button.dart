import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/connectivity/connectivity_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart';

/// Technique download button.
class TechniqueDownloadButton extends StatelessWidget {
  final Technique technique;

  const TechniqueDownloadButton({Key? key, required this.technique}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectivityBloc = BlocProvider.of<ConnectivityBloc>(context);
    final bool isConnected = connectivityBloc.state is ConnectionAvailable;
    final l10n = AppLocalizations.of(context);

    return BlocBuilder<TechniqueLocalStorageBloc, TechniqueLocalStorageState>(builder: (ctx, state) {
      final bloc = BlocProvider.of<TechniqueLocalStorageBloc>(ctx);

      if (state.downloadingInProgress.contains(this.technique.id))
        return Column(
          children: [
            const Icon(
              Icons.download_rounded,
              color: Colors.grey,
              size: 20,
            ),
            Text(
              l10n.translate("Downloading..."),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        );
      else if (!state.downloadedTechniques.containsKey(technique.id))
        return GestureDetector(
          onTap: isConnected ? () => bloc.add(DownloadTechniqueEvent(this.technique.id)) : null,
          child: Column(
            children: [
              Icon(
                Icons.download_outlined,
                color: isConnected ? BASE_COLOR : Colors.grey,
                size: 20,
              ),
              Text(
                l10n.translate("Download"),
                style: TextStyle(
                  fontSize: 12,
                  color: isConnected ? BASE_COLOR : Colors.grey,
                ),
              ),
            ],
          ),
        );
      else
        return GestureDetector(
          onTap: () => bloc.add(DeleteDownloadedTechniqueEvent(this.technique.id)),
          child: Column(
            children: [
              const Icon(
                Icons.delete_rounded,
                color: Colors.redAccent,
                size: 20,
              ),
              Text(
                l10n.translate("Delete"),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
    });
  }
}
