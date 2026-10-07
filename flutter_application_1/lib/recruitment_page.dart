import 'package:flutter/material.dart';

import 'home_page.dart';
import 'employees_page.dart';
import 'attendance_page.dart';
import 'leave_page.dart';
import 'payroll_page.dart';
import 'manpower_page.dart';
import 'training_page.dart';
import 'welfare_page.dart';
import 'appraisal_page.dart';

class RecruitmentPage extends StatefulWidget {
  const RecruitmentPage({super.key});

  @override
  State<RecruitmentPage> createState() => _RecruitmentPageState();
}

class _RecruitmentPageState extends State<RecruitmentPage> {
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color lightBlue = Color(0xFFEAF4FF);
  static const Color textDark = Color(0xFF263238);

  bool showMenu = true;
  String selectedMenu = 'รับสมัครพนักงาน';

  final List<Map<String, dynamic>> applicants = [
    {
      'name': 'กิตติพงษ์ ใจดี',
      'position': 'Developer',
      'phone': '081-234-5678',
      'email': 'kitti@email.com',
      'qualification': 'ปริญญาตรี Computer Science',
      'document': 'resume_kitti.pdf',
      'status': 'ผู้สมัครใหม่',
      'interviewDate': '-',
      'interviewResult': '-',
    },
    {
      'name': 'พิมพ์ชนก สวยดี',
      'position': 'HR Officer',
      'phone': '082-345-6789',
      'email': 'pim@email.com',
      'qualification': 'ปริญญาตรี HR',
      'document': 'resume_pim.pdf',
      'status': 'นัดสัมภาษณ์',
      'interviewDate': '15/10/2026 10:00',
      'interviewResult': '-',
    },
    {
      'name': 'ธนกร รักงาน',
      'position': 'Sales Officer',
      'phone': '083-456-7890',
      'email': 'thanakorn@email.com',
      'qualification': 'ปริญญาตรีบริหารธุรกิจ',
      'document': 'resume_thanakorn.pdf',
      'status': 'ผ่านสัมภาษณ์',
      'interviewDate': '12/10/2026 13:00',
      'interviewResult': 'ผ่าน',
    },
  ];

  void selectMenu(String menuName) {
    if (menuName == 'รับสมัครพนักงาน') {
      setState(() {
        selectedMenu = menuName;
      });
      return;
    }

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
        setState(() {
          selectedMenu = menuName;
        });
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AppraisalPage(),
          ),
        );
        break;
    }
  }

  void openApplicationForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApplicationFormPage(
          onSubmit: (applicant) {
            setState(() {
              applicants.insert(0, applicant);
            });
          },
        ),
      ),
    );
  }

  void openApplicantDetail(
    Map<String, dynamic> applicant,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApplicantDetailPage(
          applicant: applicant,
          onUpdate: () {
            setState(() {});
          },
        ),
      ),
    );
  }

  Color statusColor(String status) {
    switch (status) {
      case 'ผ่านสัมภาษณ์':
        return Colors.green;
      case 'ไม่ผ่าน':
        return Colors.red;
      case 'นัดสัมภาษณ์':
        return Colors.blue;
      case 'คัดเลือก':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  int countStatus(String status) {
    return applicants
        .where(
          (applicant) => applicant['status'] == status,
        )
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FC),

      appBar: AppBar(
        backgroundColor: darkBlue,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            setState(() {
              showMenu = !showMenu;
            });
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'ระบบบริหารจัดการพนักงาน',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: primaryBlue,
                  content: Text(
                    'ยังไม่มีการแจ้งเตือนใหม่',
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: primaryBlue,
                  content: Text(
                    'ข้อมูลผู้ใช้งาน',
                  ),
                ),
              );
            },
            icon: const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 20,
                color: primaryBlue,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),

      body: Row(
        children: [
          if (showMenu)
            Container(
              width: 250,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                    ),
                    color: lightBlue,
                    child: const Column(
                      children: [
                        Icon(
                          Icons.business,
                          size: 45,
                          color: primaryBlue,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'ระบบจัดการพนักงาน',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: darkBlue,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        _menuItem(
                          icon: Icons.home_outlined,
                          title: 'หน้าแรก',
                          selected: selectedMenu == 'หน้าแรก',
                          onTap: () {
                            selectMenu('หน้าแรก');
                          },
                        ),
                        _menuItem(
                          icon: Icons.people_outline,
                          title: 'ข้อมูลพนักงาน',
                          selected: selectedMenu == 'ข้อมูลพนักงาน',
                          onTap: () {
                            selectMenu('ข้อมูลพนักงาน');
                          },
                        ),
                        _menuItem(
                          icon: Icons.access_time,
                          title: 'เวลาเข้างาน',
                          selected: selectedMenu == 'เวลาเข้างาน',
                          onTap: () {
                            selectMenu('เวลาเข้างาน');
                          },
                        ),
                        _menuItem(
                          icon: Icons.calendar_month_outlined,
                          title: 'การลา',
                          selected: selectedMenu == 'การลา',
                          onTap: () {
                            selectMenu('การลา');
                          },
                        ),
                        _menuItem(
                          icon: Icons.payments_outlined,
                          title: 'เงินเดือน',
                          selected: selectedMenu == 'เงินเดือน',
                          onTap: () {
                            selectMenu('เงินเดือน');
                          },
                        ),
                        _menuItem(
                          icon: Icons.groups_outlined,
                          title: 'กำลังคน',
                          selected: selectedMenu == 'กำลังคน',
                          onTap: () {
                            selectMenu('กำลังคน');
                          },
                        ),
                        _menuItem(
                          icon: Icons.person_add_alt_1_outlined,
                          title: 'รับสมัครพนักงาน',
                          selected:
                              selectedMenu == 'รับสมัครพนักงาน',
                          onTap: () {
                            selectMenu('รับสมัครพนักงาน');
                          },
                        ),
                        _menuItem(
                          icon: Icons.school_outlined,
                          title: 'การอบรม',
                          selected: selectedMenu == 'การอบรม',
                          onTap: () {
                            selectMenu('การอบรม');
                          },
                        ),
                        _menuItem(
                          icon: Icons.card_giftcard_outlined,
                          title: 'สวัสดิการ',
                          selected: selectedMenu == 'สวัสดิการ',
                          onTap: () {
                            selectMenu('สวัสดิการ');
                          },
                        ),
                        _menuItem(
                          icon: Icons.assessment_outlined,
                          title: 'การประเมินผลงาน',
                          selected:
                              selectedMenu == 'การประเมินผลงาน',
                          onTap: () {
                            selectMenu('การประเมินผลงาน');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          Expanded(
            child: Container(
              color: const Color(0xFFF5F8FC),
              child: ListView(
                padding: const EdgeInsets.all(30),
                children: [
                  const Text(
                    'รับสมัครพนักงาน',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'จัดการใบสมัคร คัดเลือก นัดสัมภาษณ์ และบันทึกผลสัมภาษณ์',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Recruitment Pipeline',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: PipelineCard(
                          title: 'ใหม่',
                          value: countStatus('ผู้สมัครใหม่'),
                          icon: Icons.person_add,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: PipelineCard(
                          title: 'คัดเลือก',
                          value: countStatus('คัดเลือก'),
                          icon: Icons.filter_alt,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: PipelineCard(
                          title: 'สัมภาษณ์',
                          value: countStatus('นัดสัมภาษณ์'),
                          icon: Icons.event,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: PipelineCard(
                          title: 'ผ่าน',
                          value: countStatus('ผ่านสัมภาษณ์'),
                          icon: Icons.check_circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: PipelineCard(
                          title: 'ไม่ผ่าน',
                          value: countStatus('ไม่ผ่าน'),
                          icon: Icons.cancel,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: openApplicationForm,
                      icon: const Icon(Icons.add),
                      label: const Text(
                        'รับใบสมัคร',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'ผู้สมัคร',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  ...applicants.map(
                    (applicant) => Card(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(
                          applicant['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${applicant['position']}\n'
                          '${applicant['email']}',
                        ),
                        isThreeLine: true,
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor(
                              applicant['status'],
                            ).withOpacity(0.15),
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                          child: Text(
                            applicant['status'],
                            style: TextStyle(
                              color: statusColor(
                                applicant['status'],
                              ),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        onTap: () {
                          openApplicantDetail(applicant);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool selected = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: selected
            ? primaryBlue
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: selected
              ? Colors.white
              : Colors.grey.shade700,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: selected
                ? Colors.white
                : textDark,
            fontWeight: selected
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}


// =====================================================
// Pipeline Card
// =====================================================

class PipelineCard extends StatelessWidget {
  final String title;
  final int value;
  final IconData icon;

  const PipelineCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(
              icon,
              size: 26,
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              '$value',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// =====================================================
// หน้ารับใบสมัคร
// =====================================================

class ApplicationFormPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  const ApplicationFormPage({
    super.key,
    required this.onSubmit,
  });

  @override
  State<ApplicationFormPage> createState() =>
      _ApplicationFormPageState();
}

class _ApplicationFormPageState
    extends State<ApplicationFormPage> {
  String position = 'Developer';

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final qualificationController =
      TextEditingController();

  String document = '-';

  void attachDocument() {
    setState(() {
      document = 'resume.pdf';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'แนบเอกสารเรียบร้อย',
        ),
      ),
    );
  }

  void submitApplication() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        qualificationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'กรุณากรอกข้อมูลให้ครบ',
          ),
        ),
      );
      return;
    }

    final applicant = {
      'name': nameController.text,
      'position': position,
      'phone': phoneController.text,
      'email': emailController.text,
      'qualification':
          qualificationController.text,
      'document': document,
      'status': 'ผู้สมัครใหม่',
      'interviewDate': '-',
      'interviewResult': '-',
    };

    widget.onSubmit(applicant);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'รับใบสมัคร',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'ชื่อผู้สมัคร',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            value: position,
            decoration: const InputDecoration(
              labelText: 'ตำแหน่งที่สมัคร',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Developer',
                child: Text('Developer'),
              ),
              DropdownMenuItem(
                value: 'HR Officer',
                child: Text('HR Officer'),
              ),
              DropdownMenuItem(
                value: 'Sales Officer',
                child: Text('Sales Officer'),
              ),
              DropdownMenuItem(
                value: 'Accountant',
                child: Text('Accountant'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                position = value!;
              });
            },
          ),

          const SizedBox(height: 16),

          TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'เบอร์โทรศัพท์',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: emailController,
            keyboardType:
                TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: qualificationController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'คุณสมบัติ / การศึกษา',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.attach_file,
              ),
              title: Text(
                document == '-'
                    ? 'เอกสารสมัครงาน'
                    : document,
              ),
              trailing: ElevatedButton(
                onPressed: attachDocument,
                child: const Text(
                  'แนบไฟล์',
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: submitApplication,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(
                  vertical: 15,
                ),
              ),
              child: const Text(
                'บันทึกใบสมัคร',
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// =====================================================
// Applicant Detail
// =====================================================

class ApplicantDetailPage extends StatefulWidget {
  final Map<String, dynamic> applicant;
  final VoidCallback onUpdate;

  const ApplicantDetailPage({
    super.key,
    required this.applicant,
    required this.onUpdate,
  });

  @override
  State<ApplicantDetailPage> createState() =>
      _ApplicantDetailPageState();
}

class _ApplicantDetailPageState
    extends State<ApplicantDetailPage> {

  void changeStatus(String status) {
    setState(() {
      widget.applicant['status'] = status;
    });

    widget.onUpdate();
  }

  Future<void> scheduleInterview() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2026),
      lastDate: DateTime(2030),
    );

    if (date == null) return;

    setState(() {
      widget.applicant['interviewDate'] =
          '${date.day}/${date.month}/${date.year} 10:00';

      widget.applicant['status'] =
          'นัดสัมภาษณ์';
    });

    widget.onUpdate();
  }

  void interviewResult() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'ผลสัมภาษณ์',
          ),
          content: const Text(
            'เลือกผลสัมภาษณ์ของผู้สมัคร',
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  widget.applicant[
                      'interviewResult'] = 'ผ่าน';

                  widget.applicant[
                      'status'] = 'ผ่านสัมภาษณ์';
                });

                widget.onUpdate();

                Navigator.pop(context);
              },
              child: const Text(
                'ผ่าน',
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.applicant[
                      'interviewResult'] = 'ไม่ผ่าน';

                  widget.applicant[
                      'status'] = 'ไม่ผ่าน';
                });

                widget.onUpdate();

                Navigator.pop(context);
              },
              child: const Text(
                'ไม่ผ่าน',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final applicant = widget.applicant;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'รายละเอียดผู้สมัคร',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: CircleAvatar(
              radius: 40,
              child: Text(
                applicant['name']
                    .toString()
                    .substring(0, 1),
                style: const TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: Text(
              applicant['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),

          DetailItem(
            title: 'ตำแหน่ง',
            value: applicant['position'],
          ),

          DetailItem(
            title: 'โทรศัพท์',
            value: applicant['phone'],
          ),

          DetailItem(
            title: 'Email',
            value: applicant['email'],
          ),

          DetailItem(
            title: 'คุณสมบัติ',
            value: applicant['qualification'],
          ),

          DetailItem(
            title: 'เอกสาร',
            value: applicant['document'],
          ),

          DetailItem(
            title: 'สถานะ',
            value: applicant['status'],
          ),

          DetailItem(
            title: 'วันสัมภาษณ์',
            value: applicant['interviewDate'],
          ),

          DetailItem(
            title: 'ผลสัมภาษณ์',
            value: applicant['interviewResult'],
          ),

          const SizedBox(height: 20),

          const Text(
            'เปลี่ยนสถานะผู้สมัคร',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {
                  changeStatus('คัดเลือก');
                },
                child: const Text(
                  'คัดเลือก',
                ),
              ),

              ElevatedButton(
                onPressed: scheduleInterview,
                child: const Text(
                  'นัดสัมภาษณ์',
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  changeStatus('ไม่ผ่าน');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'ไม่ผ่าน',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: interviewResult,
              icon: const Icon(
                Icons.assignment,
              ),
              label: const Text(
                'บันทึกผลสัมภาษณ์',
              ),
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'กลับ',
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// =====================================================
// Detail Item
// =====================================================

class DetailItem extends StatelessWidget {
  final String title;
  final String value;

  const DetailItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 8,
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}