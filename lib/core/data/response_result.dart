
import 'domain_error_model.dart';

sealed class ResponseResult<T> {
  const ResponseResult();
}

class Success<T> extends ResponseResult<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends ResponseResult<T> {
  final DomainErrorModel data;

  const Error(this.data);
}

extension ApiResultHandler<T> on ResponseResult<T> {
  void when({
    required Function(T successData) onSuccess,
    required Function(DomainErrorModel domainErrorModel) onError,
  }) {
    switch (this) {
      case Success<T> _:
        onSuccess((this as Success<T>).data);
      case Error<T> _:
        onError((this as Error<T>).data);
    }
  }
}
