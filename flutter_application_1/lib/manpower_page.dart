import 'package:flutter/material.dart';

import 'home_page.dart';
import 'employees_page.dart';
import 'attendance_page.dart';
import 'leave_page.dart';
import 'payroll_page.dart';

import 'recruitment_page.dart';
import 'training_page.dart';
import 'welfare_page.dart';
import 'appraisal_page.dart';

class ManpowerPage extends StatefulWidget {
  const ManpowerPage({super.key});

  @override
  State<ManpowerPage> createState() => _ManpowerPageState();
}

class _ManpowerPageState extends State<ManpowerPage> {
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color lightBlue = Color(0xFFEAF4FF);
  static const Color textDark = Color(0xFF263238);

  bool showMenu = true;
  String selectedMenu = 'กำลังคน';

  final List<Map<String, dynamic>> departments = [
    {
      'department': 'IT',
      'required': 10,
      'current': 7,
    },
    {
      'department': 'HR',
      'required': 6,
      'current': 6,
    },
    {
      'department': 'Sales',
      'required': 12,
      'current': 9,
    },
    {
      'department': 'Accounting',
      'required': 8,
      'current': 5,
    },
  ];

  final List<Map<String, dynamic>> requests = [
    {
      'department': 'IT',
      'position': 'Developer',
      'amount': 2,
      'reason': 'รองรับงานระบบใหม่',
      'status': 'รออนุมัติ',
    },
    {
      'department': 'Sales',
      'position': 'Sales Officer',
      'amount': 1,
      'reason': 'เพิ่มทีมขาย',
      'status': 'อนุมัติ',
    },
  ];

  void selectMenu(String menuName) {
    if (menuName == 'กำลังคน') {
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

  int getGap(Map<String, dynamic> department) {
    return department['required'] - department['current'];
  }

  void openRequestForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ManpowerRequestPage(
          onSubmit: (request) {
            setState(() {
              requests.insert(0, request);
            });
          },
        ),
      ),
    );
  }

  void openRequestDetail(
    Map<String, dynamic> request,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ManpowerRequestDetailPage(
          request: request,
          onStatusChanged: (status) {
            setState(() {
              request['status'] = status;
            });
          },
        ),
      ),
    );
  }

  Color getGapColor(int gap) {
    if (gap > 0) {
      return Colors.red;
    }

    return Colors.green;
  }

  Color getStatusColor(String status) {
    if (status == 'อนุมัติ') {
      return Colors.green;
    }

    if (status == 'ปฏิเสธ') {
      return Colors.red;
    }

    return Colors.orange;
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
                          selected:
                              selectedMenu == 'หน้าแรก',
                          onTap: () {
                            selectMenu('หน้าแรก');
                          },
                        ),

                        _menuItem(
                          icon: Icons.people_outline,
                          title: 'ข้อมูลพนักงาน',
                          selected:
                              selectedMenu ==
                                  'ข้อมูลพนักงาน',
                          onTap: () {
                            selectMenu('ข้อมูลพนักงาน');
                          },
                        ),

                        _menuItem(
                          icon: Icons.access_time,
                          title: 'เวลาเข้างาน',
                          selected:
                              selectedMenu ==
                                  'เวลาเข้างาน',
                          onTap: () {
                            selectMenu('เวลาเข้างาน');
                          },
                        ),

                        _menuItem(
                          icon:
                              Icons.calendar_month_outlined,
                          title: 'การลา',
                          selected:
                              selectedMenu == 'การลา',
                          onTap: () {
                            selectMenu('การลา');
                          },
                        ),

                        _menuItem(
                          icon: Icons.payments_outlined,
                          title: 'เงินเดือน',
                          selected:
                              selectedMenu == 'เงินเดือน',
                          onTap: () {
                            selectMenu('เงินเดือน');
                          },
                        ),

                        _menuItem(
                          icon: Icons.groups_outlined,
                          title: 'กำลังคน',
                          selected:
                              selectedMenu == 'กำลังคน',
                          onTap: () {
                            selectMenu('กำลังคน');
                          },
                        ),

                        _menuItem(
                          icon:
                              Icons.person_add_alt_1_outlined,
                          title: 'รับสมัครพนักงาน',
                          selected:
                              selectedMenu ==
                                  'รับสมัครพนักงาน',
                          onTap: () {
                            selectMenu('รับสมัครพนักงาน');
                          },
                        ),

                        _menuItem(
                          icon: Icons.school_outlined,
                          title: 'การอบรม',
                          selected:
                              selectedMenu == 'การอบรม',
                          onTap: () {
                            selectMenu('การอบรม');
                          },
                        ),

                        _menuItem(
                          icon:
                              Icons.card_giftcard_outlined,
                          title: 'สวัสดิการ',
                          selected:
                              selectedMenu == 'สวัสดิการ',
                          onTap: () {
                            selectMenu('สวัสดิการ');
                          },
                        ),

                        _menuItem(
                          icon: Icons.assessment_outlined,
                          title: 'การประเมินผลงาน',
                          selected:
                              selectedMenu ==
                                  'การประเมินผลงาน',
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
                  'กำลังคน',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'วางแผนและจัดการอัตรากำลังของแต่ละแผนก',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'อัตรากำลังรายแผนก',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                ...departments.map(
                  (department) {
                    final gap = getGap(department);

                    return Card(
                      margin:
                          const EdgeInsets.only(bottom: 10),

                      child: Padding(
                        padding:
                            const EdgeInsets.all(16),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,

                              children: [
                                Text(
                                  department[
                                      'department'],
                                  style:
                                      const TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  gap > 0
                                      ? 'ขาด $gap คน'
                                      : 'ครบอัตรา',
                                  style: TextStyle(
                                    color:
                                        getGapColor(
                                      gap,
                                    ),
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            Row(
                              children: [
                                Expanded(
                                  child:
                                      HeadcountItem(
                                    title: 'Required',
                                    value:
                                        department[
                                            'required'],
                                  ),
                                ),

                                Expanded(
                                  child:
                                      HeadcountItem(
                                    title: 'Current',
                                    value:
                                        department[
                                            'current'],
                                  ),
                                ),

                                Expanded(
                                  child:
                                      HeadcountItem(
                                    title: 'Gap',
                                    value: gap,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton.icon(
                    onPressed: openRequestForm,

                    icon: const Icon(Icons.add),

                    label: const Text(
                      'สร้างใบขออัตรากำลัง',
                    ),

                    style:
                        ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'คำขออัตรากำลัง',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                ...requests.map(
                  (request) => Card(
                    margin:
                        const EdgeInsets.only(bottom: 10),

                    child: ListTile(
                      leading:
                          const CircleAvatar(
                        child: Icon(
                          Icons.people,
                        ),
                      ),

                      title: Text(
                        '${request['department']} - '
                        '${request['position']}',
                        style:
                            const TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        'จำนวน ${request['amount']} คน\n'
                        '${request['reason']}',
                      ),

                      isThreeLine: true,

                      trailing: Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),

                        decoration:
                            BoxDecoration(
                          color:
                              getStatusColor(
                            request['status'],
                          ).withOpacity(0.15),

                          borderRadius:
                              BorderRadius.circular(
                            20,
                          ),
                        ),

                        child: Text(
                          request['status'],
                          style: TextStyle(
                            color:
                                getStatusColor(
                              request['status'],
                            ),
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      onTap: () {
                        openRequestDetail(
                          request,
                        );
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


// =====================================================
// Headcount Item
// =====================================================

class HeadcountItem extends StatelessWidget {
  final String title;
  final int value;

  const HeadcountItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          '$value',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}


// =====================================================
// หน้าสร้างใบขออัตรากำลัง
// =====================================================

class ManpowerRequestPage
    extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  const ManpowerRequestPage({
    super.key,
    required this.onSubmit,
  });

  @override
  State<ManpowerRequestPage> createState() =>
      _ManpowerRequestPageState();
}

class _ManpowerRequestPageState
    extends State<ManpowerRequestPage> {
  String department = 'IT';
  String position = 'Developer';

  final amountController =
      TextEditingController(text: '1');

  final reasonController =
      TextEditingController();

  void submitRequest() {
    final amount =
        int.tryParse(amountController.text) ?? 0;

    if (amount <= 0 ||
        reasonController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'กรุณากรอกข้อมูลให้ครบ',
          ),
        ),
      );

      return;
    }

    final request = {
      'department': department,
      'position': position,
      'amount': amount,
      'reason': reasonController.text,
      'status': 'รออนุมัติ',
    };

    widget.onSubmit(request);

    Navigator.pop(context);
  }

  @override
  void dispose() {
    amountController.dispose();
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'สร้างใบขออัตรากำลัง',
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          DropdownButtonFormField<String>(
            value: department,

            decoration:
                const InputDecoration(
              labelText: 'แผนก',
              border: OutlineInputBorder(),
            ),

            items: const [
              DropdownMenuItem(
                value: 'IT',
                child: Text('IT'),
              ),

              DropdownMenuItem(
                value: 'HR',
                child: Text('HR'),
              ),

              DropdownMenuItem(
                value: 'Sales',
                child: Text('Sales'),
              ),

              DropdownMenuItem(
                value: 'Accounting',
                child: Text('Accounting'),
              ),
            ],

            onChanged: (value) {
              setState(() {
                department = value!;
              });
            },
          ),

          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            value: position,

            decoration:
                const InputDecoration(
              labelText: 'ตำแหน่ง',
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
            controller: amountController,

            keyboardType:
                TextInputType.number,

            decoration:
                const InputDecoration(
              labelText: 'จำนวนที่ต้องการ',
              suffixText: 'คน',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: reasonController,

            maxLines: 4,

            decoration:
                const InputDecoration(
              labelText:
                  'เหตุผลในการขออัตรากำลัง',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,

            child: ElevatedButton(
              onPressed: submitRequest,

              style:
                  ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(
                  vertical: 15,
                ),
              ),

              child: const Text(
                'ส่งคำขอ',
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// =====================================================
// รายละเอียดคำขอ
// =====================================================

class ManpowerRequestDetailPage
    extends StatelessWidget {
  final Map<String, dynamic> request;

  final Function(String) onStatusChanged;

  const ManpowerRequestDetailPage({
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
          'รายละเอียดคำขอ',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Text(
              '${request['department']} - '
              '${request['position']}',

              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'แผนก: ${request['department']}',
            ),

            const SizedBox(height: 10),

            Text(
              'ตำแหน่ง: ${request['position']}',
            ),

            const SizedBox(height: 10),

            Text(
              'จำนวนที่ต้องการ: '
              '${request['amount']} คน',
            ),

            const SizedBox(height: 10),

            Text(
              'เหตุผล: ${request['reason']}',
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
                    child:
                        ElevatedButton.icon(
                      onPressed: () {
                        onStatusChanged(
                          'อนุมัติ',
                        );

                        Navigator.pop(
                          context,
                        );
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
                    child:
                        ElevatedButton.icon(
                      onPressed: () {
                        onStatusChanged(
                          'ปฏิเสธ',
                        );

                        Navigator.pop(
                          context,
                        );
                      },

                      icon: const Icon(
                        Icons.close,
                      ),

                      label: const Text(
                        'ปฏิเสธ',
                      ),

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red,
                        foregroundColor:
                            Colors.white,
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