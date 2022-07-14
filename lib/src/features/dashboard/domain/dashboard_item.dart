import 'package:flutter/material.dart';

enum DashboardStatus { enabled, disabled }

class DashboardItem {
  int id;
  String name;
  IconData icon;
  String? path;
  DashboardStatus status;

  DashboardItem({
    required this.id,
    required this.name,
    required this.icon,
    this.path,
    status,
  }) : status = status ?? DashboardStatus.disabled;
}
