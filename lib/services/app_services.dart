import '../data/mock_data.dart';
import '../models/app_models.dart';
import 'recommendation_service.dart';
class AuthService { UserModel? currentUser; Future<UserModel?> login(String email,String password) async { if(email.contains('admin')) return currentUser=const AdminModel(id:'ad1',name:'مدير النظام',email:'admin@example.com'); if(email.contains('advisor')) return currentUser=MockData.advisors.first; return currentUser=MockData.student; } Future<void> logout() async=>currentUser=null; }
class QuizService { final RecommendationService recommendationService; const QuizService(this.recommendationService); List<RecommendationModel> submit(List<AssessmentAnswerModel> answers)=>recommendationService.recommend(student:MockData.student,questions:MockData.questions,answers:answers,majors:MockData.majors); }
class ConsultationService { List<ConsultationModel> get consultations=>MockData.consultations; void create({required String title,required String description})=>MockData.consultations.insert(0,ConsultationModel(id:DateTime.now().microsecondsSinceEpoch.toString(),title:title,description:description,status:ConsultationStatus.pending,createdAt:DateTime.now(),studentName:MockData.student.name)); }
class AppointmentService { List<AppointmentModel> get appointments=>MockData.appointments; void book(AppointmentModel appointment)=>MockData.appointments.insert(0,appointment); }
class NotificationService { List<NotificationModel> get notifications=>MockData.notifications; }
class SearchService { List<T> filter<T>(List<T> values,String query,String Function(T) label)=>query.isEmpty?values:values.where((v)=>label(v).contains(query)).toList(); }
class StorageService { bool onboardingSeen=false; bool darkMode=false; }
