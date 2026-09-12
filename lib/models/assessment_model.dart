class QuestionOptionModel {
  const QuestionOptionModel({required this.label, required this.value});
  final String label;
  final int value;
}

class QuestionModel {
  const QuestionModel({required this.id, required this.text, required this.category, required this.weight, required this.majorIds, required this.options});
  final String id;
  final String text;
  final String category;
  final int weight;
  final List<String> majorIds;
  final List<QuestionOptionModel> options;
}

class AssessmentAnswerModel {
  const AssessmentAnswerModel({required this.questionId, required this.value});
  final String questionId;
  final int value;
}
