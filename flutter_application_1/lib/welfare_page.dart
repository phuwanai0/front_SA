import 'package:flutter/material.dart';

import 'home_page.dart';
import 'employees_page.dart';
import 'attendance_page.dart';
import 'leave_page.dart';
import 'payroll_page.dart';
import 'manpower_page.dart';
import 'recruitment_page.dart';
import 'training_page.dart';

import 'appraisal_page.dart';

class WelfarePage extends StatefulWidget {
  const WelfarePage({super.key});

  @override
  State<WelfarePage> createState() => _WelfarePageState();
}

class _WelfarePageState extends State<WelfarePage> {
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color darkBlue = Color(0xFF0D47A1);
  static const Color lightBlue = Color(0xFFEAF4FF);
  static const Color textDark = Color(0xFF263238);

  bool showMenu = true;
  String selectedMenu = 'สวัสดิการ';

  double limit = 15000;
  double used = 3500;

  String status = 'รออนุมัติ';

  final amountController = TextEditingController();

  double get remaining => limit - used;

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  void selectMenu(String menuName) {
    if (menuName == 'สวัสดิการ') {
      setState(() {
        selectedMenu = menuName;
      });
      return;
    }

    switch (menuName) {
      case 'หน้าแรก':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
        break;

      case 'ข้อมูลพนักงาน':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EmployeesPage()),
        );
        break;

      case 'เวลาเข้างาน':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AttendancePage()),
        );
        break;

      case 'การลา':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const LeavePage()),
        );
        break;

      case 'เงินเดือน':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PayrollPage()),
        );
        break;

      case 'กำลังคน':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ManpowerPage()),
        );
        break;

      case 'รับสมัครพนักงาน':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const RecruitmentPage()),
        );
        break;

      case 'การอบรม':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TrainingPage()),
        );
        break;

      case 'สวัสดิการ':
        break;

      case 'การประเมินผลงาน':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AppraisalPage()),
        );
        break;
    }
  }

  Widget menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool selected = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: selected ? primaryBlue : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: onTap,
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
    );
  }

  void claim() {
    final amount = double.tryParse(amountController.text) ?? 0;

    if (amount <= 0 || amount > remaining) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('จำนวนเงินไม่ถูกต้อง'),
        ),
      );
      return;
    }

    setState(() {
      used += amount;
      status = 'รออนุมัติ';
      amountController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('ส่งคำร้องเรียบร้อย'),
      ),
    );
  }

  void approve() {
    setState(() {
      status = 'อนุมัติแล้ว';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('อนุมัติคำร้องเรียบร้อย'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      // ================= TOP BAR =================
      appBar: AppBar(
        backgroundColor: darkBlue,
        foregroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: Icon(
            showMenu ? Icons.menu_open : Icons.menu,
          ),
          onPressed: () {
            setState(() {
              showMenu = !showMenu;
            });
          },
        ),

        title: const Text(
          'ระบบบริหารจัดการพนักงาน',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('ยังไม่มีการแจ้งเตือนใหม่'),
                ),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(
                  Icons.person,
                  color: darkBlue,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('ข้อมูลผู้ใช้งาน'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      // ================= BODY =================
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
                    height: 90,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: lightBlue,
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFE0E0E0),
                        ),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.business,
                          color: primaryBlue,
                          size: 32,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'ระบบจัดการพนักงาน',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: darkBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      children: [
                        menuItem(
                          icon: Icons.home,
                          title: 'หน้าแรก',
                          selected: selectedMenu == 'หน้าแรก',
                          onTap: () => selectMenu('หน้าแรก'),
                        ),

                        menuItem(
                          icon: Icons.people,
                          title: 'ข้อมูลพนักงาน',
                          selected: selectedMenu == 'ข้อมูลพนักงาน',
                          onTap: () => selectMenu('ข้อมูลพนักงาน'),
                        ),

                        menuItem(
                          icon: Icons.access_time,
                          title: 'เวลาเข้างาน',
                          selected: selectedMenu == 'เวลาเข้างาน',
                          onTap: () => selectMenu('เวลาเข้างาน'),
                        ),

                        menuItem(
                          icon: Icons.event_busy,
                          title: 'การลา',
                          selected: selectedMenu == 'การลา',
                          onTap: () => selectMenu('การลา'),
                        ),

                        menuItem(
                          icon: Icons.payments,
                          title: 'เงินเดือน',
                          selected: selectedMenu == 'เงินเดือน',
                          onTap: () => selectMenu('เงินเดือน'),
                        ),

                        menuItem(
                          icon: Icons.groups,
                          title: 'กำลังคน',
                          selected: selectedMenu == 'กำลังคน',
                          onTap: () => selectMenu('กำลังคน'),
                        ),

                        menuItem(
                          icon: Icons.person_add,
                          title: 'รับสมัครพนักงาน',
                          selected: selectedMenu == 'รับสมัครพนักงาน',
                          onTap: () => selectMenu('รับสมัครพนักงาน'),
                        ),

                        menuItem(
                          icon: Icons.school,
                          title: 'การอบรม',
                          selected: selectedMenu == 'การอบรม',
                          onTap: () => selectMenu('การอบรม'),
                        ),

                        menuItem(
                          icon: Icons.card_giftcard,
                          title: 'สวัสดิการ',
                          selected: selectedMenu == 'สวัสดิการ',
                          onTap: () => selectMenu('สวัสดิการ'),
                        ),

                        menuItem(
                          icon: Icons.assessment,
                          title: 'การประเมินผลงาน',
                          selected: selectedMenu == 'การประเมินผลงาน',
                          onTap: () => selectMenu('การประเมินผลงาน'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          // ================= CONTENT =================
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: lightBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.card_giftcard,
                          color: primaryBlue,
                          size: 30,
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ระบบสวัสดิการ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: textDark,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'จัดการสิทธิ์และการเบิกสวัสดิการของพนักงาน',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ================= ประเภทสวัสดิการ =================
                  const Text(
                    'ประเภทสวัสดิการ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    elevation: 1,
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: lightBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.local_hospital,
                          color: primaryBlue,
                        ),
                      ),
                      title: const Text(
                        'ค่ารักษาพยาบาล',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        'วงเงิน 15,000 บาท / ปี',
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ================= วงเงิน =================
                  const Text(
                    'วงเงินคงเหลือ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: _infoCard(
                          title: 'วงเงินทั้งหมด',
                          value: '${limit.toStringAsFixed(0)} บาท',
                          icon: Icons.account_balance_wallet,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: _infoCard(
                          title: 'ใช้ไปแล้ว',
                          value: '${used.toStringAsFixed(0)} บาท',
                          icon: Icons.payments,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: _infoCard(
                          title: 'คงเหลือ',
                          value: '${remaining.toStringAsFixed(0)} บาท',
                          icon: Icons.savings,
                          valueColor: Colors.green,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ================= CLAIM =================
                  const Text(
                    'ยื่นคำร้องเบิก / Claim',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextField(
                            controller: amountController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'จำนวนเงินที่ต้องการเบิก',
                              prefixIcon: Icon(
                                Icons.payments,
                              ),
                              suffixText: 'บาท',
                              border: OutlineInputBorder(),
                            ),
                          ),

                          const SizedBox(height: 12),

                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: claim,
                              icon: const Icon(Icons.send),
                              label: const Text('ส่งคำร้อง'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryBlue,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ================= STATUS =================
                  const Text(
                    'สถานะคำร้อง',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: status == 'อนุมัติแล้ว'
                            ? Colors.green.shade100
                            : Colors.orange.shade100,
                        child: Icon(
                          status == 'อนุมัติแล้ว'
                              ? Icons.check_circle
                              : Icons.pending,
                          color: status == 'อนุมัติแล้ว'
                              ? Colors.green
                              : Colors.orange,
                        ),
                      ),
                      title: const Text(
                        'สถานะคำร้อง',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(status),
                      ),
                      trailing: status == 'รออนุมัติ'
                          ? ElevatedButton(
                              onPressed: approve,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('อนุมัติ'),
                            )
                          : const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 30,
                            ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ================= REPORT =================
                  const Text(
                    'รายงานการใช้สิทธิ์',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: lightBlue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.bar_chart,
                              color: primaryBlue,
                              size: 32,
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'สรุปการใช้สิทธิ์',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  'ใช้ไป ${used.toStringAsFixed(0)} บาท '
                                  'จาก ${limit.toStringAsFixed(0)} บาท',
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  'คงเหลือ ${remaining.toStringAsFixed(0)} บาท',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                LinearProgressIndicator(
                                  value: limit == 0 ? 0 : used / limit,
                                  minHeight: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundColor: Colors.grey.shade200,
                                  color: primaryBlue,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard({
    required String title,
    required String value,
    required IconData icon,
    Color? valueColor,
  }) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: primaryBlue,
              size: 28,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: valueColor ?? textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}