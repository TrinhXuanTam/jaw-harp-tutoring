import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/create_technique/create_technique_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/upload_files_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/language_side_scroll_grid.dart';
import 'package:jews_harp/features/admin/presentation/widgets/thumbnail_picker.dart';
import 'package:jews_harp/features/admin/presentation/widgets/video_picker.dart';

class CreateTechniqueScreen extends StatefulWidget {
  @override
  _CreateTechniqueScreenState createState() => _CreateTechniqueScreenState();
}

class _CreateTechniqueScreenState extends State<CreateTechniqueScreen> {
  final _idController = TextEditingController();
  final _thumbnailController = ThumbnailPickerController();
  final _videoController = VideoPickerController();
  final _createTechniqueBloc = serviceLocator<CreateTechniqueBloc>();

  @override
  void dispose() {
    _createTechniqueBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          BlocProvider<CreateTechniqueBloc>(
            create: (_) => _createTechniqueBloc,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleWithSubtitle(
                  titleText: "Create Technique",
                  titleSize: 35,
                  subtitleText: "Create a new technique",
                ),
                SizedBox(height: 20),
                RoundedTextField(
                  icon: Icons.attach_money_rounded,
                  controller: _idController,
                  placeholderText: "Product ID",
                ),
                SizedBox(height: 15),
                Container(
                  width: size.width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Upload files:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Upload additional to improve the user experience.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: Material(
                              color: BASE_COLOR,
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  UPLOAD_FILES_SCREEN_ROUTE,
                                  arguments: UploadFilesScreenArgs(_thumbnailController, _videoController),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.cloud_upload,
                                    color: BASE_COLOR_VERY_LIGHT,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Localization:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Translate your content into different languages.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),
                      BlocBuilder<CreateTechniqueBloc, CreateTechniqueState>(
                        builder: (ctx, state) => LanguageSideScrollGrid(
                          displayAddButton: SupportedLanguages.languages.length != _createTechniqueBloc.localizedData.length,
                          data: _createTechniqueBloc.localizedData.entries.map((entry) => LanguageSideScrollGridItem(languageCode: entry.key, onTap: () {})).toList(),
                          onAddButtonTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RoundedButton(
                  text: "Create",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
