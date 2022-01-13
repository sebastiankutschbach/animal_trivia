part of 'trivia_page_bloc.dart';

@freezed
class TriviaPageEvent with _$TriviaPageEvent {
  const factory TriviaPageEvent.randomAnimalRequested() = RandomAnimalRequested;
}
