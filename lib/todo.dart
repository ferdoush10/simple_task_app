// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  String details;
  DateTime createdDateTime, updatedDateTime;
  String status;
  Todo({
    required this.details,
    required this.createdDateTime,
    required this.updatedDateTime,
    this.status = 'pending',
  });
}
