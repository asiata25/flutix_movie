import 'package:equatable/equatable.dart';

abstract class DataState<T> extends Equatable {
  final T? data;
  final Exception? error;

  const DataState({this.data, this.error});

  @override
  List<Object?> get props => [data, error];
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(Exception error) : super(error: error);
}
