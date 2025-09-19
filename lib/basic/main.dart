import 'package:flutter/material.dart';
import 'package:hmyh_flutter_localization/basic/locale_provider.dart';
import 'package:hmyh_flutter_localization/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main(List<String> args){
  runApp(const App());
}

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ],
      builder: (context,child){
          final locale = context.select<LocaleProvider,Locale>(
              (localeProvider) => localeProvider.locale
          );

          return MaterialApp(
            locale: locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: const HomePage(),
          );
      },
    );
  }
}

class HomePage extends StatelessWidget{
  final _emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}