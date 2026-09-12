abstract final class AppValidators {
  static String? requiredField(String? value) => value == null || value.trim().isEmpty ? 'هذا الحقل مطلوب.' : null;
  static String? email(String? value) => value == null || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value) ? 'البريد الإلكتروني غير صحيح.' : null;
  static String? password(String? value) => value == null || value.length < 6 ? 'كلمة المرور يجب أن تتكون من 6 أحرف على الأقل.' : null;
}
