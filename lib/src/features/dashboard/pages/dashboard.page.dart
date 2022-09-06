import 'package:app_referencia/src/core/store/authentication/authentication.state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/store/authentication/authentication.store.dart';
import '../api//mock/fetch_dashboard.dart';
import 'dashboard_card.widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          Consumer<AuthenticationStore>(builder: (context, store, child) {
            return IconButton(
                onPressed: () {
                  store.logout();
                },
                icon: const Icon(Icons.exit_to_app));
          }),
          const SizedBox(
            width: 10,
          )
        ],
      ),
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
