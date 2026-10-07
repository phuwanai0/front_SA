import 'package:flutter/material.dart';

import 'home_page.dart';
import 'employees_page.dart';
import 'attendance_page.dart';

import 'payroll_page.dart';
import 'manpower_page.dart';
import 'recruitment_page.dart';
import 'training_page.dart';
import 'welfare_page.dart';
import 'appraisal_page.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color lightBlue = Color(0xFFEAF4FF);
  static const Color textDark = Color(0xFF263238);

  bool showMenu = true;
  String selectedMenu = 'การลา';

  int annualLeave = 8;
  int sickLeave = 10;
  int personalLeave = 5;

  final List<Map<String, dynamic>> leaveRequests = [
    {
      'type': 'ลาพักร้อน',
      'start': '10/10/2026',
      'end': '11/10/2026',
      'days': 2,
      'reason': 'ไปเที่ยวกับครอบครัว',
      'file': 'ใบลา.pdf',
      'status': 'รออนุมัติ',
    },
    {
      'type': 'ลาป่วย',
      'start': '01/09/2026',
      'end': '01/09/2026',
      'days': 1,
      'reason': 'ไม่สบาย',
      'file': '-',
      'status': 'อนุมัติ',
    },
  ];

  void selectMenu(String menuName) {
    if (menuName == 'การลา') {
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AppraisalPage(),
          ),
        );
        break;
    }
  }

  void openLeaveForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LeaveFormPage(
          onSubmit: (request) {
            setState(() {
              leaveRequests.insert(0, request);
            });
          },
        ),
      ),
    );
  }

  void openDetail(Map<String, dynamic> request) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LeaveDetailPage(
          request: request,
          onStatusChanged: (newStatus) {
            setState(() {
              request['status'] = newStatus;
            });
          },
        ),
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'อนุมัติ':
        return Colors.green;
      case 'ปฏิเสธ':
        return Colors.red;
      default:
        return Colors.orange;
    }
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
            child: ListView(
              padding: const EdgeInsets.all(30),
              children: [
                const Text(
                  'การลา',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'จัดการคำร้องและประวัติการลาของพนักงาน',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'วันลาคงเหลือ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: LeaveBalanceCard(
                        title: 'พักร้อน',
                        days: annualLeave,
                        icon: Icons.beach_access,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: LeaveBalanceCard(
                        title: 'ป่วย',
                        days: sickLeave,
                        icon: Icons.local_hospital,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: LeaveBalanceCard(
                        title: 'กิจ',
                        days: personalLeave,
                        icon: Icons.person,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: openLeaveForm,
                    icon: const Icon(Icons.add),
                    label: const Text('ยื่นคำร้องลา'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'สถานะและประวัติการลา',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                ...leaveRequests.map(
                  (request) => Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.event_note),
                      ),

                      title: Text(
                        request['type'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        '${request['start']} - ${request['end']} '
                        '(${request['days']} วัน)',
                      ),

                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: getStatusColor(
                            request['status'],
                          ).withOpacity(0.15),
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: Text(
                          request['status'],
                          style: TextStyle(
                            color: getStatusColor(
                              request['status'],
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      onTap: () {
                        openDetail(request);
                      },
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


// ======================================================
// Leave Balance Card
// ======================================================

class LeaveBalanceCard extends StatelessWidget {
  final String title;
  final int days;
  final IconData icon;

  const LeaveBalanceCard({
    super.key,
    required this.title,
    required this.days,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, size: 28),

            const SizedBox(height: 8),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              '$days วัน',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ======================================================
// Leave Form Page
// ======================================================

class LeaveFormPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  const LeaveFormPage({
    super.key,
    required this.onSubmit,
  });

  @override
  State<LeaveFormPage> createState() => _LeaveFormPageState();
}

class _LeaveFormPageState extends State<LeaveFormPage> {
  String leaveType = 'ลาพักร้อน';

  DateTime? startDate;
  DateTime? endDate;

  String attachedFile = '-';

  final reasonController = TextEditingController();

  Future<void> selectDate(bool isStart) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2026),
      lastDate: DateTime(2030),
    );

    if (date == null) return;

    setState(() {
      if (isStart) {
        startDate = date;
      } else {
        endDate = date;
      }
    });
  }

  void attachFile() {
    setState(() {
      attachedFile = 'leave_document.pdf';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('แนบไฟล์เรียบร้อย'),
      ),
    );
  }

  void submit() {
    if (startDate == null ||
        endDate == null ||
        reasonController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('กรุณากรอกข้อมูลให้ครบ'),
        ),
      );
      return;
    }

    if (endDate!.isBefore(startDate!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'วันที่สิ้นสุดต้องไม่ก่อนวันที่เริ่มลา',
          ),
        ),
      );
      return;
    }

    final days =
        endDate!.difference(startDate!).inDays + 1;

    final request = {
      'type': leaveType,
      'start':
          '${startDate!.day}/${startDate!.month}/${startDate!.year}',
      'end':
          '${endDate!.day}/${endDate!.month}/${endDate!.year}',
      'days': days,
      'reason': reasonController.text,
      'file': attachedFile,
      'status': 'รออนุมัติ',
    };

    widget.onSubmit(request);

    Navigator.pop(context);
  }

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ยื่นคำร้องลา'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          DropdownButtonFormField<String>(
            value: leaveType,
            decoration: const InputDecoration(
              labelText: 'ประเภทการลา',
              border: OutlineInputBorder(),
            ),

            items: const [
              DropdownMenuItem(
                value: 'ลาพักร้อน',
                child: Text('ลาพักร้อน'),
              ),
              DropdownMenuItem(
                value: 'ลาป่วย',
                child: Text('ลาป่วย'),
              ),
              DropdownMenuItem(
                value: 'ลากิจ',
                child: Text('ลากิจ'),
              ),
            ],

            onChanged: (value) {
              setState(() {
                leaveType = value!;
              });
            },
          ),

          const SizedBox(height: 16),

          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(
                color: Colors.grey,
              ),
            ),

            title: Text(
              startDate == null
                  ? 'เลือกวันเริ่มลา'
                  : 'เริ่มลา: ${startDate!.day}/${startDate!.month}/${startDate!.year}',
            ),

            trailing: const Icon(
              Icons.calendar_month,
            ),

            onTap: () => selectDate(true),
          ),

          const SizedBox(height: 10),

          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(
                color: Colors.grey,
              ),
            ),

            title: Text(
              endDate == null
                  ? 'เลือกวันสิ้นสุด'
                  : 'สิ้นสุด: ${endDate!.day}/${endDate!.month}/${endDate!.year}',
            ),

            trailing: const Icon(
              Icons.calendar_month,
            ),

            onTap: () => selectDate(false),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: reasonController,
            maxLines: 3,

            decoration: const InputDecoration(
              labelText: 'เหตุผลการลา',
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
                attachedFile == '-'
                    ? 'แนบเอกสาร'
                    : attachedFile,
              ),

              trailing: ElevatedButton(
                onPressed: attachFile,
                child: const Text('แนบไฟล์'),
              ),
            ),
          ),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: submit,

            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
            ),

            child: const Text('ส่งคำร้องลา'),
          ),
        ],
      ),
    );
  }
}


// ======================================================
// Leave Detail Page
// ======================================================

class LeaveDetailPage extends StatelessWidget {
  final Map<String, dynamic> request;
  final Function(String) onStatusChanged;

  const LeaveDetailPage({
    super.key,
    required this.request,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool pending =
        request['status'] == 'รออนุมัติ';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'รายละเอียดการลา',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Text(
              request['type'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'วันที่เริ่ม: ${request['start']}',
            ),

            const SizedBox(height: 8),

            Text(
              'วันที่สิ้นสุด: ${request['end']}',
            ),

            const SizedBox(height: 8),

            Text(
              'จำนวนวัน: ${request['days']} วัน',
            ),

            const SizedBox(height: 8),

            Text(
              'เหตุผล: ${request['reason']}',
            ),

            const SizedBox(height: 8),

            Text(
              'เอกสาร: ${request['file']}',
            ),

            const SizedBox(height: 20),

            Text(
              'สถานะ: ${request['status']}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            if (pending)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        onStatusChanged('อนุมัติ');
                        Navigator.pop(context);
                      },

                      icon: const Icon(
                        Icons.check,
                      ),

                      label: const Text(
                        'อนุมัติ',
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        onStatusChanged('ปฏิเสธ');
                        Navigator.pop(context);
                      },

                      icon: const Icon(
                        Icons.close,
                      ),

                      label: const Text(
                        'ปฏิเสธ',
                      ),

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
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
      ),
    );
  }
}