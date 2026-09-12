import 'package:flutter/material.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/consultations/presentation/screens/call_history_screen.dart';
import '../features/consultations/presentation/screens/call_screen.dart';
import '../features/consultations/presentation/screens/chat_screen.dart';
import '../features/consultations/presentation/screens/consultation_history_screen.dart';
import '../features/consultations/presentation/screens/consultations_screen.dart';
import '../features/consultations/presentation/screens/instant_consultation_screen.dart';
import '../features/majors/presentation/screens/majors_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/onboarding/presentation/screens/splash_screen.dart';
import '../features/student/presentation/screens/student_home_screen.dart';
class AppRouter { static Route<dynamic> onGenerateRoute(RouteSettings settings) { Widget page; switch (settings.name) { case '/splash': page = const SplashScreen(); break; case '/onboarding': page = const OnboardingScreen(); break; case '/login': page = const LoginScreen(); break; case '/student/home': page = const StudentHomeScreen(); break; case '/majors': page = const MajorsScreen(); break; case '/consultations': page = const ConsultationsScreen(); break; case '/consultations/chat': page = ChatScreen(consultationId: settings.arguments is String ? settings.arguments! as String : 'c1'); break; case '/consultations/instant': page = const InstantConsultationScreen(); break; case '/consultations/call': page = const CallScreen(); break; case '/consultations/history': page = const ConsultationHistoryScreen(); break; case '/consultations/calls': page = const CallHistoryScreen(); break; default: page = const StudentHomeScreen(); } return MaterialPageRoute<dynamic>(builder: (BuildContext context) => page, settings: settings); } }
