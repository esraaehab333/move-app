import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMsg;
  final bool success;

  const ErrorMessageModel(
      {required this.statusCode,
      required this.statusMsg,
      required this.success});

  factory ErrorMessageModel.fromjson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        statusCode: json["status_code"],
        statusMsg: json["status_message"],
        success: json["success"],
      );

  @override
  List<Object?> get props => [
        statusCode,
        statusMsg,
        success,
      ];
}
