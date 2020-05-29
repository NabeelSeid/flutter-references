import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:internationalization/blocs/localization_bloc.dart';

import 'package:internationalization/localization/global_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await allTranslations.init();

  runApp(BlocProvider<LocalizationBloc>(
    create: (_) => LocalizationBloc(allTranslations),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (_, state) {
        return MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: allTranslations.supportedLocales(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          locale: state.locale ?? allTranslations.locale,
          home: HomePage(),
          title: allTranslations.title,
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalizationBloc localizationBloc =
        BlocProvider.of<LocalizationBloc>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(allTranslations.bodyText),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: Text('English'),
                onPressed: () =>
                    localizationBloc.add(LocalizationChangeLocalizationE('en')),
              ),
              RaisedButton(
                child: Text('አማርኛ'),
                onPressed: () =>
                    localizationBloc.add(LocalizationChangeLocalizationE('am')),
              ),
              Builder(
                builder: (context) {
                  return RaisedButton(
                    child: Text('Alert'),
                    onPressed: () {
                      showAboutDialog(context: context);
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
