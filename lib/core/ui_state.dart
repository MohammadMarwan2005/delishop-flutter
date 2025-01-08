import 'package:equatable/equatable.dart';

import 'data/model/domain_error_model.dart';

class UIState<T> extends Equatable {
  final bool? initial;
  final bool? isLoading;
  final T? data;
  final DomainErrorModel? error;

  const UIState({this.isLoading, this.data, this.error, this.initial});

  @override
  List<Object?> get props => [isLoading, data, error, initial];

  UIState<T> copyWith({
    bool? initial,
    bool? isLoading,
    T? dataList,
    DomainErrorModel? error,
  }) {
    return UIState<T>(
      initial: initial,
      isLoading: isLoading,
      data: dataList,
      error: error,
    );
  }

  R when<R>({
    required R Function() onLoading,
    R Function()? onInitial,
    required R Function(T data) onSuccess,
    required R Function(DomainErrorModel domainError) onError,
  }) {
    if (initial != null && onInitial != null) {
      return onInitial();
    }
    if (isLoading != null) {
      return onLoading();
    }
    if (data != null) {
      return onSuccess(data!);
    }
    if (error != null) {
      return onError(error!);
    }
    return onError(DomainErrorModel(message: "message", code: 404));
  }
}
