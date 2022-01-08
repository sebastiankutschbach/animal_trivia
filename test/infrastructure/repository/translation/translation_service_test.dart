import 'package:animal_trivia/infrastructure/translation/translate_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('translates just fine', () async {
    final result = await TranslateService(Dio())
        .translate(['dog', 'cat', 'mouse'], from: 'en', to: 'de');
    expect(result.isLeft(), false);
    expect(result.isRight(), true);
    expect(result.fold((l) => null, (r) => r), ['Hund', 'Katze', 'Maus']);
  });
}
