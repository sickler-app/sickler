import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? message;
  final String? code;

  const Failure({this.message = "An error has occurred", this.code});
  const Failure.generic({this.message = "An error has occurred", this.code});
  const Failure.firebase({this.message = "An error has occurred", this.code});
  const Failure.network({this.message = "An error has occurred", this.code});
  const Failure.storage({this.message = "An error has occurred", this.code});

  @override
  List<Object?> get props => [message, code];
}
