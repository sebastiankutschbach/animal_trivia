import 'package:animal_trivia/application/quiz_page/quiz_page_bloc.dart';
import 'package:animal_trivia/application/trivia_page/trivia_page_bloc.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:animal_trivia/infrastructure/translation/translate_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTriviaPageBloc extends MockBloc<TriviaPageEvent, TriviaPageState>
    implements TriviaPageBloc {}

class MockQuizPageBloc extends MockBloc<QuizPageEvent, QuizPageState>
    implements QuizPageBloc {}

class MockIAnimalRepository extends Mock implements IAnimalRepository {}

class MockTranslateService extends Mock implements TranslateService {}
