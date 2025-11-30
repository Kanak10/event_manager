import 'package:event_manager/UI/screens/auth_screen/local_widget/signin_form.dart';
import 'package:event_manager/UI/screens/auth_screen/local_widget/signup_form.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w400),
              indicatorColor: Colors.black,
              tabs: const [
                Tab(text: "Sign In"),
                Tab(text: "Sign Up"),
              ],
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  SigninForm(),
                  SignupForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
