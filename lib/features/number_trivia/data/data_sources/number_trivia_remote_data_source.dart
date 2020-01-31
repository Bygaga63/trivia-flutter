import 'dart:convert';

import 'package:clean_architecture_tdd/core/error/exceptions.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class NumberTriviaRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) {}

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() {}
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  @required
  final http.Client client;
  final String url = 'http://numbersapi.com';

  NumberTriviaRemoteDataSourceImpl({this.client});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
      _getTriviaFromUrl('$url/$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() =>
      _getTriviaFromUrl('$url/random');

  Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
    final response =
        await client.get(url, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
