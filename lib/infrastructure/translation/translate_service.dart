import 'package:animal_trivia/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class TranslateService {
  final Dio client;

  TranslateService(this.client);

  Future<Either<Failure, List<String>>> translate(List<String> strings,
      {required String from, required String to}) async {
    try {
      final response = await client.get(
          "https://translate.googleapis.com/translate_a/single",
          queryParameters: {
            'client': 'gtx',
            'sl': from,
            'tl': to,
            'dt': 't',
            'q': strings.join('#')
          });
      final String data = response.data[0][0][0];

      return right(data.split('#'));
    } on DioError catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
