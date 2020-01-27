import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class NumberTrivia extends Equatable {
  @required
  final String text;

  @required
  final int number;

  NumberTrivia({this.text, this.number}) : super([text, number]);
}
