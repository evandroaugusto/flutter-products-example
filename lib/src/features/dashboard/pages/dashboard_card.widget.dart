import 'package:flutter/material.dart';
import '../models/dashboard_item.dart';

class DashboardCard extends StatelessWidget {
  final DashboardItem item;
  const DashboardCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.grey.shade300,
        onTap: () => {
          if (item.path != null) {Navigator.pushNamed(context, item.path!)}
        },
        child: Opacity(
          opacity: item.status == DashboardStatus.disabled ? 0.5 : 1,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade400.withOpacity(0.5),
                  Colors.grey.shade300,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Icon(item.icon, size: 32, color: Colors.grey.shade700),
                const SizedBox(height: 5),
                Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
