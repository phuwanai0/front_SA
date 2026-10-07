import 'package:flutter/material.dart';

import 'home_page.dart';
import 'employees_page.dart';
import 'leave_page.dart';
import 'payroll_page.dart';
import 'manpower_page.dart';
import 'recruitment_page.dart';
import 'training_page.dart';
import 'welfare_page.dart';
import 'appraisal_page.dart';

class Attendance {
  String id;
  String name;
  String checkIn;
  String checkOut;
  String shift;
  String status;

  Attendance({
    required this.id,
    required this.name,
    required this.checkIn,
    required this.checkOut,
    required this.shift,
    required this.status,
  });
}

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color lightBlue = Color(0xFFEAF4FF);
  static const Color textDark = Color(0xFF263238);

  bool showMenu = true;
  String selectedMenu = 'เวลาเข้างาน';

  final TextEditingController searchController =
      TextEditingController();

  String selectedDate = '07/10/2026';

  final List<Attendance> attendanceList = [
    Attendance(
      id: 'EMP001',
      name: 'สมชาย ใจดี',
      checkIn: '08:55',
      checkOut: '17:05',
      shift: '08:00 - 17:00',
      status: 'ปกติ',
    ),
    Attendance(
      id: 'EMP002',
      name: 'สมหญิง ใจดี',
      checkIn: '09:20',
      checkOut: '17:10',
      shift: '08:00 - 17:00',
      status: 'สาย',
    ),
    Attendance(
      id: 'EMP003',
      name: 'วิชัย ใจดี',
      checkIn: '-',
      checkOut: '-',
      shift: '08:00 - 17:00',
      status: 'ขาด',
    ),
  ];

  List<Attendance> get filteredList {
    final keyword = searchController.text.toLowerCase();

    return attendanceList.where((employee) {
      return employee.name.toLowerCase().contains(keyword) ||
          employee.id.toLowerCase().contains(keyword);
    }).toList();
  }

  Color getStatusColor(String status) {
    if (status == 'ปกติ') return Colors.green;
    if (status == 'สาย') return Colors.orange;
    return Colors.red;
  }

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AppraisalPage(),
          ),
        );
        break;
    }
  }

  void showShiftDialog(Attendance employee) {
    String shift = employee.shift;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('กำหนดกะ'),
          content: DropdownButtonFormField<String>(
            initialValue: shift,
            decoration: const InputDecoration(
              labelText: 'กะทำงาน',
              border: OutlineInputBorder(),
            ),
            items: [
              '08:00 - 17:00',
              '09:00 - 18:00',
              '10:00 - 19:00',
            ].map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                shift = value;
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  employee.shift = shift;
                });
                Navigator.pop(context);
              },
              child: const Text('บันทึก'),
            ),
          ],
        );
      },
    );
  }

  void showEditTimeDialog(Attendance employee) {
    final checkInController =
        TextEditingController(text: employee.checkIn);
    final checkOutController =
        TextEditingController(text: employee.checkOut);
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ขอแก้ไขเวลา'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: checkInController,
                  decoration: const InputDecoration(
                    labelText: 'เวลาเข้าใหม่',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: checkOutController,
                  decoration: const InputDecoration(
                    labelText: 'เวลาออกใหม่',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: reasonController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'เหตุผล',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  employee.checkIn = checkInController.text;
                  employee.checkOut = checkOutController.text;
                  employee.status = 'ปกติ';
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('ส่งคำขอแก้ไขเวลาแล้ว'),
                  ),
                );
              },
              child: const Text('ส่งคำขอ'),
            ),
          ],
        );
      },
    );
  }

  void showMonthlySummary() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('สรุปเวลาทำงาน'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('เดือน: ตุลาคม 2026'),
              SizedBox(height: 16),
              Text('วันทำงานทั้งหมด: 22 วัน'),
              Text('มาทำงาน: 20 วัน'),
              Text('ขาด: 1 วัน'),
              Text('สาย: 1 ครั้ง'),
              SizedBox(height: 16),
              Text(
                'ชั่วโมงทำงานรวม: 168 ชั่วโมง',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ปิด'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: darkBlue,
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
            onPressed: showMonthlySummary,
            icon: const Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('ยังไม่มีการแจ้งเตือนใหม่'),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
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
                          Icons.home_outlined,
                          'หน้าแรก',
                        ),
                        _menuItem(
                          Icons.people_outline,
                          'ข้อมูลพนักงาน',
                        ),
                        _menuItem(
                          Icons.access_time,
                          'เวลาเข้างาน',
                        ),
                        _menuItem(
                          Icons.calendar_month_outlined,
                          'การลา',
                        ),
                        _menuItem(
                          Icons.payments_outlined,
                          'เงินเดือน',
                        ),
                        _menuItem(
                          Icons.groups_outlined,
                          'กำลังคน',
                        ),
                        _menuItem(
                          Icons.person_add_alt_1_outlined,
                          'รับสมัครพนักงาน',
                        ),
                        _menuItem(
                          Icons.school_outlined,
                          'การอบรม',
                        ),
                        _menuItem(
                          Icons.card_giftcard_outlined,
                          'สวัสดิการ',
                        ),
                        _menuItem(
                          Icons.assessment_outlined,
                          'การประเมินผลงาน',
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
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'เวลาเข้างาน',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'บันทึกและตรวจสอบเวลาการทำงานของพนักงาน',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          onChanged: (_) => setState(() {}),
                          decoration: InputDecoration(
                            hintText: 'ค้นหาพนักงาน...',
                            prefixIcon:
                                const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: Text(selectedDate),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Card(
                      child: ListView.separated(
                        itemCount: filteredList.length,
                        separatorBuilder: (_, _) =>
                            const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final employee =
                              filteredList[index];

                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                employee.name.substring(0, 1),
                              ),
                            ),
                            title: Text(
                              employee.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '${employee.id}   '
                              'เข้า ${employee.checkIn}   '
                              'ออก ${employee.checkOut}',
                            ),
                            trailing: Row(
                              mainAxisSize:
                                  MainAxisSize.min,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        getStatusColor(
                                      employee.status,
                                    ).withValues(alpha: 0.1),
                                    borderRadius:
                                        BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    employee.status,
                                    style: TextStyle(
                                      color:
                                          getStatusColor(
                                        employee.status,
                                      ),
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                IconButton(
                                  tooltip: 'กำหนดกะ',
                                  icon: const Icon(
                                    Icons.schedule,
                                  ),
                                  onPressed: () {
                                    showShiftDialog(
                                      employee,
                                    );
                                  },
                                ),
                                IconButton(
                                  tooltip: 'ขอแก้ไขเวลา',
                                  icon: const Icon(
                                    Icons.edit,
                                  ),
                                  onPressed: () {
                                    showEditTimeDialog(
                                      employee,
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
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

  Widget _menuItem(
    IconData icon,
    String title,
  ) {
    final selected = selectedMenu == title;

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
        onTap: () => selectMenu(title),
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