class ValidationData {
  static String? validateName(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'اكتب الاسم';
    if (v.length < 3) return 'الاسم لازم يكون 3 حروف على الأقل';

    final ok = RegExp(r"^[\p{L}\s'.-]+$", unicode: true).hasMatch(v);
    if (!ok) return 'اكتب اسم صحيح';

    return null;
  }

  static String? validateEmail(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'اكتب الإيميل';

    final ok = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]{2,}$').hasMatch(v);
    if (!ok) return 'اكتب إيميل صحيح';

    return null;
  }

  static String? validatePhone(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'اكتب رقم الهاتف';

    final normalized = v.replaceAll(RegExp(r'[\s-]'), '');

    final egyptPhoneRegex = RegExp(r'^01[0125]\d{8}$');
    if (!egyptPhoneRegex.hasMatch(normalized)) {
      return 'رقم الهاتف لازم يكون 11 رقم ويبدأ بـ 01';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    final v = (value ?? '');
    if (v.trim().isEmpty) return 'اكتب كلمة السر';
    if (v.length < 6) return 'كلمة السر لازم تكون 6 حروف على الأقل';
    return null;
  }

  static String? validateConfirmPassword({
    required String? value,
    required String password,
  }) {
    final v = (value ?? '');
    if (v.trim().isEmpty) return 'أكد كلمة السر';
    if (v != password) return 'كلمة السر غير متطابقة';
    return null;
  }
}
