import 'package:equatable/equatable.dart';

abstract class DataState<T> extends Equatable {
  final T? data;
  final String? errorMessage;

  const DataState({this.data, this.errorMessage});

  @override
  List<Object?> get props => [data, errorMessage];
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(String message) : super(errorMessage: message);
}
