import '../utils/enum.dart';

class DataState<T> {
  T? data;
  DataStateType? type;
  String? message;

  DataState.data({this.data}) : type = DataStateType.data;

  DataState.error({this.message}) : type = DataStateType.error;

  DataState.idle() : type = DataStateType.idle;

  DataState.loading() : type = DataStateType.loading;
}