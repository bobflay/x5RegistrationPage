import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x5registrationpage/Controllers/DashboardController.dart';
import 'package:x5registrationpage/Routes/AppRoute.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardController _controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(
          child: Text(
            "Dashboard",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[],
        ),
      ),
      drawer: Drawer(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          ElevatedButton(
              onPressed: () {
                _controller.logout();
              },
              child: Text('Logout'))
        ]),
      ),
    );
  }
}
