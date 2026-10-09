import 'package:flutter/material.dart';

void main() {
  runApp(const MathQuizApp());
}

// نموذج بيانات السؤال
class Question {
  final int id;
  final String questionText;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

// قاعدة بيانات الأسئلة (30 سؤال) - تم تحويل الرموز لتعمل بدون مكتبات خارجية
final List<Question> quizData = [
  Question(
    id: 1,
    questionText: "ما هي طبيعة العدد π ؟",
    options: ["عدد صحيح", "عدد عشري", "عدد غير عادي", "عدد عادي"],
    correctIndex: 2,
    explanation: "العدد π هو عدد غير عادي لأن كتابته العشرية غير منتهية وغير دورية (قيمته التقريبية 3.14159...).",
  ),
  Question(
    id: 2,
    questionText: "أي من الأعداد التالية يعتبر من الجذور الصماء (أعداد غير عادية)؟",
    options: ["√16", "√2", "√25", "√100"],
    correctIndex: 1,
    explanation: "العدد √2 هو جذر أصم وعدد غير عادي، لأن ناتجه كتابة عشرية غير منتهية (1.4142...). بينما بقية الخيارات لها جذور صحيحة.",
  ),
  Question(
    id: 3,
    questionText: "العدد (-5) ينتمي إلى مجموعة الأعداد:",
    options: ["الطبيعية (N)", "الصحيحة (Z)", "غير العادية", "العشرية الموجبة"],
    correctIndex: 1,
    explanation: "الأعداد الصحيحة (Z) لا تحتوي على فاصلة عشرية وتشمل الأعداد الموجبة والسالبة. العدد الطبيعي يجب أن يكون موجباً.",
  ),
  Question(
    id: 4,
    questionText: "القاسم المشترك الأكبر للعددين GCD(14, 14) يساوي:",
    options: ["1", "0", "14", "28"],
    correctIndex: 2,
    explanation: "القاسم المشترك الأكبر للعدد نفسه هو العدد نفسه. حسب القاعدة: GCD(a, a) = a.",
  ),
  Question(
    id: 5,
    questionText: "متى يقبل العدد القسمة على 3 دون باقٍ؟",
    options: ["إذا كان آحاده صفر أو خمسة", "إذا كان آحاده زوجياً", "إذا كان مجموع أرقامه من مضاعفات الـ 3", "إذا كان عدداً فردياً"],
    correctIndex: 2,
    explanation: "القاعدة تنص على أن العدد يقبل القسمة على 3 إذا كان مجموع أرقامه من مضاعفات العدد 3 (مثل 12، 15، 108).",
  ),
  Question(
    id: 6,
    questionText: "باستخدام خوارزمية الطرح المتتالي أو القسمة، ما هو القاسم المشترك الأكبر للعددين (512, 224)؟",
    options: ["32", "64", "16", "8"],
    correctIndex: 0,
    explanation: "بطريقة القسمة الإقليدية: 512 ÷ 224 = 2 والباقي 64. ثم 224 ÷ 64 = 3 والباقي 32. ثم 64 ÷ 32 = 2 والباقي 0. آخر باقي غير معدوم هو 32.",
  ),
  Question(
    id: 7,
    questionText: "للحصول على كسر مختزل، نقسم البسط والمقام على:",
    options: ["العدد 2", "القاسم المشترك الأكبر بينهما", "القاسم المشترك الأصغر بينهما", "أي قاسم مشترك"],
    correctIndex: 1,
    explanation: "من أجل اختزال كسر ما، نوجد القاسم المشترك الأكبر (GCD) للبسط والمقام ثم نقسم كليهما عليه للحصول على عددين أوليين فيما بينهما.",
  ),
  Question(
    id: 8,
    questionText: "العدد الدال على مساحة دائرة نصف قطرها يساوي الواحد هو:",
    options: ["عدد طبيعي", "عدد صحيح", "عدد عادي", "عدد غير عادي"],
    correctIndex: 3,
    explanation: "مساحة الدائرة = π × r². إذا كان r=1، المساحة = π. وبما أن π عدد غير عادي، فالمساحة تمثل عدداً غير عادياً.",
  ),
  Question(
    id: 9,
    questionText: "كتابة الجذر √12 بالشكل a√b هي:",
    options: ["3√2", "2√3", "4√3", "6√2"],
    correctIndex: 1,
    explanation: "√12 = √(4 × 3) = √4 × √3 = 2√3.",
  ),
  Question(
    id: 10,
    questionText: "ناتج المقدار 3√5 × 2√7 هو:",
    options: ["5√12", "6√35", "6√12", "5√35"],
    correctIndex: 1,
    explanation: "عند ضرب الجذور، نضرب المضمون بالمضمون والمرافق بالمرافق: 3 × 2 = 6 و √5 × √7 = √35. الناتج 6√35.",
  ),
  Question(
    id: 11,
    questionText: "ناتج قسمة الجذور (6√18) ÷ (2√3) يساوي:",
    options: ["3√15", "4√6", "3√6", "12√6"],
    correctIndex: 2,
    explanation: "نقسم المرافق على المرافق: 6 ÷ 2 = 3. ونقسم المضمون على المضمون: 18 ÷ 3 = 6. الناتج هو 3√6.",
  ),
  Question(
    id: 12,
    questionText: "عند إزالة الجذر من مقام الكسر 2 / √3، يصبح الناتج:",
    options: ["√3 / 2", "2√3", "(2√3) / 3", "(3√2) / 2"],
    correctIndex: 2,
    explanation: "نضرب البسط والمقام بالجذر الموجود في المقام: (2 × √3) / (√3 × √3) = (2√3) / 3.",
  ),
  Question(
    id: 13,
    questionText: "ناتج جمع الجذور 8√3 + 4√3 هو:",
    options: ["12√6", "12√3", "32√3", "لا يمكن جمعها"],
    correctIndex: 1,
    explanation: "لجمع الجذور يجب أن تكون المضامين متشابهة. نحافظ على المضمون ونجمع المرافقات: (8 + 4)√3 = 12√3.",
  ),
  Question(
    id: 14,
    questionText: "ما هي قيمة المقدار √(34 + √(1 + √9)) ؟",
    options: ["6", "7", "5", "8"],
    correctIndex: 0,
    explanation: "نبدأ من أصغر جذر بالداخل: √9 = 3. ثم √(1+3) = √4 = 2. ثم √(34+2) = √36 = 6.",
  ),
  Question(
    id: 15,
    questionText: "ناتج قوة القوة (3⁴)⁵ يساوي:",
    options: ["3⁹", "3²⁰", "12⁵", "3⁻¹"],
    correctIndex: 1,
    explanation: "حسب قاعدة قوة القوة، نضرب الأسس: (a^m)^n = a^(m×n). إذن 4 × 5 = 20، الناتج 3²⁰.",
  ),
  Question(
    id: 16,
    questionText: "قيمة المقدار 7⁰ هي:",
    options: ["7", "0", "1", "70"],
    correctIndex: 2,
    explanation: "أي عدد (غير الصفر) مرفوع للقوة صفر يساوي 1.",
  ),
  Question(
    id: 17,
    questionText: "كتابة العدد 10⁻³ بالشكل العشري هي:",
    options: ["1000", "0.001", "0.01", "0.0001"],
    correctIndex: 1,
    explanation: "عندما تكون القوة سالبة نضع الأصفار بعد الفاصلة العشرية، 10⁻³ تعني وجود 3 أرقام بعد الفاصلة: 0.001.",
  ),
  Question(
    id: 18,
    questionText: "ناتج ضرب القوى ذات الأساس المشترك 2³ × 2⁵ هو:",
    options: ["4⁸", "2¹⁵", "2⁸", "4¹⁵"],
    correctIndex: 2,
    explanation: "في حالة ضرب القوى ذات الأساسات المتساوية، نجمع الأسس: 2^(3+5) = 2⁸.",
  ),
  Question(
    id: 19,
    questionText: "ناتج قسمة القوى 2⁹ / 2⁴ هو:",
    options: ["2¹³", "1⁵", "2³⁶", "2⁵"],
    correctIndex: 3,
    explanation: "في حالة قسمة القوى ذات الأساسات المتساوية، نطرح الأسس: 2^(9-4) = 2⁵.",
  ),
  Question(
    id: 20,
    questionText: "نصف العدد 6³ يساوي:",
    options: ["3³", "6¹·⁵", "108", "216"],
    correctIndex: 2,
    explanation: "نصف العدد يعني قسمته على 2: 6³ / 2 = (6×6×6) / 2 = 216 / 2 = 108.",
  ),
  Question(
    id: 21,
    questionText: "ثلث العدد 3⁴ هو:",
    options: ["1⁴", "3³", "3⁵", "27"],
    correctIndex: 3,
    explanation: "ثلث العدد يعني قسمته على 3: 3⁴ / 3¹ = 3^(4-1) = 3³ = 27.",
  ),
  Question(
    id: 22,
    questionText: "العدد (√2)² هو عدد:",
    options: ["صحيح", "غير عادي", "عشري فقط", "غير صحيح"],
    correctIndex: 0,
    explanation: "التربيع يزيل الجذر التربيعي: (√2)² = 2 ، والعدد 2 هو عدد صحيح (وطبيعي).",
  ),
  Question(
    id: 23,
    questionText: "القاسم المشترك الأكبر GCD(54, 36) يساوي:",
    options: ["9", "18", "12", "6"],
    correctIndex: 1,
    explanation: "قواسم 54: 1, 2, 3, 6, 9, 18, 27, 54. قواسم 36: 1, 2, 3, 4, 6, 9, 12, 18, 36. المشترك الأكبر هو 18.",
  ),
  Question(
    id: 24,
    questionText: "المقدار √27 + √12 يساوي:",
    options: ["√39", "5√3", "6√3", "لا يجمع"],
    correctIndex: 1,
    explanation: "نبسط الجذور أولاً: √27 = 3√3 و √12 = 2√3. الجمع: 3√3 + 2√3 = 5√3.",
  ),
  Question(
    id: 25,
    questionText: "قيمة المقدار (√(√5))⁴ هي:",
    options: ["√5", "25", "5", "125"],
    correctIndex: 2,
    explanation: "القوة 4 تعني التربيع مرتين. التربيع الأول يزيل الجذر الخارجي لتصبح (√5)². والتربيع الثاني يزيل الجذر الداخلي ليصبح الناتج 5.",
  ),
  Question(
    id: 26,
    questionText: "ربع العدد 8⁵ يساوي:",
    options: ["2¹⁵", "2¹³", "2¹²", "4⁵"],
    correctIndex: 1,
    explanation: "العدد 8 هو 2³، إذن 8⁵ = (2³)⁵ = 2¹⁵. ربعه يعني القسمة على 4 (وهي 2²). 2¹⁵ / 2² = 2¹³.",
  ),
  Question(
    id: 27,
    questionText: "العدد 0.00003 يكتب بالصيغة:",
    options: ["3 × 10⁵", "3 × 10⁻⁴", "3 × 10⁻⁵", "3 × 10⁻⁶"],
    correctIndex: 2,
    explanation: "الفاصلة تحركت 5 منازل لليمين، لذلك نضرب بقوة سالبة للعشرة: 3 × 10⁻⁵.",
  ),
  Question(
    id: 28,
    questionText: "طبيعة العدد π - (π/2) هي:",
    options: ["عدد صحيح", "عدد غير عادي", "عدد عادي", "صفر"],
    correctIndex: 1,
    explanation: "الناتج هو π/2. بما أن π عدد غير عادي، فإن قسمته على 2 تعطي عدداً غير عادي أيضاً.",
  ),
  Question(
    id: 29,
    questionText: "إن العدد (√5 - √2)² هو:",
    options: ["عدد صحيح", "عدد عادي", "عدد غير عادي", "يساوي 3"],
    correctIndex: 2,
    explanation: "المربع الأول - ضعفي الأول بالثاني + مربع الثاني. 5 - 2√10 + 2 = 7 - 2√10. وجود الجذر الأصم يجعله غير عادي.",
  ),
  Question(
    id: 30,
    questionText: "ناتج نشر الجداء (x - √3)(x + √3) يساوي:",
    options: ["x² + 3", "x² - 3", "x² - √3", "x² - 9"],
    correctIndex: 1,
    explanation: "متطابقة (فرق مربعي حدين): (a-b)(a+b) = a² - b². المربع الأول x² ناقص مربع الثاني (√3)² = 3. الناتج x² - 3.",
  ),
];

class MathQuizApp extends StatelessWidget {
  const MathQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'رياضيات الصف التاسع',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial', // Fallback font, assuming Arabic support
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
      ),
      // إجبار التطبيق على أن يكون من اليمين لليسار (RTL) لدعم اللغة العربية
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'رياضيات الصف التاسع',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E40AF), // blue-800
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _buildSubjectCard(
                    context,
                    title: 'جبر',
                    icon: Icons.calculate_outlined,
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AlgebraScreen()),
                      );
                    },
                  ),
                  _buildSubjectCard(
                    context,
                    title: 'هندسة',
                    icon: Icons.architecture,
                    color: Colors.green,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'قسم الهندسة قريباً... سيتم إضافته لاحقاً',
                            style: TextStyle(fontSize: 16),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectCard(BuildContext context,
      {required String title,
      required IconData icon,
      required MaterialColor color,
      required VoidCallback onTap}) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        hoverColor: color.shade50,
        splashColor: color.shade100,
        child: Container(
          width: 250,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.transparent, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80, color: color.shade600),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlgebraScreen extends StatelessWidget {
  const AlgebraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قسم الجبر', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1E40AF),
        elevation: 1,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  elevation: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QuizScreen()),
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 350),
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.blue, width: 4),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.assignment, color: Colors.blue.shade600),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'اختبار الوحدة الأولى',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'طبيعة الأعداد والكسور',
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // يمكن إضافة بطاقات أخرى هنا مستقبلاً
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<int?> userAnswers = List.filled(quizData.length, null);
  bool isReviewMode = false;
  bool showResultsScreen = false;

  final ScrollController _navScrollController = ScrollController();
  final ScrollController _mainScrollController = ScrollController();

  void selectOption(int selectedIndex) {
    if (userAnswers[currentQuestionIndex] != null) return; // Prevent multi-select

    setState(() {
      userAnswers[currentQuestionIndex] = selectedIndex;
    });

    // Auto-scroll to feedback (simple approximation)
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_mainScrollController.hasClients) {
        _mainScrollController.animateTo(
          _mainScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < quizData.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
      _scrollToCurrentNav();
    }
  }

  void prevQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
      _scrollToCurrentNav();
    }
  }

  void jumpToQuestion(int index) {
    setState(() {
      currentQuestionIndex = index;
    });
    _scrollToCurrentNav();
  }

  void _scrollToCurrentNav() {
    if (_navScrollController.hasClients) {
      double position = currentQuestionIndex * 56.0; // Approx width of item + spacing
      _navScrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void resetQuiz() {
    setState(() {
      userAnswers = List.filled(quizData.length, null);
      currentQuestionIndex = 0;
      isReviewMode = false;
      showResultsScreen = false;
    });
    _scrollToCurrentNav();
  }

  void finishQuiz() {
    setState(() {
      showResultsScreen = true;
      isReviewMode = true;
    });
  }

  void reviewAnswers() {
    setState(() {
      showResultsScreen = false;
      currentQuestionIndex = 0;
    });
    _scrollToCurrentNav();
  }

  int get score {
    int s = 0;
    for (int i = 0; i < quizData.length; i++) {
      if (userAnswers[i] == quizData[i].correctIndex) s++;
    }
    return s;
  }

  @override
  Widget build(BuildContext context) {
    if (showResultsScreen) {
      return _buildResultsScreen();
    }

    final question = quizData[currentQuestionIndex];
    final hasAnswered = userAnswers[currentQuestionIndex] != null;
    final bool allAnswered = !userAnswers.contains(null);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('اختبار طبيعة الأعداد والكسور', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('الصف التاسع الأساسي - إعداد : المهندسة بشرى ابراهيم - 0995386583', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ],
        ),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Top Action Buttons
          if (!isReviewMode)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: resetQuiz,
                    icon: const Icon(Icons.refresh, color: Colors.red),
                    label: const Text('إعادة الاختبار', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    style: TextButton.styleFrom(backgroundColor: Colors.red.shade50),
                  ),
                  TextButton.icon(
                    onPressed: finishQuiz,
                    icon: const Icon(Icons.flag, color: Colors.purple),
                    label: const Text('إنهاء وعرض النتيجة', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                    style: TextButton.styleFrom(backgroundColor: Colors.purple.shade50),
                  ),
                ],
              ),
            ),

          // Question Navigation Bar
          Container(
            height: 64,
            color: Colors.grey.shade50,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
              controller: _navScrollController,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: quizData.length,
              itemBuilder: (context, index) {
                return _buildNavDot(index);
              },
            ),
          ),
          
          // Main Question Area
          Expanded(
            child: ListView(
              controller: _mainScrollController,
              padding: const EdgeInsets.all(24),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'السؤال ${currentQuestionIndex + 1} من ${quizData.length}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'النقاط: $score',
                        style: TextStyle(color: Colors.blue.shade800, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  question.questionText,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, height: 1.5),
                ),
                const SizedBox(height: 24),
                
                // Options
                ...List.generate(question.options.length, (index) {
                  return _buildOptionButton(question, index, hasAnswered);
                }),

                // Feedback Section
                if (hasAnswered) ...[
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: userAnswers[currentQuestionIndex] == question.correctIndex
                          ? Colors.green.shade50
                          : Colors.red.shade50,
                      border: Border.all(
                        color: userAnswers[currentQuestionIndex] == question.correctIndex
                            ? Colors.green.shade200
                            : Colors.red.shade200,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userAnswers[currentQuestionIndex] == question.correctIndex
                              ? 'إجابة صحيحة ممتاز! 👏'
                              : 'إجابة خاطئة! ❌',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: userAnswers[currentQuestionIndex] == question.correctIndex
                                ? Colors.green.shade800
                                : Colors.red.shade800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'التبرير / طريقة الحل:',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          question.explanation,
                          style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Bottom Controls
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: currentQuestionIndex > 0 ? prevQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('السابق', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                if (allAnswered && !isReviewMode)
                  ElevatedButton(
                    onPressed: finishQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text('عرض النتيجة النهائية', style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                else
                  ElevatedButton(
                    onPressed: currentQuestionIndex < quizData.length - 1 ? nextQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text('التالي', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavDot(int index) {
    bool isActive = index == currentQuestionIndex;
    bool isAnswered = userAnswers[index] != null;
    bool isCorrect = userAnswers[index] == quizData[index].correctIndex;

    Color bgColor = Colors.grey.shade100;
    Color borderColor = Colors.grey.shade300;
    Color textColor = Colors.grey.shade600;

    if (isAnswered) {
      bgColor = isCorrect ? Colors.green.shade500 : Colors.red.shade500;
      borderColor = isCorrect ? Colors.green.shade600 : Colors.red.shade600;
      textColor = Colors.white;
    }

    if (isActive) {
      if (!isAnswered) {
        bgColor = Colors.blue.shade100;
        borderColor = Colors.blue.shade600;
        textColor = Colors.blue.shade800;
      }
    }

    return GestureDetector(
      onTap: () => jumpToQuestion(index),
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.only(left: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: isActive ? 2.5 : 1.5),
        ),
        child: Text(
          '${index + 1}',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: isActive ? 16 : 14,
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(Question question, int index, bool hasAnswered) {
    bool isSelected = userAnswers[currentQuestionIndex] == index;
    bool isCorrectOption = question.correctIndex == index;

    Color bgColor = Colors.white;
    Color borderColor = Colors.grey.shade300;
    Color textColor = Colors.black87;
    IconData? icon;
    Color? iconColor;

    if (hasAnswered) {
      if (isCorrectOption) {
        bgColor = Colors.green.shade50;
        borderColor = Colors.green.shade500;
        textColor = Colors.green.shade800;
        icon = Icons.check_circle;
        iconColor = Colors.green;
      } else if (isSelected) {
        bgColor = Colors.red.shade50;
        borderColor = Colors.red.shade500;
        textColor = Colors.red.shade800;
        icon = Icons.cancel;
        iconColor = Colors.red;
      } else {
        bgColor = Colors.grey.shade50;
        borderColor = Colors.grey.shade200;
        textColor = Colors.grey.shade400;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: hasAnswered ? null : () => selectOption(index),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  question.options[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
              if (icon != null) Icon(icon, color: iconColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultsScreen() {
    String message = "";
    Color messageColor = Colors.black;

    if (score == 30) {
      message = "علامة تامة! أداء استثنائي وعبقري رياضياً. 🏆";
      messageColor = Colors.green.shade600;
    } else if (score >= 25) {
      message = "ممتاز جداً! فهم عميق لطبيعة الأعداد والكسور. 🌟";
      messageColor = Colors.blue.shade600;
    } else if (score >= 20) {
      message = "جيد جداً! لديك أساس جيد، راجع بعض الأخطاء البسيطة. 👍";
      messageColor = Colors.orange.shade600;
    } else if (score >= 15) {
      message = "مقبول. تحتاج إلى مراجعة قواعد الجذور والقوى بتركيز أكبر. 📚";
      messageColor = Colors.deepOrange.shade500;
    } else {
      message = "لم يحالفك الحظ. ننصحك بإعادة قراءة الملف المرفق وحل التمارين مجدداً. 💪";
      messageColor = Colors.red.shade600;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('النتيجة النهائية'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'نتيجة الاختبار',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Text(
                '$score / ${quizData.length}',
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: messageColor,
                ),
              ),
              const SizedBox(height: 48),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: resetQuiz,
                    icon: const Icon(Icons.refresh),
                    label: const Text('إعادة الاختبار', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: reviewAnswers,
                    icon: const Icon(Icons.list_alt),
                    label: const Text('مراجعة الإجابات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}