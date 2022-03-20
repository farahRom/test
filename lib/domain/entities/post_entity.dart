import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostEntity({this.userId, this.id, this.title, this.body});

  @override
  // TODO: implement props
  List<Object?> get props => [userId, id, title, body];
}
