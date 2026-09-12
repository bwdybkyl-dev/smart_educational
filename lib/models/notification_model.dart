class NotificationModel {
  const NotificationModel({required this.id, required this.title, required this.body, required this.category, required this.createdAt, this.isRead = false});
  final String id;
  final String title;
  final String body;
  final String category;
  final DateTime createdAt;
  final bool isRead;
  NotificationModel copyWith({bool? isRead}) => NotificationModel(id: id, title: title, body: body, category: category, createdAt: createdAt, isRead: isRead ?? this.isRead);
}
