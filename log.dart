import 'package:flutter/foundation.dart';

class Log {
  static const String _reset = '\u001b[0m';
  static const String _red = '\u001b[1;31m';
  static const String _green = '\u001b[1;32m';
  static const String _yellow = '\u001b[1;33m';
  static const String _blue = '\u001b[1;34m';
  static const String _purple = '\u001b[1;35m';
  static const String _cyan = '\u001b[1;36m';

  static const String _topLeftCorner = '┌';
  static const String _bottomLeftCorner = '└';
  static const String _middleCorner = '├';
  static const String _verticalLine = '│';
  static const String _doubleDivider = '━';
  static const String _singleDivider = '─';

  static void log(String message,
      {LogLevel level = LogLevel.info, String? tag}) {
    if (kDebugMode) {
      final color = _getColorForLevel(level);
      final title = _getTitleForLevel(level);
      final timestamp = DateTime.now().toString().split('.').first;
      final tagString = tag != null ? '[$tag] ' : '';

      debugPrint('''
                $color$_topLeftCorner${_doubleDivider * 50}
                $color$_verticalLine $timestamp | $title${tag != null ? ' | $tag' : ''}
                $color$_middleCorner${_singleDivider * 50}
                $color$_verticalLine $tagString$message
                $color$_bottomLeftCorner${_doubleDivider * 50}$_reset
                ''');
    }
  }

  static String _getColorForLevel(LogLevel level) {
    switch (level) {
      case LogLevel.info:
        return _green;
      case LogLevel.warning:
        return _yellow;
      case LogLevel.error:
        return _red;
      case LogLevel.debug:
        return _blue;
      case LogLevel.verbose:
        return _purple;
      case LogLevel.wtf:
        return _cyan;
    }
  }

  static String _getTitleForLevel(LogLevel level) {
    return level.toString().toUpperCase().split('.').last;
  }
}

enum LogLevel {
  info,
  warning,
  error,
  debug,
  verbose,
  wtf,
}
