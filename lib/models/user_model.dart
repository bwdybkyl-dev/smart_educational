enum UserRole { student, advisor, admin }

class UserModel {
  const UserModel({required this.id, required this.name, required this.email, required this.role, this.city = '', this.gpa = 0, this.interests = const <String>[], this.skills = const <String>[]});
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String city;
  final double gpa;
  final List<String> interests;
  final List<String> skills;
}

class AdvisorModel extends UserModel {
  const AdvisorModel({required super.id, required super.name, required super.email, required this.specialty, required this.experience, this.rating = 0}) : super(role: UserRole.advisor);
  final String specialty;
  final String experience;
  final double rating;
}
