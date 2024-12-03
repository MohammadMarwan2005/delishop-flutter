import 'package:equatable/equatable.dart';

import '../../core/data/model/domain_error_model.dart';

class HomeListState<T> extends Equatable {
  final bool? isLoading;
  final List<T>? dataList;
  final DomainErrorModel? error;

  const HomeListState({this.isLoading, this.dataList, this.error});

  @override
  List<Object?> get props => [isLoading, dataList, error];

  HomeListState<T> copyWith({
    bool? isLoading,
    List<T>? dataList,
    DomainErrorModel? error,
  }) {
    return HomeListState<T>(
      isLoading: isLoading,
      dataList: dataList,
      error: error,
    );
  }

  R when<R>(
      {required R Function() onLoading,
      required R Function(List<T> dataList) onSuccess,
      required R Function(DomainErrorModel domainError) onError}) {
    if (isLoading != null) {
      return onLoading();
    }
    if (dataList != null) {
      return onSuccess(dataList!);
    }
    if (error != null) {
      return onError(error!);
    }
    return onError(error!);
  }
}
