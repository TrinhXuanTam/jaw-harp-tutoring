import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/admin/presentation/screens/upload_files_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/thumbnail_picker.dart';
import 'package:jews_harp/features/admin/presentation/widgets/video_picker.dart';

/// File upload button with title and description.
class FileUploadField extends StatelessWidget {
  final String title;
  final String description;
  final ThumbnailPickerController? thumbnailController;
  final VideoPickerController? videoController;

  const FileUploadField({
    Key? key,
    this.title = "Upload files:",
    this.description = "Upload additional to improve the user experience.",
    this.thumbnailController,
    this.videoController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.translate(this.title),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                l10n.translate(this.description),
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: Material(
            color: BASE_COLOR,
            child: InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                UPLOAD_FILES_SCREEN_ROUTE,
                arguments: UploadFilesScreenArgs(
                  thumbnailController: this.thumbnailController,
                  videoController: this.videoController,
                ),
              ),
              child: const Padding(
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.cloud_upload,
                  color: BASE_COLOR_VERY_LIGHT,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
