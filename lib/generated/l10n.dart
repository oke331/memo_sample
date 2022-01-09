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

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `ON`
  String get on {
    return Intl.message(
      'ON',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `OFF`
  String get off {
    return Intl.message(
      'OFF',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `The acquisition process failed. Please try again.`
  String get failedToFetch {
    return Intl.message(
      'The acquisition process failed. Please try again.',
      name: 'failedToFetch',
      desc: '',
      args: [],
    );
  }

  /// `No data.`
  String get empty {
    return Intl.message(
      'No data.',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Memo Sample Application`
  String get appName {
    return Intl.message(
      'Memo Sample Application',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Memo Sample Application! Please sign in to continue.`
  String get signInDescription {
    return Intl.message(
      'Welcome to Memo Sample Application! Please sign in to continue.',
      name: 'signInDescription',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Memo Sample Application! Please create an account to continue.`
  String get registerDescription {
    return Intl.message(
      'Welcome to Memo Sample Application! Please create an account to continue.',
      name: 'registerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Memo list`
  String get memoListName {
    return Intl.message(
      'Memo list',
      name: 'memoListName',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get delete {
    return Intl.message(
      'delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to delete?`
  String get deleteMessage {
    return Intl.message(
      'Would you like to delete?',
      name: 'deleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Memo Detail`
  String get memoDetailName {
    return Intl.message(
      'Memo Detail',
      name: 'memoDetailName',
      desc: '',
      args: [],
    );
  }

  /// `Created at`
  String get createdAt {
    return Intl.message(
      'Created at',
      name: 'createdAt',
      desc: '',
      args: [],
    );
  }

  /// `Updated at`
  String get updatedAt {
    return Intl.message(
      'Updated at',
      name: 'updatedAt',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Create Memo`
  String get memoCreateName {
    return Intl.message(
      'Create Memo',
      name: 'memoCreateName',
      desc: '',
      args: [],
    );
  }

  /// `Edit Memo`
  String get memoEditName {
    return Intl.message(
      'Edit Memo',
      name: 'memoEditName',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Text`
  String get text {
    return Intl.message(
      'Text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Save succeeded!`
  String get saveMessage {
    return Intl.message(
      'Save succeeded!',
      name: 'saveMessage',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get settingName {
    return Intl.message(
      'Setting',
      name: 'settingName',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to log out?`
  String get logoutMessage {
    return Intl.message(
      'Would you like to log out?',
      name: 'logoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `Dart Theme Mode`
  String get themeModeName {
    return Intl.message(
      'Dart Theme Mode',
      name: 'themeModeName',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `System Theme`
  String get systemTheme {
    return Intl.message(
      'System Theme',
      name: 'systemTheme',
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
      Locale.fromSubtags(languageCode: 'ja'),
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
