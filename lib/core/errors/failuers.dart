abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure() : super("خطأ من السيرفر");
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super("تحقق من الانترنت");
}

class CacheFailure extends Failure {
  const CacheFailure({String? errorMessage})
    : super(errorMessage ?? "مشكلة في البيانات");
}
