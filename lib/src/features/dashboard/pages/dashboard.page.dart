import 'package:app_referencia/src/features/dashboard/pages/dashboard_card.widget.dart';
import 'package:flutter/material.dart';
import '../api//mock/fetch_dashboard.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: GridView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3 / 2.2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: mockDashboardData
            .map((item) => Center(child: DashboardCard(item: item)))
            .toList(),
      ),
    );
  }
}
