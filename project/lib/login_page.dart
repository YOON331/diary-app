import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/find_id_page.dart';
import 'package:project/find_pw_page.dart';
import 'package:project/main_page.dart';
import 'package:project/register_page.dart';

class LoginListPage extends StatefulWidget {
  const LoginListPage({super.key});

  @override
  State<LoginListPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'ID',
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          // 아이디 찾기 화면 이동
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const FindIDPage();
                          }));
                        },
                        child: const Text("find ID")),
                    TextButton(
                        onPressed: () {
                          // pw 찾기 화면 이동
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const FindPWPage();
                          }));
                        },
                        child: const Text("find Password")),
                    TextButton(
                        onPressed: () {
                          // 회원가입 화면 이동
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const RegisterPage();
                          }));
                        },
                        child: const Text("Register")),
                  ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: FilledButton(
          onPressed: () {
            // 로그인 로직 추가

            // 메인 화면 이동
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const MainPage();
            }));
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
