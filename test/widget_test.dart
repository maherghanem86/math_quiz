import 'package:flutter_test/flutter_test.dart';

// استيراد الملف الرئيسي للتطبيق الخاص بك
import 'package:math_quiz/main.dart';

void main() {
  testWidgets('App should build and show main screen', (WidgetTester tester) async {
    // بناء التطبيق الخاص بنا (تم تغيير الاسم إلى MathQuizApp)
    await tester.pumpWidget(const MathQuizApp());

    // التحقق من أن التطبيق يعمل واشتغلت الشاشة الرئيسية
    // نبحث عن نص "رياضيات الصف التاسع" الموجود في الشاشة الرئيسية
    expect(find.text('رياضيات الصف التاسع'), findsWidgets);
  });
}
