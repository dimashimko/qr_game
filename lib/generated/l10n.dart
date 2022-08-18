// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Active games:`
  String get name_game {
    return Intl.message(
      'Active games:',
      name: 'name_game',
      desc: '',
      args: [],
    );
  }

  /// `Active games width scanner:`
  String get activity_games_with_scanner {
    return Intl.message(
      'Active games width scanner:',
      name: 'activity_games_with_scanner',
      desc: '',
      args: [],
    );
  }

  /// `Quest - Find the numbers`
  String get game_qr_quest {
    return Intl.message(
      'Quest - Find the numbers',
      name: 'game_qr_quest',
      desc: '',
      args: [],
    );
  }

  /// `NumericalQuest (in developing)`
  String get game_numerical_quest {
    return Intl.message(
      'NumericalQuest (in developing)',
      name: 'game_numerical_quest',
      desc: '',
      args: [],
    );
  }

  /// `CaptureTheFlag (in developing)`
  String get capture_the_flag {
    return Intl.message(
      'CaptureTheFlag (in developing)',
      name: 'capture_the_flag',
      desc: '',
      args: [],
    );
  }

  /// `Continue game`
  String get continue_game {
    return Intl.message(
      'Continue game',
      name: 'continue_game',
      desc: '',
      args: [],
    );
  }

  /// `New game`
  String get new_game {
    return Intl.message(
      'New game',
      name: 'new_game',
      desc: '',
      args: [],
    );
  }

  /// `Number of QrCodes:`
  String get number_of_qr_codes {
    return Intl.message(
      'Number of QrCodes:',
      name: 'number_of_qr_codes',
      desc: '',
      args: [],
    );
  }

  /// `Range of QrCodes:`
  String get range_of_codes {
    return Intl.message(
      'Range of QrCodes:',
      name: 'range_of_codes',
      desc: '',
      args: [],
    );
  }

  /// `List Of Qr  Found:`
  String get list_of_qr_found {
    return Intl.message(
      'List Of Qr  Found:',
      name: 'list_of_qr_found',
      desc: '',
      args: [],
    );
  }

  /// `Found:`
  String get found {
    return Intl.message(
      'Found:',
      name: 'found',
      desc: '',
      args: [],
    );
  }

  /// `Find:`
  String get find {
    return Intl.message(
      'Find:',
      name: 'find',
      desc: '',
      args: [],
    );
  }

  /// `Ok:`
  String get ok {
    return Intl.message(
      'Ok:',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation:`
  String get congratulation {
    return Intl.message(
      'Congratulation:',
      name: 'congratulation',
      desc: '',
      args: [],
    );
  }

  /// `Quest finished!!!`
  String get quest_finished {
    return Intl.message(
      'Quest finished!!!',
      name: 'quest_finished',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
