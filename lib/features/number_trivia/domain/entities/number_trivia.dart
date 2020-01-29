import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NumberTrivia extends Equatable {
  @required
  final String text;
  @required
  final int number;

  NumberTrivia({this.text, this.number});

  @override
  List<Object> get props => [text, number];
}
