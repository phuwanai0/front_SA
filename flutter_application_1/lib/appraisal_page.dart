import 'package:flutter/material.dart';

import 'home_page.dart';
import 'employees_page.dart';
import 'attendance_page.dart';
import 'leave_page.dart';
import 'payroll_page.dart';
import 'manpower_page.dart';
import 'recruitment_page.dart';
import 'training_page.dart';
import 'welfare_page.dart';

// ============================================================
// APPRAISAL PAGE
// ============================================================

class AppraisalPage extends StatefulWidget {
  const AppraisalPage({super.key});

  @override
  State<AppraisalPage> createState() => _AppraisalPageState();
}

class _AppraisalPageState extends State<AppraisalPage> {
  String selectedMenu = 'การประเมินผลงาน';

  final Color primaryBlue = const Color(0xFF1976D2);
  final Color darkBlue = const Color(0xFF0D47A1);
  final Color lightBlue = const Color(0xFFEAF4FF);
  final Color textDark = const Color(0xFF263238);

  void selectMenu(String menuName) {
    if (menuName == selectedMenu) return;

    switch (menuName) {
      case 'หน้าแรก':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
        break;

      case 'ข้อมูลพนักงาน':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const EmployeesPage(),
          ),
        );
        break;

      case 'เวลาเข้างาน':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AttendancePage(),
          ),
        );
        break;

      case 'การลา':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const LeavePage(),
          ),
        );
        break;

      case 'เงินเดือน':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const PayrollPage(),
          ),
        );
        break;

      case 'กำลังคน':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ManpowerPage(),
          ),
        );
        break;

      case 'รับสมัครพนักงาน':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const RecruitmentPage(),
          ),
        );
        break;

      case 'การอบรม':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const TrainingPage(),
          ),
        );
        break;

      case 'สวัสดิการ':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const WelfarePage(),
          ),
        );
        break;

      case 'การประเมินผลงาน':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Row(
        children: [
          _buildSidebar(),

          Expanded(
            child: Column(
              children: [
                _buildTopBar(),

                Expanded(
                  child: _buildContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SIDEBAR
  // ============================================================

  Widget _buildSidebar() {
    return Container(
      width: 250,
      color: darkBlue,
      child: Column(
        children: [
          const SizedBox(height: 35),

          const Icon(
            Icons.business,
            color: Colors.white,
            size: 45,
          ),

          const SizedBox(height: 12),

          const Text(
            '3C GROUP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'ระบบบริหารจัดการพนักงาน',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 35),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _menuItem(
                    Icons.home,
                    'หน้าแรก',
                  ),

                  _menuItem(
                    Icons.people,
                    'ข้อมูลพนักงาน',
                  ),

                  _menuItem(
                    Icons.access_time,
                    'เวลาเข้างาน',
                  ),

                  _menuItem(
                    Icons.event_note,
                    'การลา',
                  ),

                  _menuItem(
                    Icons.payments,
                    'เงินเดือน',
                  ),

                  _menuItem(
                    Icons.groups,
                    'กำลังคน',
                  ),

                  _menuItem(
                    Icons.person_add,
                    'รับสมัครพนักงาน',
                  ),

                  _menuItem(
                    Icons.school,
                    'การอบรม',
                  ),

                  _menuItem(
                    Icons.card_giftcard,
                    'สวัสดิการ',
                  ),

                  _menuItem(
                    Icons.assessment,
                    'การประเมินผลงาน',
                  ),
                ],
              ),
            ),
          ),

          const Divider(
            color: Colors.white24,
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Text(
                    'Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    IconData icon,
    String title,
  ) {
    final bool selected = selectedMenu == title;

    return InkWell(
      onTap: () {
        selectMenu(title);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 3,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          color: selected
              ? Colors.white.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected
                  ? Colors.white
                  : Colors.white70,
              size: 21,
            ),

            const SizedBox(width: 13),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : Colors.white70,
                  fontWeight: selected
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // TOP BAR
  // ============================================================

  Widget _buildTopBar() {
    return Container(
      height: 70,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Row(
        children: [
          Text(
            'การประเมินผลงาน',
            style: TextStyle(
              color: textDark,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          const Icon(
            Icons.notifications_none,
            color: Colors.grey,
          ),

          const SizedBox(width: 20),

          const CircleAvatar(
            backgroundColor: Color(0xFFE3F2FD),
            child: Icon(
              Icons.person,
              color: Color(0xFF1976D2),
            ),
          ),

          const SizedBox(width: 10),

          const Text(
            'Admin',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CONTENT
  // ============================================================

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 900,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                'ระบบประเมินผลการปฏิบัติงาน',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textDark,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'เลือกประเภทการประเมิน',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              _RoleCard(
                icon: Icons.person,
                title: 'พนักงานประเมินตัวเอง',
                subtitle:
                    'ประเมินผลการปฏิบัติงานของตนเอง',
                color: const Color(0xFF4F46E5),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const SelfEvaluationPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 18),

              _RoleCard(
                icon: Icons.groups,
                title: 'หัวหน้าแผนกประเมินพนักงาน',
                subtitle:
                    'ประเมินผลการปฏิบัติงานของพนักงานในแผนก',
                color: const Color(0xFF7C3AED),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const SupervisorEvaluationPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// ROLE CARD
// ============================================================

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _RoleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withValues(alpha: 0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color:
                    color.withValues(alpha: 0.1),
                borderRadius:
                    BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SELF EVALUATION
// ============================================================

class SelfEvaluationPage extends StatefulWidget {
  const SelfEvaluationPage({super.key});

  @override
  State<SelfEvaluationPage> createState() =>
      _SelfEvaluationPageState();
}

class _SelfEvaluationPageState
    extends State<SelfEvaluationPage> {
  final List<int> scores = [5, 3, 4, 4];

  final List<String> criteria = [
    'คุณภาพของงาน',
    'ความรับผิดชอบ',
    'การทำงานเป็นทีม',
    'การสื่อสาร',
  ];

  final List<String> descriptions = [
    'งานที่ได้รับมอบหมายมีความถูกต้อง ครบถ้วน และมีคุณภาพ',
    'ปฏิบัติงานตรงต่อเวลา รับผิดชอบงานที่ได้รับมอบหมาย',
    'สามารถทำงานร่วมกับผู้อื่นและช่วยเหลือเพื่อนร่วมงาน',
    'สื่อสารได้ชัดเจน เข้าใจง่าย และให้ข้อมูลครบถ้วน',
  ];

  final List<int> weights = [30, 25, 20, 25];

  double get totalScore {
    double total = 0;

    for (int i = 0; i < scores.length; i++) {
      total += scores[i] * weights[i] / 100;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: _appBar(
        'ประเมินผลการปฏิบัติงานตนเอง',
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              _periodCard(),

              const SizedBox(height: 18),

              _employeeCard(),

              const SizedBox(height: 18),

              _sectionTitle('เกณฑ์การประเมิน'),

              const SizedBox(height: 10),

              ...List.generate(
                criteria.length,
                (index) => _criteriaCard(index),
              ),

              const SizedBox(height: 10),

              _scoreCard(),

              const SizedBox(height: 18),

              _commentBox(),

              const SizedBox(height: 20),

              _saveButton(
                'บันทึกการประเมิน',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _employeeCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          _sectionTitle('ข้อมูลพนักงาน'),

          const SizedBox(height: 18),

          Row(
            children: [
              const CircleAvatar(
                radius: 32,
                backgroundColor: Color(0xFFE0E7FF),
                child: Icon(
                  Icons.person,
                  size: 35,
                  color: Color(0xFF4F46E5),
                ),
              ),

              const SizedBox(width: 16),

              const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'นายสมชาย ใจดี',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'แผนก IT',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'ตำแหน่ง: Programmer',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _criteriaCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${index + 1}. ${criteria[index]}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Text(
                'น้ำหนัก ${weights[index]}%',
                style: const TextStyle(
                  color: Color(0xFF4F46E5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            descriptions[index],
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: List.generate(
              5,
              (scoreIndex) {
                final score = scoreIndex + 1;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      scores[index] = score;
                    });
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: scores[index] == score
                          ? const Color(0xFF4F46E5)
                          : Colors.transparent,
                      border: Border.all(
                        color: scores[index] == score
                            ? const Color(0xFF4F46E5)
                            : Colors.grey.shade400,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '$score',
                        style: TextStyle(
                          color: scores[index] == score
                              ? Colors.white
                              : Colors.grey.shade700,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _scoreCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEEF2FF),
            Color(0xFFF5F3FF),
          ],
        ),
        borderRadius:
            BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'คะแนนรวมถ่วงน้ำหนัก',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            '${totalScore.toStringAsFixed(2)} / 5',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4F46E5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _commentBox() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            'ความคิดเห็นของตนเอง',
          ),

          const SizedBox(height: 12),

          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText:
                  'กรอกความคิดเห็นของคุณที่นี่...',
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _periodCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius:
            BorderRadius.circular(14),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.calendar_month,
            color: Color(0xFF4F46E5),
          ),

          SizedBox(width: 12),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                'รอบการประเมิน : ประจำปี 2026',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '1 ม.ค. 2569 - 31 ธ.ค. 2569',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _whiteCard({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: child,
    );
  }

  Widget _saveButton(String text) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(
            const SnackBar(
              content: Text(
                'บันทึกผลการประเมินเรียบร้อยแล้ว',
              ),
            ),
          );
        },
        icon: const Icon(Icons.save),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              const Color(0xFF4F46E5),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// SUPERVISOR EVALUATION
// ============================================================

class SupervisorEvaluationPage
    extends StatefulWidget {
  const SupervisorEvaluationPage({super.key});

  @override
  State<SupervisorEvaluationPage> createState() =>
      _SupervisorEvaluationPageState();
}

class _SupervisorEvaluationPageState
    extends State<SupervisorEvaluationPage> {
  int selectedEmployee = 0;

  final List<String> employees = [
    'นายสมชาย ใจดี',
    'นางสาวกมลวรรณ อินดี',
    'นายธนกร พัฒน์ดี',
    'นางสาวปิยธิดา จงดี',
  ];

  final List<String> positions = [
    'Programmer',
    'Developer',
    'System Analyst',
    'UX/UI Designer',
  ];

  final List<int> scores = [4, 5, 4, 4];

  final List<String> criteria = [
    'คุณภาพของงาน',
    'ความรับผิดชอบ',
    'การทำงานเป็นทีม',
    'การสื่อสาร',
  ];

  final List<int> weights = [30, 25, 20, 25];

  double get totalScore {
    double total = 0;

    for (int i = 0; i < scores.length; i++) {
      total += scores[i] * weights[i] / 100;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F7FB),
      appBar: _appBar(
        'ประเมินผลการปฏิบัติงานพนักงาน',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                _periodCard(),

                const SizedBox(height: 18),

                _employeeSelector(),

                const SizedBox(height: 18),

                const Text(
                  'เกณฑ์การประเมิน',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                ...List.generate(
                  criteria.length,
                  (index) => _criteriaCard(index),
                ),

                const SizedBox(height: 10),

                _commentBox(),

                const SizedBox(height: 15),

                _scoreCard(),

                const SizedBox(height: 20),

                _saveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _employeeSelector() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'เลือกพนักงานในแผนก',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            decoration: InputDecoration(
              prefixIcon:
                  const Icon(Icons.search),
              hintText:
                  'ค้นหาชื่อพนักงาน...',
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 12),

          ...List.generate(
            employees.length,
            (index) {
              final selected =
                  selectedEmployee == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedEmployee = index;
                  });
                },
                child: Container(
                  margin:
                      const EdgeInsets.only(
                    bottom: 8,
                  ),
                  padding:
                      const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color(0xFFEEF2FF)
                        : Colors.white,
                    borderRadius:
                        BorderRadius.circular(10),
                    border: Border.all(
                      color: selected
                          ? const Color(0xFF4F46E5)
                          : Colors.grey.shade200,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selected
                            ? Icons
                                .radio_button_checked
                            : Icons
                                .radio_button_off,
                        color: selected
                            ? const Color(
                                0xFF4F46E5)
                            : Colors.grey,
                      ),

                      const SizedBox(width: 12),

                      const CircleAvatar(
                        backgroundColor:
                            Color(0xFFE0E7FF),
                        child: Icon(
                          Icons.person,
                          color:
                              Color(0xFF4F46E5),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            employees[index],
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            positions[index],
                            style:
                                const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      const Text(
                        'IT',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _criteriaCard(int index) {
    return Container(
      margin:
          const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${index + 1}. ${criteria[index]}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              Text(
                '${weights[index]}%',
                style: const TextStyle(
                  color: Color(0xFF4F46E5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: List.generate(
              5,
              (scoreIndex) {
                final score =
                    scoreIndex + 1;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      scores[index] = score;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          scores[index] == score
                              ? const Color(
                                  0xFF4F46E5)
                              : Colors.transparent,
                      border: Border.all(
                        color:
                            scores[index] ==
                                    score
                                ? const Color(
                                    0xFF4F46E5)
                                : Colors
                                    .grey
                                    .shade400,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '$score',
                        style: TextStyle(
                          color:
                              scores[index] ==
                                      score
                                  ? Colors.white
                                  : Colors.grey
                                      .shade700,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _commentBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'ความคิดเห็นของหัวหน้า',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText:
                  'ระบุความคิดเห็นเกี่ยวกับการปฏิบัติงานของพนักงาน...',
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _scoreCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEEF2FF),
            Color(0xFFF5F3FF),
          ],
        ),
        borderRadius:
            BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'คะแนนรวมถ่วงน้ำหนัก',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            '${totalScore.toStringAsFixed(2)} / 5',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4F46E5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _periodCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius:
            BorderRadius.circular(14),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.calendar_month,
            color: Color(0xFF4F46E5),
          ),

          SizedBox(width: 12),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                'รอบการประเมิน : ประจำปี 2026',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '1 ม.ค. 2569 - 31 ธ.ค. 2569',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _saveButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(
            const SnackBar(
              content: Text(
                'บันทึกผลการประเมินพนักงานเรียบร้อยแล้ว',
              ),
            ),
          );
        },
        icon: const Icon(Icons.save),
        label: const Text(
          'บันทึกผลการประเมิน',
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              const Color(0xFF4F46E5),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius:
          BorderRadius.circular(14),
      border: Border.all(
        color: Colors.grey.shade200,
      ),
    );
  }
}

// ============================================================
// APP BAR
// ============================================================

PreferredSizeWidget _appBar(String title) {
  return AppBar(
    backgroundColor: const Color(0xFF172554),
    foregroundColor: Colors.white,
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}