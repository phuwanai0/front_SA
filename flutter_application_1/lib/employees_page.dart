import 'package:flutter/material.dart';

import 'home_page.dart';
import 'attendance_page.dart';
import 'leave_page.dart';
import 'payroll_page.dart';
import 'manpower_page.dart';
import 'recruitment_page.dart';
import 'training_page.dart';
import 'welfare_page.dart';
import 'appraisal_page.dart';

class Employee {
  String id;
  String name;
  String department;
  String position;
  String salary;
  String startDate;
  String status;
  List<String> history;

  Employee({
    required this.id,
    required this.name,
    required this.department,
    required this.position,
    required this.salary,
    required this.startDate,
    required this.status,
    required this.history,
  });
}

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color lightBlue = Color(0xFFEAF4FF);
  static const Color textDark = Color(0xFF263238);

  bool showMenu = true;
  String selectedMenu = 'ข้อมูลพนักงาน';

  final TextEditingController searchController =
      TextEditingController();

  String selectedDepartment = 'All';

  final List<Employee> employees = [
    Employee(
      id: 'EMP001',
      name: 'สมชาย ใจดี',
      department: 'IT',
      position: 'Developer',
      salary: '30,000',
      startDate: '01/01/2026',
      status: 'Active',
      history: [
        '2026 - Developer - 30,000 บาท',
        '2025 - Junior Developer - 25,000 บาท',
      ],
    ),
    Employee(
      id: 'EMP002',
      name: 'สมหญิง ใจดี',
      department: 'HR',
      position: 'HR Staff',
      salary: '28,000',
      startDate: '01/02/2026',
      status: 'Active',
      history: [
        '2026 - HR Staff - 28,000 บาท',
      ],
    ),
    Employee(
      id: 'EMP003',
      name: 'วิชัย ใจดี',
      department: 'Sales',
      position: 'Sales',
      salary: '27,000',
      startDate: '01/03/2025',
      status: 'Resigned',
      history: [
        '2025 - Sales - 27,000 บาท',
      ],
    ),
  ];

  List<Employee> get filteredEmployees {
    final keyword = searchController.text.toLowerCase();

    return employees.where((employee) {
      final matchSearch =
          employee.name.toLowerCase().contains(keyword) ||
          employee.id.toLowerCase().contains(keyword);

      final matchDepartment =
          selectedDepartment == 'All' ||
          employee.department == selectedDepartment;

      return matchSearch && matchDepartment;
    }).toList();
  }

  // ================= เชื่อมทุกเมนู =================

  void selectMenu(String menuName) {
    setState(() {
      selectedMenu = menuName;
    });

    switch (menuName) {
      case 'หน้าแรก':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        break;

      case 'ข้อมูลพนักงาน':
        break;

      case 'เวลาเข้างาน':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AttendancePage(),
          ),
        );
        break;

      case 'การลา':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LeavePage(),
          ),
        );
        break;

      case 'เงินเดือน':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PayrollPage(),
          ),
        );
        break;

      case 'กำลังคน':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ManpowerPage(),
          ),
        );
        break;

      case 'รับสมัครพนักงาน':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RecruitmentPage(),
          ),
        );
        break;

      case 'การอบรม':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TrainingPage(),
          ),
        );
        break;

      case 'สวัสดิการ':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WelfarePage(),
          ),
        );
        break;

      case 'การประเมินผลงาน':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppraisalPage(),
          ),
        );
        break;
    }
  }

  // ================= ADD / EDIT =================

  void showEmployeeForm({Employee? employee}) {
    final nameController =
        TextEditingController(text: employee?.name ?? '');

    final idController =
        TextEditingController(text: employee?.id ?? '');

    final salaryController =
        TextEditingController(text: employee?.salary ?? '');

    String department = employee?.department ?? 'IT';
    String position = employee?.position ?? 'Developer';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            employee == null
                ? 'Add Employee'
                : 'Edit Employee',
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: 'Employee ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  initialValue: department,
                  decoration: const InputDecoration(
                    labelText: 'Department',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    'IT',
                    'HR',
                    'Sales',
                    'Accounting',
                  ].map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      department = value;
                    }
                  },
                ),

                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  initialValue: position,
                  decoration: const InputDecoration(
                    labelText: 'Position',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    'Developer',
                    'HR Staff',
                    'Sales',
                    'Accountant',
                  ].map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      position = value;
                    }
                  },
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: salaryController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Salary',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    idController.text.isEmpty) {
                  return;
                }

                setState(() {
                  if (employee == null) {
                    employees.add(
                      Employee(
                        id: idController.text,
                        name: nameController.text,
                        department: department,
                        position: position,
                        salary: salaryController.text,
                        startDate: '07/10/2026',
                        status: 'Active',
                        history: [
                          '2026 - $position - '
                          '${salaryController.text} บาท',
                        ],
                      ),
                    );
                  } else {
                    employee.name = nameController.text;
                    employee.id = idController.text;
                    employee.department = department;
                    employee.position = position;
                    employee.salary = salaryController.text;
                  }
                });

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // ================= DETAIL =================

  void showEmployeeDetail(Employee employee) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(employee.name),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Employee ID: ${employee.id}'),
                Text('Department: ${employee.department}'),
                Text('Position: ${employee.position}'),
                Text('Salary: ${employee.salary} บาท'),
                Text('Start Date: ${employee.startDate}'),

                const SizedBox(height: 10),

                Text(
                  'Status: ${employee.status}',
                  style: TextStyle(
                    color: employee.status == 'Active'
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Divider(),

                const Text(
                  'Employment History',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                ...employee.history.map(
                  (history) => Padding(
                    padding:
                        const EdgeInsets.only(bottom: 6),
                    child: Text('• $history'),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                showChangePosition(employee);
              },
              child: const Text('ปรับตำแหน่ง'),
            ),

            TextButton(
              onPressed: () {
                setState(() {
                  employee.status = 'Resigned';
                });

                Navigator.pop(context);
              },
              child: const Text(
                'พ้นสภาพ',
                style: TextStyle(color: Colors.red),
              ),
            ),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ปิด'),
            ),
          ],
        );
      },
    );
  }

  // ================= CHANGE POSITION =================

  void showChangePosition(Employee employee) {
    String newPosition = employee.position;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ปรับตำแหน่ง'),

          content: DropdownButtonFormField<String>(
            initialValue: newPosition,
            decoration: const InputDecoration(
              labelText: 'ตำแหน่งใหม่',
              border: OutlineInputBorder(),
            ),
            items: [
              'Developer',
              'Senior Developer',
              'Manager',
              'HR Staff',
              'Sales',
              'Accountant',
            ].map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                newPosition = value;
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
                  employee.history.insert(
                    0,
                    '2026 - ${employee.position} → '
                    '$newPosition',
                  );

                  employee.position = newPosition;
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

  // ================= BUILD =================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  content: Text(
                    'ยังไม่มีการแจ้งเตือนใหม่',
                  ),
                  backgroundColor: primaryBlue,
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

          // ================= SIDEBAR =================

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
                        ),

                        _menuItem(
                          icon: Icons.people_outline,
                          title: 'ข้อมูลพนักงาน',
                        ),

                        _menuItem(
                          icon: Icons.access_time,
                          title: 'เวลาเข้างาน',
                        ),

                        _menuItem(
                          icon:
                              Icons.calendar_month_outlined,
                          title: 'การลา',
                        ),

                        _menuItem(
                          icon: Icons.payments_outlined,
                          title: 'เงินเดือน',
                        ),

                        _menuItem(
                          icon: Icons.groups_outlined,
                          title: 'กำลังคน',
                        ),

                        _menuItem(
                          icon:
                              Icons.person_add_alt_1_outlined,
                          title: 'รับสมัครพนักงาน',
                        ),

                        _menuItem(
                          icon: Icons.school_outlined,
                          title: 'การอบรม',
                        ),

                        _menuItem(
                          icon:
                              Icons.card_giftcard_outlined,
                          title: 'สวัสดิการ',
                        ),

                        _menuItem(
                          icon:
                              Icons.assessment_outlined,
                          title: 'การประเมินผลงาน',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          // ================= CONTENT =================

          Expanded(
            child: Container(
              color: const Color(0xFFF5F8FC),
              padding: const EdgeInsets.all(25),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Row(
                    children: [

                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            Text(
                              'ข้อมูลพนักงาน',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight:
                                    FontWeight.bold,
                                color: textDark,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'เพิ่ม แก้ไข ค้นหา และจัดการข้อมูลพนักงาน',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton.icon(
                        onPressed: () =>
                            showEmployeeForm(),
                        icon: const Icon(Icons.add),
                        label:
                            const Text('Add Employee'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [

                      Expanded(
                        child: TextField(
                          controller:
                              searchController,
                          onChanged: (_) =>
                              setState(() {}),

                          decoration:
                              InputDecoration(
                            hintText:
                                'Search employee...',
                            prefixIcon:
                                const Icon(
                              Icons.search,
                            ),
                            filled: true,
                            fillColor: Colors.white,

                            border:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                10,
                              ),
                              borderSide:
                                  BorderSide.none,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      SizedBox(
                        width: 170,

                        child:
                            DropdownButtonFormField<
                                String>(
                          isExpanded: true,
                          initialValue:
                              selectedDepartment,

                          decoration:
                              InputDecoration(
                            labelText:
                                'Department',
                            filled: true,
                            fillColor:
                                Colors.white,

                            border:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(10),
                              borderSide:
                                  BorderSide.none,
                            ),
                          ),

                          items: [
                            'All',
                            'IT',
                            'HR',
                            'Sales',
                            'Accounting',
                          ].map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),

                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedDepartment =
                                    value;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: Card(
                      child: ListView.separated(
                        itemCount:
                            filteredEmployees.length,

                        separatorBuilder:
                            (_, _) => const Divider(
                          height: 1,
                        ),

                        itemBuilder:
                            (context, index) {

                          final employee =
                              filteredEmployees[
                                  index];

                          return ListTile(
                            contentPadding:
                                const EdgeInsets
                                    .symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),

                            leading: CircleAvatar(
                              backgroundColor:
                                  lightBlue,

                              child: Text(
                                employee.name
                                    .substring(0, 1),

                                style:
                                    const TextStyle(
                                  color:
                                      primaryBlue,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ),

                            title: Text(
                              employee.name,
                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            subtitle: Text(
                              '${employee.id} • '
                              '${employee.department} • '
                              '${employee.position}',
                            ),

                            trailing: Row(
                              mainAxisSize:
                                  MainAxisSize.min,

                              children: [

                                Chip(
                                  label: Text(
                                    employee.status,
                                  ),

                                  backgroundColor:
                                      employee.status ==
                                              'Active'
                                          ? Colors
                                              .green
                                              .shade100
                                          : Colors
                                              .red
                                              .shade100,
                                ),

                                IconButton(
                                  icon: const Icon(
                                    Icons.visibility,
                                  ),

                                  onPressed: () {
                                    showEmployeeDetail(
                                      employee,
                                    );
                                  },
                                ),

                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                  ),

                                  onPressed: () {
                                    showEmployeeForm(
                                      employee:
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

  // ================= MENU =================

  Widget _menuItem({
    required IconData icon,
    required String title,
  }) {
    final selected =
        selectedMenu == title;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      ),

      child: Material(
        color: selected ? primaryBlue : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          onTap: () => selectMenu(title),
          leading: Icon(
            icon,
            color: selected ? Colors.white : Colors.grey.shade700,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : textDark,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}