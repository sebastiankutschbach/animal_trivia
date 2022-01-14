part of 'quiz_page_bloc.dart';

@freezed
class QuizPageEvent with _$QuizPageEvent {
  const factory QuizPageEvent.randomAnimalsRequested() = RandomAnimalsRequested;
}
