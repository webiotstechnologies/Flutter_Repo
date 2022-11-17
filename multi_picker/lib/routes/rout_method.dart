import 'package:multi_picker/config.dart';


RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.homeScreen, page: () =>   HomeScreen()),
    GetPage(name: _routeName.imageScreen, page: () =>   ImageScreen()),
    GetPage(name: _routeName.videoScreen, page: () =>   VideoScreen()),
    GetPage(name: _routeName.audioScreen, page: () =>   const AudioScreen()),
    GetPage(name: _routeName.recordingScreen, page: () =>   const RecordingScreen()),

  ];
}
