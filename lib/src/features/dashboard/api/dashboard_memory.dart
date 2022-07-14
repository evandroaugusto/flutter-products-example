import 'package:app_referencia/src/features/dashboard/domain/dashboard_item.dart';
import 'package:app_referencia/src/features/dashboard/domain/dashboard_repository.dart';
import 'package:app_referencia/src/features/dashboard/api/mock/fetch_dashboard.dart';

class DashbardMemory implements DashboardRepository {
  @override
  Future<List<DashboardItem>> fetchDashboard() async {
    Future.delayed(const Duration(seconds: 4));

    return mockDashboardData;
  }
}
