import 'package:flutter/material.dart';


import 'employees_page.dart';
import 'attendance_page.dart';
import 'leave_page.dart';
import 'payroll_page.dart';
import 'manpower_page.dart';
import 'recruitment_page.dart';
import 'training_page.dart';
import 'welfare_page.dart';
import 'appraisal_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color lightBlue = Color(0xFFEAF4FF);
  static const Color textDark = Color(0xFF263238);

  String selectedMenu = 'หน้าแรก';
  bool showMenu = true;

  void selectMenu(String menuName) {
    switch (menuName) {
      case 'หน้าแรก':
        if (ModalRoute.of(context)?.settings.name != '/') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const HomePage(),
            ),
          );
        }
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AppraisalPage(),
          ),
        );
        break;
    }

    setState(() {
      selectedMenu = menuName;
    });
  }

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

              child: SingleChildScrollView(
                padding: const EdgeInsets.all(30),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      'หน้าแรก',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: textDark,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'ภาพรวมระบบบริหารจัดการพนักงาน',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(25),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),

                      child: const Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: lightBlue,

                            child: Icon(
                              Icons.person,
                              size: 35,
                              color: primaryBlue,
                            ),
                          ),

                          SizedBox(width: 20),

                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [
                              Text(
                                'ยินดีต้อนรับ 👋',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                'ระบบบริหารจัดการพนักงาน',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'เมนูหลัก',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(),

                      children: [
                        _homeCard(
                          icon: Icons.people_outline,
                          title: 'ข้อมูลพนักงาน',
                          description: 'ดูข้อมูลพนักงาน',
                          onTap: () {
                            selectMenu('ข้อมูลพนักงาน');
                          },
                        ),

                        _homeCard(
                          icon: Icons.access_time,
                          title: 'เวลาเข้างาน',
                          description: 'ดูเวลาเข้าและเลิกงาน',
                          onTap: () {
                            selectMenu('เวลาเข้างาน');
                          },
                        ),

                        _homeCard(
                          icon: Icons.calendar_month_outlined,
                          title: 'การลา',
                          description: 'ขอลาและดูประวัติการลา',
                          onTap: () {
                            selectMenu('การลา');
                          },
                        ),

                        _homeCard(
                          icon: Icons.payments_outlined,
                          title: 'เงินเดือน',
                          description: 'ดูข้อมูลเงินเดือน',
                          onTap: () {
                            selectMenu('เงินเดือน');
                          },
                        ),

                        _homeCard(
                          icon: Icons.groups_outlined,
                          title: 'กำลังคน',
                          description: 'ดูข้อมูลกำลังคน',
                          onTap: () {
                            selectMenu('กำลังคน');
                          },
                        ),

                        _homeCard(
                          icon: Icons.person_add_alt_1_outlined,
                          title: 'รับสมัครพนักงาน',
                          description: 'จัดการการรับสมัคร',
                          onTap: () {
                            selectMenu('รับสมัครพนักงาน');
                          },
                        ),

                        _homeCard(
                          icon: Icons.school_outlined,
                          title: 'การอบรม',
                          description: 'ดูหลักสูตรการอบรม',
                          onTap: () {
                            selectMenu('การอบรม');
                          },
                        ),

                        _homeCard(
                          icon: Icons.card_giftcard_outlined,
                          title: 'สวัสดิการ',
                          description: 'ดูสวัสดิการพนักงาน',
                          onTap: () {
                            selectMenu('สวัสดิการ');
                          },
                        ),

                        _homeCard(
                          icon: Icons.assessment_outlined,
                          title: 'การประเมินผลงาน',
                          description: 'ดูและทำแบบประเมิน',
                          onTap: () {
                            selectMenu('การประเมินผลงาน');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
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

  Widget _homeCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(15),

      child: Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Icon(
              icon,
              size: 40,
              color: primaryBlue,
            ),

            const SizedBox(height: 15),

            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              description,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}