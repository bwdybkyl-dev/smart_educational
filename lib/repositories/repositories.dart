import '../models/app_models.dart';
abstract class AuthRepository { Future<UserModel?> signIn(String email,String password); Future<UserModel> register(Map<String,String> data); Future<void> signOut(); }
abstract class UserRepository { Future<UserModel> getById(String id); Future<void> update(UserModel user); }
abstract class MajorRepository { Future<List<MajorModel>> getMajors(); Future<MajorModel?> getMajor(String id); }
abstract class SkillRepository { Future<List<SkillModel>> getSkills(); }
abstract class QuestionRepository { Future<List<QuestionModel>> getQuestions(); }
abstract class AssessmentRepository { Future<void> saveResult(AssessmentResultModel result); Future<List<AssessmentResultModel>> resultsFor(String studentId); }
abstract class RecommendationRepository { Future<List<RecommendationModel>> getForStudent(String studentId); }
abstract class ConsultationRepository { Future<List<ConsultationModel>> getAll(); Future<void> create(ConsultationModel consultation); Future<void> updateStatus(String id, ConsultationStatus status); }
abstract class MessageRepository { Future<List<MessageModel>> getMessages(String consultationId); Future<void> send(MessageModel message); }
abstract class AppointmentRepository { Future<List<AppointmentModel>> getAll(); Future<void> book(AppointmentModel appointment); }
abstract class AdvisorRepository { Future<List<AdvisorModel>> getAdvisors(); }
abstract class NotificationRepository { Future<List<NotificationModel>> getAll(); }
abstract class RatingRepository { Future<List<RatingModel>> getAll(); }
