import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'Fabrics/AndroidFabric.dart';
import 'Fabrics/IFabric.dart';
import 'Fabrics/WebFabric.dart';
import 'Fabrics/WindowsFabric.dart';

class Configurator {
  static final Configurator _instance = new Configurator._internal();

  factory Configurator() {
    return _instance;
  }

  Configurator._internal();

  PlatformType _checkPlathorm() {
    if (kIsWeb) {
      return PlatformType.Web;
    } else if (Platform.isAndroid) {
      return PlatformType.Android;
    } else if (Platform.isWindows) {
      return PlatformType.Windows;
    } else {
      return PlatformType.None;
    }
  }

  IFabric getFabric() {
    switch (_checkPlathorm()) {
      case PlatformType.Web:
        return WebFabric();
      case PlatformType.Windows:
        return WindowsFabric();
      case PlatformType.Android:
        return AndroidFabric();
        break;

      case PlatformType.None:
      default:
        throw ("Not app OS.");
    }
  }
}

enum PlatformType { None, Windows, Web, Android }
