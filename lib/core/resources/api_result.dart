import 'package:dio/dio.dart';

abstract class APIResult<T> {
  final bool ? loading;
  final T ? data;
  final DioException ? exception;

  const APIResult({this.loading, this.data, this.exception});
}
//Loading Data : True/False
class Loading<T> extends APIResult<T> {
  const Loading(bool loading) : super(loading: loading);
}

//Success : Dynamic
class Success<T> extends APIResult<T> {
  const Success(T data) : super(data: data);
}

//Failed : Exception
class Failure<T> extends APIResult<T> {
  const Failure(DioException exception) : super(exception : exception);
}