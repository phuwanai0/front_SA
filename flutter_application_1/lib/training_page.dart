import 'package:flutter/material.dart';

import 'home_page.dart';
import 'employees_page.dart';
import 'attendance_page.dart';
import 'leave_page.dart';
import 'payroll_page.dart';
import 'manpower_page.dart';
import 'recruitment_page.dart';
import 'welfare_page.dart';
import 'appraisal_page.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color lightBlue = Color(0xFFEAF4FF);
  static const Color textDark = Color(0xFF263238);

  bool showMenu = true;
  String selectedMenu = 'การอบรม';

  final List<Map<String, dynamic>> courses = [
    {'name': 'Flutter Development', 'hours': 12, 'cost': 3500.0},
    {'name': 'Leadership Skills', 'hours': 8, 'cost': 2500.0},
    {'name': 'Communication Skills', 'hours': 6, 'cost': 1500.0},
  ];

  final List<Map<String, dynamic>> trainings = [
    {
      'employee': 'สมชาย ใจดี',
      'course': 'Flutter Development',
      'status': 'รออนุมัติ',
      'result': '-',
      'score': 0,
    },
    {
      'employee': 'สุดา สวยดี',
      'course': 'Leadership Skills',
      'status': 'อนุมัติแล้ว',
      'result': 'ผ่าน',
      'score': 85,
    },
  ];

  void selectMenu(String menuName) {
    if (menuName == 'การอบรม') {
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const RecruitmentPage(),
          ),
        );
        break;

      case 'การอบรม':
        setState(() {
          selectedMenu = menuName;
        });
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

  // =========================
  // สร้างหลักสูตร
  // =========================
  void showAddCourseDialog() {
    final nameController = TextEditingController();
    final hoursController = TextEditingController();
    final costController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('สร้างหลักสูตร'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'ชื่อหลักสูตร',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: hoursController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'จำนวนชั่วโมง',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: costController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'ค่าใช้จ่าย (บาท)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty) return;

                setState(() {
                  courses.add({
                    'name': nameController.text,
                    'hours':
                        int.tryParse(hoursController.text) ?? 0,
                    'cost':
                        double.tryParse(costController.text) ?? 0,
                  });
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

  // =========================
  // ลงทะเบียนพนักงาน
  // =========================
  void showRegisterDialog() {
    String employee = 'สมชาย ใจดี';
    String course = courses.first['name'];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('ลงทะเบียนพนักงาน'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    initialValue: employee,
                    decoration: const InputDecoration(
                      labelText: 'พนักงาน',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'สมชาย ใจดี',
                        child: Text('สมชาย ใจดี'),
                      ),
                      DropdownMenuItem(
                        value: 'สุดา สวยดี',
                        child: Text('สุดา สวยดี'),
                      ),
                      DropdownMenuItem(
                        value: 'กิตติพงษ์ ทำงาน',
                        child: Text('กิตติพงษ์ ทำงาน'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setDialogState(() {
                          employee = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: course,
                    decoration: const InputDecoration(
                      labelText: 'หลักสูตร',
                      border: OutlineInputBorder(),
                    ),
                    items: courses.map<DropdownMenuItem<String>>((item) {
                      return DropdownMenuItem<String>(
                        value: item['name'],
                        child: Text(item['name']),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setDialogState(() {
                          course = value;
                        });
                      }
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('ยกเลิก'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      trainings.add({
                        'employee': employee,
                        'course': course,
                        'status': 'รออนุมัติ',
                        'result': '-',
                        'score': 0,
                      });
                    });

                    Navigator.pop(context);
                  },
                  child: const Text('ลงทะเบียน'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // =========================
  // อนุมัติการอบรม
  // =========================
  void approveTraining(int index) {
    setState(() {
      trainings[index]['status'] = 'อนุมัติแล้ว';
    });
  }

  void rejectTraining(int index) {
    setState(() {
      trainings[index]['status'] = 'ไม่อนุมัติ';
    });
  }

  // =========================
  // บันทึกผลการอบรม
  // =========================
  void showResultDialog(int index) {
    final scoreController = TextEditingController(
      text: trainings[index]['score'].toString(),
    );

    String result = trainings[index]['result'] == '-'
        ? 'ผ่าน'
        : trainings[index]['result'];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('บันทึกผลการอบรม'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    trainings[index]['employee'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  DropdownButtonFormField<String>(
                    initialValue: result,
                    decoration: const InputDecoration(
                      labelText: 'ผลการอบรม',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'ผ่าน',
                        child: Text('ผ่าน'),
                      ),
                      DropdownMenuItem(
                        value: 'ไม่ผ่าน',
                        child: Text('ไม่ผ่าน'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setDialogState(() {
                          result = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: scoreController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'คะแนนประเมิน',
                      hintText: '0 - 100',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('ยกเลิก'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      trainings[index]['result'] = result;
                      trainings[index]['score'] =
                          int.tryParse(scoreController.text) ?? 0;
                    });

                    Navigator.pop(context);
                  },
                  child: const Text('บันทึก'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  int getTotalHours() {
    int total = 0;

    for (var training in trainings) {
      if (training['status'] == 'อนุมัติแล้ว') {
        final course = courses.firstWhere(
          (c) => c['name'] == training['course'],
          orElse: () => {'hours': 0},
        );

        total += course['hours'] as int;
      }
    }

    return total;
  }

  double getTotalCost() {
    double total = 0;

    for (var training in trainings) {
      if (training['status'] == 'อนุมัติแล้ว') {
        final course = courses.firstWhere(
          (c) => c['name'] == training['course'],
          orElse: () => {'cost': 0.0},
        );

        total += course['cost'] as double;
      }
    }

    return total;
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
                          selected:
                              selectedMenu == 'ข้อมูลพนักงาน',
                          onTap: () {
                            selectMenu('ข้อมูลพนักงาน');
                          },
                        ),
                        _menuItem(
                          icon: Icons.access_time,
                          title: 'เวลาเข้างาน',
                          selected:
                              selectedMenu == 'เวลาเข้างาน',
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
                          icon: Icons.person_add_alt_1_outlined,
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
                          icon: Icons.card_giftcard_outlined,
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
            child: Container(
              color: const Color(0xFFF5F8FC),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'การอบรม',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: textDark,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'จัดการหลักสูตร ลงทะเบียน อนุมัติผลการอบรม และรายงาน',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 25),

                    Row(
                      children: [
                        Expanded(
                          child: _summaryCard(
                            'หลักสูตร',
                            courses.length.toString(),
                            Icons.menu_book,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _summaryCard(
                            'ผู้เข้าอบรม',
                            trainings.length.toString(),
                            Icons.people,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: _summaryCard(
                            'ชั่วโมงอบรม',
                            getTotalHours().toString(),
                            Icons.access_time,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _summaryCard(
                            'ค่าใช้จ่าย',
                            '${getTotalCost().toStringAsFixed(0)} ฿',
                            Icons.payments,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '📚 หลักสูตรอบรม',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: showAddCourseDialog,
                          icon: const Icon(Icons.add),
                          label: const Text(
                            'สร้างหลักสูตร',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    ...courses.map(
                      (course) => Card(
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.menu_book),
                          ),
                          title: Text(course['name']),
                          subtitle: Text(
                            '${course['hours']} ชั่วโมง • '
                            '${course['cost'].toStringAsFixed(0)} บาท',
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: showRegisterDialog,
                        icon: const Icon(
                          Icons.person_add,
                        ),
                        label: const Text(
                          'ลงทะเบียนพนักงาน',
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      '👨‍💼 รายการอบรม',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    ...trainings.asMap().entries.map(
                      (entry) {
                        final index = entry.key;
                        final training = entry.value;

                        Color statusColor;

                        switch (training['status']) {
                          case 'อนุมัติแล้ว':
                            statusColor = Colors.green;
                            break;
                          case 'ไม่อนุมัติ':
                            statusColor = Colors.red;
                            break;
                          default:
                            statusColor = Colors.orange;
                        }

                        return Card(
                          margin: const EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  training['employee'],
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  training['course'],
                                ),

                                const SizedBox(height: 8),

                                Container(
                                  padding:
                                      const EdgeInsets
                                          .symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration:
                                      BoxDecoration(
                                    color: statusColor
                                        .withOpacity(0.15),
                                    borderRadius:
                                        BorderRadius
                                            .circular(20),
                                  ),
                                  child: Text(
                                    training['status'],
                                    style: TextStyle(
                                      color: statusColor,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Wrap(
                                  spacing: 8,
                                  children: [
                                    if (training['status'] ==
                                        'รออนุมัติ')
                                      ElevatedButton(
                                        onPressed: () =>
                                            approveTraining(
                                          index,
                                        ),
                                        child:
                                            const Text(
                                          'อนุมัติ',
                                        ),
                                      ),

                                    if (training['status'] ==
                                        'รออนุมัติ')
                                      OutlinedButton(
                                        onPressed: () =>
                                            rejectTraining(
                                          index,
                                        ),
                                        child:
                                            const Text(
                                          'ปฏิเสธ',
                                        ),
                                      ),

                                    if (training['status'] ==
                                        'อนุมัติแล้ว')
                                      OutlinedButton.icon(
                                        onPressed: () =>
                                            showResultDialog(
                                          index,
                                        ),
                                        icon: const Icon(
                                          Icons.edit,
                                        ),
                                        label:
                                            const Text(
                                          'บันทึกผล',
                                        ),
                                      ),
                                  ],
                                ),

                                if (training['result'] !=
                                    '-')
                                  Padding(
                                    padding:
                                        const EdgeInsets
                                            .only(
                                      top: 8,
                                    ),
                                    child: Text(
                                      'ผล: ${training['result']} '
                                      '| คะแนน: ${training['score']}',
                                      style:
                                          const TextStyle(
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      '📊 รายงานการอบรม',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.access_time,
                              color: primaryBlue,
                            ),
                            title: const Text(
                              'ชั่วโมงอบรมรวม',
                            ),
                            trailing: Text(
                              '${getTotalHours()} ชั่วโมง',
                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),

                          const Divider(height: 1),

                          ListTile(
                            leading: const Icon(
                              Icons.payments,
                              color: Colors.green,
                            ),
                            title: const Text(
                              'ค่าใช้จ่ายรวม',
                            ),
                            trailing: Text(
                              '${getTotalCost().toStringAsFixed(0)} บาท',
                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryCard(
    String title,
    String value,
    IconData icon,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
              color: primaryBlue,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(title),
          ],
        ),
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