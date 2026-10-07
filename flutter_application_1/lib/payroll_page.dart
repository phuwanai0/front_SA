import 'package:flutter/material.dart';

import 'home_page.dart';
import 'employees_page.dart';
import 'attendance_page.dart';
import 'leave_page.dart';
import 'manpower_page.dart';
import 'recruitment_page.dart';
import 'training_page.dart';
import 'welfare_page.dart';
import 'appraisal_page.dart';

class PayrollPage extends StatefulWidget {
  const PayrollPage({super.key});

  @override
  State<PayrollPage> createState() => _PayrollPageState();
}

class _PayrollPageState extends State<PayrollPage> {
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color lightBlue = Color(0xFFEAF4FF);
  static const Color textDark = Color(0xFF263238);

  bool showMenu = true;
  String selectedMenu = 'เงินเดือน';

  final List<Map<String, dynamic>> employees = [
    {
      'id': 'EMP001',
      'name': 'สมชาย ใจดี',
      'department': 'IT',
      'salary': 25000.0,
      'income': 2000.0,
      'deduction': 1500.0,
    },
    {
      'id': 'EMP002',
      'name': 'สมหญิง ใจดี',
      'department': 'HR',
      'salary': 22000.0,
      'income': 1000.0,
      'deduction': 1200.0,
    },
    {
      'id': 'EMP003',
      'name': 'วิชัย ใจดี',
      'department': 'Sales',
      'salary': 28000.0,
      'income': 3000.0,
      'deduction': 1800.0,
    },
  ];

  double netSalary(Map<String, dynamic> employee) {
    return employee['salary'] +
        employee['income'] -
        employee['deduction'];
  }

  void selectMenu(String menuName) {
    if (menuName == 'เงินเดือน') {
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
        setState(() {
          selectedMenu = menuName;
        });
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

  void openPayrollDetail(Map<String, dynamic> employee) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PayrollDetailPage(
          employee: employee,
          onUpdate: () {
            setState(() {});
          },
        ),
      ),
    );
  }

  void openSummary() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PayrollSummaryPage(
          employees: employees,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalSalary = employees.fold(
      0,
      (sum, employee) => sum + employee['salary'],
    );

    double totalIncome = employees.fold(
      0,
      (sum, employee) => sum + employee['income'],
    );

    double totalDeduction = employees.fold(
      0,
      (sum, employee) => sum + employee['deduction'],
    );

    double totalNet = employees.fold(
      0,
      (sum, employee) => sum + netSalary(employee),
    );

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
                          selected: selectedMenu == 'รับสมัครพนักงาน',
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
                          selected: selectedMenu == 'การประเมินผลงาน',
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
                    'เงินเดือน',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'จัดการข้อมูลเงินเดือนและ Payroll ของพนักงาน',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payroll Summary',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Row(
                            children: [
                              Expanded(
                                child: SummaryItem(
                                  title: 'เงินเดือน',
                                  value: totalSalary,
                                ),
                              ),
                              Expanded(
                                child: SummaryItem(
                                  title: 'รายได้',
                                  value: totalIncome,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          Row(
                            children: [
                              Expanded(
                                child: SummaryItem(
                                  title: 'รายหัก',
                                  value: totalDeduction,
                                ),
                              ),
                              Expanded(
                                child: SummaryItem(
                                  title: 'Net Salary',
                                  value: totalNet,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: openSummary,
                              child: const Text(
                                'ดู Payroll Summary',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'รายการเงินเดือน',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  ...employees.map(
                    (employee) => Card(
                      margin:
                          const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(
                          employee['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${employee['id']} • ${employee['department']}',
                        ),
                        trailing: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          crossAxisAlignment:
                              CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Net Salary',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '฿${netSalary(employee).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          openPayrollDetail(employee);
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


// ======================================================
// Summary Item
// ======================================================

class SummaryItem extends StatelessWidget {
  final String title;
  final double value;

  const SummaryItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '฿${value.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}


// ======================================================
// Payroll Detail
// ======================================================

class PayrollDetailPage extends StatefulWidget {
  final Map<String, dynamic> employee;
  final VoidCallback onUpdate;

  const PayrollDetailPage({
    super.key,
    required this.employee,
    required this.onUpdate,
  });

  @override
  State<PayrollDetailPage> createState() =>
      _PayrollDetailPageState();
}

class _PayrollDetailPageState
    extends State<PayrollDetailPage> {
  final salaryController =
      TextEditingController();

  final incomeController =
      TextEditingController();

  final deductionController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    salaryController.text =
        widget.employee['salary'].toString();

    incomeController.text =
        widget.employee['income'].toString();

    deductionController.text =
        widget.employee['deduction'].toString();
  }

  double get salary =>
      double.tryParse(
        salaryController.text,
      ) ??
      0;

  double get income =>
      double.tryParse(
        incomeController.text,
      ) ??
      0;

  double get deduction =>
      double.tryParse(
        deductionController.text,
      ) ??
      0;

  double get netSalary =>
      salary + income - deduction;

  void savePayroll() {
    setState(() {
      widget.employee['salary'] = salary;
      widget.employee['income'] = income;
      widget.employee['deduction'] = deduction;
    });

    widget.onUpdate();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'บันทึกข้อมูลเงินเดือนแล้ว',
        ),
      ),
    );
  }

  void openESlip() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ESlipPage(
          employee: widget.employee,
          salary: salary,
          income: income,
          deduction: deduction,
          netSalary: netSalary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payroll Detail'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            widget.employee['name'],
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            '${widget.employee['id']} • '
            '${widget.employee['department']}',
          ),

          const SizedBox(height: 24),

          TextField(
            controller: salaryController,
            keyboardType:
                TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'เงินเดือนพื้นฐาน',
              prefixText: '฿ ',
              border: OutlineInputBorder(),
            ),
            onChanged: (_) {
              setState(() {});
            },
          ),

          const SizedBox(height: 16),

          TextField(
            controller: incomeController,
            keyboardType:
                TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'รายได้เพิ่มเติม',
              prefixText: '฿ ',
              border: OutlineInputBorder(),
            ),
            onChanged: (_) {
              setState(() {});
            },
          ),

          const SizedBox(height: 16),

          TextField(
            controller: deductionController,
            keyboardType:
                TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'รายการหัก',
              prefixText: '฿ ',
              border: OutlineInputBorder(),
            ),
            onChanged: (_) {
              setState(() {});
            },
          ),

          const SizedBox(height: 24),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'Net Salary',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '฿${netSalary.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'เงินเดือน + รายได้ - รายหัก',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: savePayroll,
              child: const Text(
                'บันทึกข้อมูล Payroll',
              ),
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: openESlip,
              icon: const Icon(
                Icons.receipt_long,
              ),
              label: const Text(
                'ออก E-Slip',
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
              child: const Text('กลับ'),
            ),
          ),
        ],
      ),
    );
  }
}


// ======================================================
// E-Slip
// ======================================================

class ESlipPage extends StatelessWidget {
  final Map<String, dynamic> employee;
  final double salary;
  final double income;
  final double deduction;
  final double netSalary;

  const ESlipPage({
    super.key,
    required this.employee,
    required this.salary,
    required this.income,
    required this.deduction,
    required this.netSalary,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Slip'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'PAYSLIP',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  'พนักงาน: ${employee['name']}',
                ),

                Text(
                  'รหัส: ${employee['id']}',
                ),

                Text(
                  'แผนก: ${employee['department']}',
                ),

                const Divider(height: 30),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'เงินเดือนพื้นฐาน',
                    ),
                    Text(
                      '฿${salary.toStringAsFixed(2)}',
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'รายได้เพิ่มเติม',
                    ),
                    Text(
                      '฿${income.toStringAsFixed(2)}',
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'รายการหัก',
                    ),
                    Text(
                      '- ฿${deduction.toStringAsFixed(2)}',
                    ),
                  ],
                ),

                const Divider(height: 30),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'NET SALARY',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '฿${netSalary.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'E-Slip พร้อมใช้งาน',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.download,
                    ),
                    label: const Text(
                      'บันทึก E-Slip',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// ======================================================
// Payroll Summary Page
// ======================================================

class PayrollSummaryPage
    extends StatelessWidget {
  final List<Map<String, dynamic>> employees;

  const PayrollSummaryPage({
    super.key,
    required this.employees,
  });

  double netSalary(
    Map<String, dynamic> employee,
  ) {
    return employee['salary'] +
        employee['income'] -
        employee['deduction'];
  }

  @override
  Widget build(BuildContext context) {
    final totalSalary =
        employees.fold<double>(
      0,
      (sum, e) => sum + e['salary'],
    );

    final totalIncome =
        employees.fold<double>(
      0,
      (sum, e) => sum + e['income'],
    );

    final totalDeduction =
        employees.fold<double>(
      0,
      (sum, e) => sum + e['deduction'],
    );

    final totalNet =
        employees.fold<double>(
      0,
      (sum, e) => sum + netSalary(e),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payroll Summary',
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SummaryBox(
            title: 'จำนวนพนักงาน',
            value:
                '${employees.length} คน',
          ),

          SummaryBox(
            title: 'เงินเดือนรวม',
            value:
                '฿${totalSalary.toStringAsFixed(2)}',
          ),

          SummaryBox(
            title: 'รายได้รวม',
            value:
                '฿${totalIncome.toStringAsFixed(2)}',
          ),

          SummaryBox(
            title: 'รายหักรวม',
            value:
                '฿${totalDeduction.toStringAsFixed(2)}',
          ),

          SummaryBox(
            title: 'Net Salary รวม',
            value:
                '฿${totalNet.toStringAsFixed(2)}',
          ),

          const SizedBox(height: 20),

          const Text(
            'รายละเอียดพนักงาน',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          ...employees.map(
            (employee) => Card(
              child: ListTile(
                title: Text(
                  employee['name'],
                ),
                subtitle: Text(
                  employee['department'],
                ),
                trailing: Text(
                  '฿${netSalary(employee).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// ======================================================
// Summary Box
// ======================================================

class SummaryBox extends StatelessWidget {
  final String title;
  final String value;

  const SummaryBox({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: ListTile(
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}