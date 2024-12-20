
import 'package:equatable/equatable.dart';

import 'data/model/domain_error_model.dart';

class UIState<T> extends Equatable {
  final bool? isLoading;
  final T? data;
  final DomainErrorModel? error;

  const UIState({this.isLoading, this.data, this.error});

  @override
  List<Object?> get props => [isLoading, data, error];

  UIState<T> copyWith({
    bool? isLoading,
    T? dataList,
    DomainErrorModel? error,
  }) {
    return UIState<T>(
      isLoading: isLoading,
      data: dataList,
      error: error,
    );
  }

  R when<R>(
      {required R Function() onLoading,
        required R Function(T data) onSuccess,
        required R Function(DomainErrorModel domainError) onError}) {
    if (isLoading != null) {
      return onLoading();
    }
    if (data != null) {
      return onSuccess(data!);
    }
    if (error != null) {
      return onError(error!);
    }
    return onError(error!);
  }
}
