import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/features/admin/presentation/screens/admin_menu_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_list_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_localization_add_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_localization_edit_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/create_category_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/create_technique_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/upload_files_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/link_auth_providers_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/password_reset_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/password_reset_sent_screen.dart';
import 'package:jews_harp/features/techniques/presentation/screens/technique_list_screen.dart';
import 'package:jews_harp/features/techniques/presentation/screens/video_full_screen_mode_screen.dart';

import 'core/constants/routes.dart';
import 'core/constants/settings.dart';
import 'core/dependency_injection/service_locator.dart';
import 'core/l10n.dart';
import 'features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'features/auth/presentation/screens/authentication_screen.dart';
import 'features/auth/presentation/screens/email_verification_screen.dart';
import 'features/auth/presentation/screens/sign_up_screen.dart';
import 'features/auth/presentation/screens/splash_screen.dart';

/// Driver function
Future<void> main() async {
  // Initialize dependencies
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey();

  void _authBlocListener(BuildContext context, AuthState state) {
    final currentState = navigatorKey.currentState!;

    if (state is AuthenticatedState) {
      currentState.pushNamedAndRemoveUntil(HOME_SCREEN_ROUTE, (route) => false);
    } else if (state is UnauthenticatedState)
      currentState.pushNamedAndRemoveUntil(AUTH_SCREEN_ROUTE, (route) => false);
    else if (state is NotVerifiedState)
      currentState.pushNamedAndRemoveUntil(
        EMAIL_VERIFICATION_UP_SCREEN_ROUTE,
        (route) => false,
        arguments: EmailVerificationScreenArgs(user: state.user),
      );
  }

  T _getArgs<T>(ctx) => ModalRoute.of(ctx)!.settings.arguments as T;

  /// Display splash screen for [Constants.SPLASH_SCREEN_DURATION] and then check for check if user is signed in.
  /// Redirect the user into the authentication screen if user is not signed in.
  /// Otherwise, redirect the user into the main screen.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => serviceLocator<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: _authBlocListener,
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
          navigatorKey: navigatorKey,
          routes: {
            SPLASH_SCREEN_ROUTE: (ctx) => SplashScreen(onLoad: () => BlocProvider.of<AuthBloc>(ctx).add(SplashScreenDisplayedEvent(AppLocalizations.of(ctx).locale.languageCode))),
            HOME_SCREEN_ROUTE: (_) => TechniqueListScreen(),
            AUTH_SCREEN_ROUTE: (_) => AuthenticationScreen(),
            SIGN_UP_SCREEN_ROUTE: (_) => SignUpScreen(),
            PASSWORD_RESET_SCREEN_ROUTE: (_) => PasswordResetScreen(),
            PASSWORD_RESET_SENT_SCREEN_ROUTE: (_) => PasswordResetSentScreen(),
            EMAIL_VERIFICATION_UP_SCREEN_ROUTE: (ctx) => EmailVerificationScreen.fromArgs(_getArgs<EmailVerificationScreenArgs>(ctx)),
            LINK_AUTH_PROVIDERS_SCREEN_ROUTE: (ctx) => LinkAuthProvidersScreen.fromArgs(_getArgs<LinkAuthProvidersScreenArgs>(ctx)),
            ADMIN_MENU_SCREEN_ROUTE: (_) => AdminMenuScreen(),
            CREATE_CATEGORY_SCREEN_ROUTE: (_) => CreateCategoryScreen(),
            CREATE_TECHNIQUE_SCREEN_ROUTE: (_) => CreateTechniqueScreen(),
            CATEGORY_LOCALIZATION_ADD_SCREEN_ROUTE: (ctx) => CategoryLocalizationAddScreen.fromArgs(_getArgs<CategoryLocalizationAddScreenArgs>(ctx)),
            CATEGORY_LOCALIZATION_EDIT_SCREEN_ROUTE: (ctx) => CategoryLocalizationEditScreen.fromArgs(_getArgs<CategoryLocalizationEditScreenArgs>(ctx)),
            VISIBLE_CATEGORIES_LIST_SCREEN_ROUTE: (ctx) => CategoryListScreen.fromArgs(_getArgs<CategoryListScreenArgs>(ctx)),
            HIDDEN_CATEGORIES_LIST_SCREEN_ROUTE: (ctx) => CategoryListScreen.fromArgs(_getArgs<CategoryListScreenArgs>(ctx)),
            VIDEO_FULL_SCREEN_SCREEN_ROUTE: (ctx) => VideoFullScreenModeScreen.fromArgs(_getArgs<VideoFullScreenModeScreenArgs>(ctx)),
            UPLOAD_FILES_SCREEN_ROUTE: (ctx) => UploadFilesScreen.fromArgs(_getArgs<UploadFilesScreenArgs>(ctx)),
          },
          initialRoute: SPLASH_SCREEN_ROUTE,
        ),
      ),
    );
  }
}
