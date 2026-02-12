abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure() : super("خطأ من السيرفر");
}

class NetworkFailure extends Failure {
  const NetworkFailure({String? errorMessage})
    : super(errorMessage ?? "تحقق من الاتصال بالإنترنت");
}

class CacheFailure extends Failure {
  const CacheFailure({String? errorMessage})
    : super(errorMessage ?? "مشكلة في البيانات");
}
