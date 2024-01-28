import 'package:sleep_clock_app/enums.dart';

class MenuInfo {
  MenuType menuType;
  String title;
  String imageSource;

  MenuInfo(this.title, this.imageSource, {required this.menuType});
}