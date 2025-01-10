import 'package:delishop/core/data/api_consts.dart';

import 'model/domain_error_model.dart';

sealed class ResponseResult<T> {
  const ResponseResult();

  R when<R>({
    required R Function(T successData) onSuccess,
    required R Function(DomainErrorModel domainErrorModel) onError,
  }) {
    switch (this) {
      case Success<T> _:
        return onSuccess((this as Success<T>).data);
      case Error<T> _:
        return onError((this as Error<T>).data);
    }
  }
}

class Success<T> extends ResponseResult<T> {
  final T data;

  const Success(this.data);
}

class Error<T> extends ResponseResult<T> {
  final DomainErrorModel data;

  const Error(this.data);
}
