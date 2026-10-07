import 'package:flutter/material.dart';
import 'home_page.dart';

// ======================================================
// LOGIN PAGE
// ======================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// ======================================================
// LOGIN PAGE STATE
// ======================================================

class _LoginPageState extends State<LoginPage> {
  // ====================================================
  // CONTROLLER
  // ใช้สำหรับอ่านค่าที่ผู้ใช้พิมพ์ใน TextField
  // ====================================================

  // Controller ของ Username
  final usernameController = TextEditingController();

  // Controller ของ Password
  final passwordController = TextEditingController();

  // ====================================================
  // FOCUS NODE
  // ใช้ควบคุมว่า Cursor อยู่ที่ช่องไหน
  // ====================================================

  // Focus ของช่อง Username
  final usernameFocus = FocusNode();

  // Focus ของช่อง Password
  final passwordFocus = FocusNode();

  // ====================================================
  // VARIABLE
  // ====================================================

  // ใช้ตรวจว่า Remember Me ถูกเลือกหรือไม่
  bool rememberMe = false;

  // ใช้ควบคุมว่าจะแสดง Password หรือซ่อน Password
  bool obscurePassword = true;

  // ====================================================
  // LOGIN FUNCTION
  // ====================================================

  void login() {
    // อ่าน Username ที่ผู้ใช้กรอก
    String username = usernameController.text.trim();

    // อ่าน Password ที่ผู้ใช้กรอก
    String password = passwordController.text.trim();

    // ==================================================
    // ตรวจสอบว่ากรอกข้อมูลครบหรือไม่
    // ==================================================

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('กรุณากรอก Username และ Password')),
      );

      // หยุดการทำงาน
      return;
    }

    // ==================================================
    // ตรวจสอบ Username และ Password
    //
    // ตอนนี้เป็นข้อมูลตัวอย่าง
    // ยังไม่ได้เชื่อม Database
    //
    // Username = admin
    // Password = 123456
    // ==================================================

    if (username == 'admin' &&
        password == '123456') {

      // ========================================
      // LOGIN สำเร็จ
      // ========================================

      Navigator.pushReplacement(

        context,

        MaterialPageRoute(
          builder: (context) =>
              const HomePage(),
        ),
      );

    } else {

      // ========================================
      // LOGIN ไม่สำเร็จ
      // ========================================

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(

          backgroundColor: Colors.red,

          content: Text(
            'Username หรือ Password ไม่ถูกต้อง',
          ),
        ),
      );
    }
  }

  // ====================================================
  // DISPOSE
  // ล้าง Controller และ FocusNode เมื่อปิดหน้า
  // ====================================================

  @override
  void dispose() {
    // ล้าง Username Controller
    usernameController.dispose();

    // ล้าง Password Controller
    passwordController.dispose();

    // ล้าง Username Focus
    usernameFocus.dispose();

    // ล้าง Password Focus
    passwordFocus.dispose();

    super.dispose();
  }

  // ====================================================
  // BUILD UI
  // ====================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =================================================
      // BODY
      // =================================================
      body: Container(
        // ให้ Container กว้างเต็มหน้าจอ
        width: double.infinity,

        // ให้ Container สูงเต็มหน้าจอ
        height: double.infinity,

        // =================================================
        // BACKGROUND
        // =================================================
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // จุดเริ่มต้นของ Gradient
            begin: Alignment.topLeft,

            // จุดสิ้นสุดของ Gradient
            end: Alignment.bottomRight,

            colors: [
              // สีครีม
              Color(0xFFFFF7E8),

              // สีฟ้าอ่อน
              Color(0xFFE8F5FF),

              // สีฟ้า
              Color(0xFFBFE1FF),
            ],
          ),
        ),

        // =================================================
        // CENTER
        // =================================================
        child: Center(
          // ทำให้หน้าสามารถ Scroll ได้
          // โดยเฉพาะเวลาคีย์บอร์ดเปิด
          child: SingleChildScrollView(
            child: Container(
              // ความกว้างของ Login Box
              width: 380,

              // ระยะห่างด้านใน
              padding: const EdgeInsets.all(30),

              // =================================================
              // COLUMN
              // เรียง Widget จากบนลงล่าง
              // =================================================
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text(
                    '3C GROUP',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF159BD7),
                    ),
                  ),

                  const SizedBox(height: 5),
                  // =================================================
                  // ICON
                  // =================================================
                  const Icon(
                    Icons.groups,

                    // ขนาด Icon
                    size: 110,

                    // สี Icon
                    color: Color(0xFF159BD7),
                  ),

                  // ช่องว่าง
                  const SizedBox(height: 20),

                  // =================================================
                  // USERNAME
                  // =================================================
                  TextField(
                    // เชื่อมกับ Username Controller
                    controller: usernameController,

                    // เชื่อมกับ Username Focus
                    focusNode: usernameFocus,

                    // หน้าตาของช่อง
                    decoration: InputDecoration(
                      // ข้อความที่แสดงตอนยังไม่ได้พิมพ์
                      hintText: 'USERNAME',

                      // Icon ด้านซ้าย
                      prefixIcon: const Icon(Icons.person),

                      // ให้ช่องมีพื้นหลัง
                      filled: true,

                      // สีพื้นหลัง
                      fillColor: Colors.white,

                      // รูปแบบขอบ
                      border: OutlineInputBorder(
                        // ทำขอบมน
                        borderRadius: BorderRadius.circular(30),

                        // ไม่มีเส้นขอบ
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  // ช่องว่างระหว่าง Username กับ Password
                  const SizedBox(height: 15),

                  // =================================================
                  // PASSWORD
                  // =================================================
                  TextField(
                    // เชื่อมกับ Password Controller
                    controller: passwordController,

                    // เชื่อมกับ Password Focus
                    focusNode: passwordFocus,

                    // ถ้า true จะซ่อน Password
                    obscureText: obscurePassword,

                    // หน้าตาของ Password
                    decoration: InputDecoration(
                      // ข้อความตอนยังไม่ได้พิมพ์
                      hintText: 'PASSWORD',

                      // Icon รูปกุญแจด้านซ้าย
                      prefixIcon: const Icon(Icons.lock),

                      // =================================================
                      // ปุ่มรูปตา
                      // =================================================
                      suffixIcon: IconButton(
                        // ถ้า Password ถูกซ่อน
                        // ให้แสดง visibility_off
                        //
                        // ถ้า Password แสดงอยู่
                        // ให้แสดง visibility
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),

                        // เมื่อกดปุ่มตา
                        onPressed: () {
                          // บอก Flutter ให้สร้างหน้าจอใหม่
                          setState(() {
                            // เปลี่ยน true เป็น false
                            // หรือ false เป็น true
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),

                      // ให้ช่องมีพื้นหลัง
                      filled: true,

                      // สีพื้นหลัง
                      fillColor: Colors.white,

                      // รูปแบบขอบ
                      border: OutlineInputBorder(
                        // ขอบมน
                        borderRadius: BorderRadius.circular(30),

                        // ไม่มีเส้นขอบ
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  // ช่องว่าง
                  const SizedBox(height: 10),

                  // =================================================
                  // REMEMBER ME + FORGOT PASSWORD
                  // =================================================
                  Row(
                    children: [
                      // Checkbox
                      Checkbox(
                        // สถานะของ Checkbox
                        value: rememberMe,

                        // ทำงานเมื่อกด Checkbox
                        onChanged: (value) {
                          setState(() {
                            // เปลี่ยนค่า Checkbox
                            rememberMe = value ?? false;
                          });
                        },
                      ),

                      // ข้อความ Remember me
                      const Text('Remember me', style: TextStyle(fontSize: 12)),

                      // ดัน Forgot Password ไปทางขวา
                      const Spacer(),

                      // Forgot Password
                      TextButton(
                        onPressed: () {
                          // ตอนนี้ยังไม่ได้ทำ
                          // Forgot Password
                        },

                        child: const Text(
                          'Forgot password?',

                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),

                  // ช่องว่างก่อนปุ่ม Login
                  const SizedBox(height: 10),

                  // =================================================
                  // LOGIN BUTTON
                  // =================================================
                  SizedBox(
                    // ความกว้างปุ่ม
                    width: 150,

                    // ความสูงปุ่ม
                    height: 45,

                    child: ElevatedButton(
                      // เมื่อกดปุ่ม
                      // ให้เรียกฟังก์ชัน login()
                      onPressed: login,

                      // รูปแบบปุ่ม
                      style: ElevatedButton.styleFrom(
                        // สีปุ่ม
                        backgroundColor: const Color(0xFF159BD7),

                        // สีตัวหนังสือ
                        foregroundColor: Colors.white,

                        // ทำปุ่มให้มน
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),

                      // ข้อความบนปุ่ม
                      child: const Text(
                        'LOGIN',

                        style: TextStyle(
                          // ขนาดตัวหนังสือ
                          fontSize: 16,

                          // ตัวหนา
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 