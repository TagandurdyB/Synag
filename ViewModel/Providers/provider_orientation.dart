
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*class ProviderOrientation extends ChangeNotifier {
  Future<void> _setPortraitUp() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    notifyListeners();
  }

  void get setPortraitUp => _setPortraitUp();

  Future<void> _setLandscapeBouth() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      //DeviceOrientation.portraitUp,
    ]);
    notifyListeners();
  }

  void get setLandscape => _setLandscapeBouth();
} */

class MyOrientation {
  final BuildContext context;
  MyOrientation(this.context);
 
  static void systemUiOverlayStyle() async {
    setPortraitUp();
     SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
  }

  static void setPortraitUp() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  static void setLandscape() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      //DeviceOrientation.portraitUp,
    ]);
  }

}
