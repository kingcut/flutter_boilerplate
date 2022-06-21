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

  /// `Chào`
  String get helloWorld {
    return Intl.message(
      'Chào',
      name: 'helloWorld',
      desc: 'Chào Nhá',
      args: [],
    );
  }

  /// `Hãy thay đổi cuộc sống của bạn! Ngay bây giờ!`
  String get welcome_title {
    return Intl.message(
      'Hãy thay đổi cuộc sống của bạn! Ngay bây giờ!',
      name: 'welcome_title',
      desc: '',
      args: [],
    );
  }

  /// `Chào mừng bạn đến với Life Plan, nơi mà bạn có thể lên kế hoạch cho hành trình phía trước.`
  String get welcome_description {
    return Intl.message(
      'Chào mừng bạn đến với Life Plan, nơi mà bạn có thể lên kế hoạch cho hành trình phía trước.',
      name: 'welcome_description',
      desc: '',
      args: [],
    );
  }

  /// `Bắt đầu`
  String get start {
    return Intl.message(
      'Bắt đầu',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đã có tài khoản?`
  String get already_account {
    return Intl.message(
      'Bạn đã có tài khoản?',
      name: 'already_account',
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
      Locale.fromSubtags(languageCode: 'vn'),
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
