import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internationalization/localization/global_localization.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final GlobalLocalizations localizations;

  LocalizationBloc(this.localizations);

  @override
  get initialState => LocalizationInitS(localizations.locale);

  @override
  Stream<LocalizationState> mapEventToState(event) async* {
    if (event is LocalizationChangeLocalizationE) {
      await localizations.setNewLanguage(event.lang);
      yield LocalizationLocalizeS(localizations.locale);
    }
  }
}

//
// LocalizationBloc States
//
abstract class LocalizationState extends Equatable {
  final Locale locale;
  const LocalizationState(this.locale);

  @override
  List<Object> get props => [locale];
}

class LocalizationInitS extends LocalizationState {
  LocalizationInitS(Locale locale) : super(locale);
}

class LocalizationLocalizeS extends LocalizationState {
  LocalizationLocalizeS(Locale locale) : super(locale);
}

//
// LocalizationBloc Events
//
abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class LocalizationChangeLocalizationE extends LocalizationEvent {
  final String lang;

  LocalizationChangeLocalizationE(this.lang);

  @override
  List<Object> get props => [lang];
}
