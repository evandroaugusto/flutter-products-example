import 'package:app_referencia/src/features/dashboard/domain/dashboard_item.dart';

abstract class DashboardRepository {
  Future<List<DashboardItem>> fetchDashboard();
}
