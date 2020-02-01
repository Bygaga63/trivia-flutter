import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();
}

class Empty extends NumberTriviaState {
  @override
  List<Object> get props => [];
}

class Loading extends NumberTriviaState {
  @override
  List<Object> get props => [];
}

class Loaded extends NumberTriviaState {
  @required
  final NumberTrivia trivia;

  Loaded(this.trivia);

  @override
  List<Object> get props => [this.trivia];
}

class Error extends NumberTriviaState {
  @required
  final String message;

  Error(this.message);

  @override
  List<Object> get props => [this.message];
}
