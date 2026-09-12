import 'major_model.dart';

class RecommendationModel {
  const RecommendationModel({required this.major, required this.score, required this.reasons, required this.matchedSkills, required this.missingSkills});
  final MajorModel major;
  final double score;
  final List<String> reasons;
  final List<String> matchedSkills;
  final List<String> missingSkills;
  String get level {
    if (score >= 80) return 'مناسب جداً';
    if (score >= 65) return 'مناسب';
    if (score >= 45) return 'مناسب إلى حد ما';
    return 'يحتاج إلى تطوير';
  }
}
