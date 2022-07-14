import 'package:app_referencia/src/features/dashboard/domain/dashboard_item.dart';
import 'package:app_referencia/src/features/products/products.routes.dart';
import 'package:app_referencia/src/features/users/users.routes.dart';
import 'package:flutter/material.dart';

final List<DashboardItem> mockDashboardData = [
  DashboardItem(
    id: 1,
    icon: Icons.shopping_cart,
    name: 'Produtos',
    path: ProductsRoutes.products,
    status: DashboardStatus.enabled,
  ),
  DashboardItem(
    id: 2,
    icon: Icons.people,
    name: 'Usuários',
    path: UserRoutes.users,
    status: DashboardStatus.enabled,
  ),
  DashboardItem(
    id: 3,
    icon: Icons.list_alt_outlined,
    name: 'Relatórios',
  ),
  DashboardItem(
    id: 3,
    icon: Icons.notifications_active,
    name: 'Notificações',
  ),
  DashboardItem(
    id: 3,
    icon: Icons.settings,
    name: 'Configuração',
  ),
];
