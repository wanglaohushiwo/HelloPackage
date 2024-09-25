import 'package:multiple_localization/multiple_localization.dart';

import '../generated/intl/messages_all.dart';
import '../generated/l10n.dart';
import 'package:flutter/material.dart';
class WT_S {
  static S? _current;

  static S get current {
    assert(_current != null,
    'No instance of CustomLocalization was loaded. Try to initialize before accessing.');
    return _current!;
  }

  static Future<S> load(Locale locale) {
    return MultipleLocalizations.load(initializeMessages, locale, (l) {
      final instance = S();  // 这里依然使用生成的 S 类
      _current = instance;   // 使用包装类中的 _current 代替 S._current
      return instance;
    }, setDefaultLocale: true);
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();
}