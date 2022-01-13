import 'package:animal_trivia/application/animal/trivia_page_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

class MockTriviaPageBloc extends MockBloc<TriviaPageEvent, TriviaPageState>
    implements TriviaPageBloc {}
