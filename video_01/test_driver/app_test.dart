import 'package:flutter_driver/flutter_driver.dart';
import 'package:test_api/test_api.dart';

void main() {
  group('App', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if(driver != null) {
        driver.close();
      }
    });
  });
}