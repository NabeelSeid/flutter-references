# internationalization reference

## Steps
* set up flutter_localization package in pubspec.yaml
* set up localizationDelegates and supportedLocales
* create AppLocalization class for loading and lookup object of localized values
* implement LocalizationDelegate to expose AppLocalization to MaterialApp 
* generate intl_messages.arb ```flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/locale/locales.dart```
* duplicate intl_messages.arb for every supported locale with corrsponding locale values in duplicate
* generate dart code from arb files ```flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/intl_es.arb lib/l10n/intl_en.arb lib/l10n/intl_messages.arb lib/l10n/intl_am.arb lib/locale/locales.dart```
* import message_add.dart file in AppLocalization file 
* add AppLocalizationDelegate in MaterialApp
* [optional] use onGenerateTitle on MaterialApp
* ```AppLocalization.of(context).lookup``` to access localized values