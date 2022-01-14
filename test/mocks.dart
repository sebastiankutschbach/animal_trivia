import 'package:animal_trivia/application/quiz_page/quiz_page_bloc.dart';
import 'package:animal_trivia/application/trivia_page/trivia_page_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

class MockTriviaPageBloc extends MockBloc<TriviaPageEvent, TriviaPageState>
    implements TriviaPageBloc {}

class MockQuizPageBloc extends MockBloc<QuizPageEvent, QuizPageState>
    implements QuizPageBloc {}
