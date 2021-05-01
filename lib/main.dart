import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:jews_harp/core/BLoCs/connectivity/connectivity_bloc.dart';
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_detail_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_localization_add_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_localization_edit_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/create_category_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/create_technique_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/edit_category_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/edit_technique_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/hidden_categories_list_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/technique_list_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/technique_localization_add_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/technique_localization_edit_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/upload_files_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/visible_categories_list_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/link_auth_providers_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/password_reset_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/password_reset_sent_screen.dart';
import 'package:jews_harp/features/user_section/presentation/screens/technique_screen.dart';
import 'package:jews_harp/features/user_section/presentation/screens/user_section.dart';

import 'core/constants/routes.dart';
import 'core/constants/settings.dart';
import 'core/dependency_injection/service_locator.dart';
import 'core/l10n.dart';
import 'features/auth/presentation/BLoCs/auth_state/auth_bloc.dart';
import 'features/auth/presentation/screens/authentication_screen.dart';
import 'features/auth/presentation/screens/email_verification_screen.dart';
import 'features/auth/presentation/screens/sign_up_screen.dart';
import 'features/auth/presentation/screens/splash_screen.dart';
import 'features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart';
import 'features/user_section/presentation/screens/video_full_screen_mode_screen.dart';

/// Driver function
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Enable in app purchases.
  InAppPurchaseConnection.enablePendingPurchases();

  // Create Firebase connection.
  await Firebase.initializeApp();

  // Initialize dependency injection.
  configureDependencies();

  // Disable landscape mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Run the app
  runApp(_EntryPoint());
}

/// Entry point of the application
class _EntryPoint extends StatelessWidget {
  final GlobalKey<NavigatorState> globalKey = new GlobalKey();

  void _authBlocListener(BuildContext context, AuthState state) {
    final currentState = globalKey.currentState!;

    if (state is UserAuthenticated) {
      if (state.user.isVerified)
        currentState.pushNamedAndRemoveUntil(USER_SECTION_SCREEN_ROUTE, (route) => false);
      else {
        currentState.pushNamedAndRemoveUntil(AUTH_SCREEN_ROUTE, (route) => false);
        currentState.pushNamed(
          EMAIL_VERIFICATION_UP_SCREEN_ROUTE,
        );
      }
    } else
      currentState.pushNamedAndRemoveUntil(AUTH_SCREEN_ROUTE, (route) => false);
  }

  void _errorBlocListener(BuildContext context, ErrorState state) {
    if (state is UserErrorOccurredState)
      showDialog(
        context: globalKey.currentContext!,
        builder: (_) {
          return OneButtonAlertDialog(
            title: state.title,
            message: state.message,
            onPressed: () {
              BlocProvider.of<ErrorBloc>(context).add(ErrorResolvedEvent());
              globalKey.currentState!.pop();
            },
          );
        },
      );
  }

  T _getArgs<T>(ctx) => ModalRoute.of(ctx)!.settings.arguments as T;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => serviceLocator<AuthBloc>()),
        BlocProvider<ErrorBloc>(create: (_) => serviceLocator<ErrorBloc>()),
        BlocProvider<TechniqueLocalStorageBloc>(create: (_) => serviceLocator<TechniqueLocalStorageBloc>()..add(InitTechniqueLocalStorage()), lazy: false),
        BlocProvider<ConnectivityBloc>(create: (_) => serviceLocator<ConnectivityBloc>()..add(CheckInternetConnection()), lazy: false),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: _authBlocListener),
          BlocListener<ErrorBloc, ErrorState>(listener: _errorBlocListener),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: APP_TITLE,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: SupportedLanguages.getCodes().map((e) => Locale(e)),
          localeResolutionCallback: (locale, supportedLocales) {
            if (locale == null) return supportedLocales.first;

            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode || supportedLocale.countryCode == locale.countryCode) return supportedLocale;
            }
            return supportedLocales.first;
          },
          theme: new ThemeData(
            accentColor: BASE_COLOR,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.black,
                  displayColor: Colors.black,
                ),
          ),
          navigatorKey: globalKey,
          routes: {
            SPLASH_SCREEN_ROUTE: (ctx) => SplashScreen(),
            USER_SECTION_SCREEN_ROUTE: (_) => UserSection(),
            AUTH_SCREEN_ROUTE: (_) => AuthenticationScreen(),
            SIGN_UP_SCREEN_ROUTE: (_) => SignUpScreen(),
            PASSWORD_RESET_SCREEN_ROUTE: (_) => PasswordResetScreen(),
            PASSWORD_RESET_SENT_SCREEN_ROUTE: (_) => PasswordResetSentScreen(),
            EMAIL_VERIFICATION_UP_SCREEN_ROUTE: (_) => EmailVerificationScreen(),
            LINK_AUTH_PROVIDERS_SCREEN_ROUTE: (ctx) => LinkAuthProvidersScreen.fromArgs(_getArgs<LinkAuthProvidersScreenArgs>(ctx)),
            CREATE_CATEGORY_SCREEN_ROUTE: (_) => CreateCategoryScreen(),
            EDIT_CATEGORY_SCREEN_ROUTE: (ctx) => EditCategoryScreen.fromArgs(_getArgs<EditCategoryScreenArgs>(ctx)),
            EDIT_TECHNIQUE_SCREEN_ROUTE: (ctx) => EditTechniqueScreen.fromArgs(_getArgs<EditTechniqueScreenArgs>(ctx)),
            CREATE_TECHNIQUE_SCREEN_ROUTE: (_) => CreateTechniqueScreen(),
            CATEGORY_DETAIL_SCREEN_ROUTE: (ctx) => CategoryDetailScreen.fromArgs(_getArgs<CategoryDetailScreenArgs>(ctx)),
            CATEGORY_LOCALIZATION_ADD_SCREEN_ROUTE: (ctx) => CategoryLocalizationAddScreen.fromArgs(_getArgs<CategoryLocalizationAddScreenArgs>(ctx)),
            CATEGORY_LOCALIZATION_EDIT_SCREEN_ROUTE: (ctx) => CategoryLocalizationEditScreen.fromArgs(_getArgs<CategoryLocalizationEditScreenArgs>(ctx)),
            TECHNIQUE_LOCALIZATION_ADD_SCREEN_ROUTE: (ctx) => TechniqueLocalizationAddScreen.fromArgs(_getArgs<TechniqueLocalizationAddScreenArgs>(ctx)),
            TECHNIQUE_LOCALIZATION_EDIT_SCREEN_ROUTE: (ctx) => TechniqueLocalizationEditScreen.fromArgs(_getArgs<TechniqueLocalizationEditScreenArgs>(ctx)),
            TECHNIQUE_LIST_SCREEN_ROUTE: (ctx) => TechniqueListScreen(),
            VISIBLE_CATEGORIES_LIST_SCREEN_ROUTE: (_) => VisibleCategoriesListScreen(),
            HIDDEN_CATEGORIES_LIST_SCREEN_ROUTE: (_) => HiddenCategoriesListScreen(),
            VIDEO_FULL_SCREEN_SCREEN_ROUTE: (ctx) => VideoFullScreenModeScreen.fromArgs(_getArgs<VideoFullScreenModeScreenArgs>(ctx)),
            UPLOAD_FILES_SCREEN_ROUTE: (ctx) => UploadFilesScreen.fromArgs(_getArgs<UploadFilesScreenArgs>(ctx)),
            TECHNIQUE_DETAIL_SCREEN_ROUTE: (ctx) => TechniqueScreen.fromArgs(_getArgs<TechniqueScreenArgs>(ctx)),
          },
          initialRoute: SPLASH_SCREEN_ROUTE,
        ),
      ),
    );
  }
}
