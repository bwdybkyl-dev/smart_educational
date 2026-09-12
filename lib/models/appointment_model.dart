class AppointmentModel {
  const AppointmentModel({required this.id, required this.advisorName, required this.date, required this.reason, required this.status});
  final String id;
  final String advisorName;
  final DateTime date;
  final String reason;
  final String status;
}
