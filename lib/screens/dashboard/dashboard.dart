import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AtDashboardScreen extends StatefulWidget {
  const AtDashboardScreen({super.key});

  @override
  State<AtDashboardScreen> createState() => _AtDashboardScreenState();
}

class _AtDashboardScreenState extends State<AtDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('dashboard'),
    );
  }
}
