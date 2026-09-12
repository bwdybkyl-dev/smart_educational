import '../models/app_models.dart';
class RecommendationService {
 const RecommendationService();
 List<RecommendationModel> recommend({required StudentModel student,required List<QuestionModel> questions,required List<AssessmentAnswerModel> answers,required List<MajorModel> majors}) {
  final response={for(final answer in answers) answer.questionId:answer.value};
  return majors.map((major) { double earned=0, possible=0; final reasons=<String>[];
   for(final question in questions.where((q)=>q.relatedMajors.contains(major.id))) { final answer=response[question.id]??0; earned+=answer*question.weight; possible+=5*question.weight; if(answer>=4) reasons.add('إجابتك القوية في ${question.category} تدعم هذا المسار.'); }
   final matched=major.requiredSkills.where(student.skills.contains).toList(); final missing=major.requiredSkills.where((skill)=>!student.skills.contains(skill)).toList();
   final interestMatches=major.relatedInterests.where(student.interests.contains).length;
   final quizScore=possible==0?0:earned/possible*65; final skillsScore=major.requiredSkills.isEmpty?0:matched.length/major.requiredSkills.length*20; final interestScore=major.relatedInterests.isEmpty?0:interestMatches/major.relatedInterests.length*12; final gpaScore=student.gpa>=4?3:student.gpa>=3?2:1;
   if(matched.isNotEmpty) reasons.add('تمتلك مهارات متوافقة: ${matched.join('، ')}.'); if(interestMatches>0) reasons.add('اهتماماتك مرتبطة مباشرة بهذا التخصص.'); if(missing.isNotEmpty) reasons.add('طوّر ${missing.join('، ')} لتعزيز جاهزيتك.');
   return RecommendationModel(major:major,score:(quizScore+skillsScore+interestScore+gpaScore).clamp(0,100),reasons:reasons,matchedSkills:matched,missingSkills:missing);
  }).toList()..sort((a,b)=>b.score.compareTo(a.score));
 }
}
