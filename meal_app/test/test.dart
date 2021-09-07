import 'package:meal_app/main.dart';
import 'package:test/test.dart';

void main() {
  MyApp newApp = MyApp();
  group('Testing App Provider', () {
    test('A new item should be added', () {
      var id = 'm3';
      var a = newApp.isMealFavourite(id);
      print(a);
      expect(a, false);
    });
  });
}
