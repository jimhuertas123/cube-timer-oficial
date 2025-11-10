import 'package:cube_timer_oficial/core/constants/menu/menu_navigation_action.dart';
import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../icons/custom_icons.dart';

class MenuOptions {
  final int actualOption;

  MenuOptions({required this.actualOption});

  MenuOptions copyWith({int? actualOption, List<MenuItem>? options}) =>
      MenuOptions(actualOption: actualOption ?? this.actualOption);
}

class MenuItem {
  final int id;
  final String title;
  final String subtitle;
  final NavigationAction action;
  final IconData icon;
  final List<MenuItem>? children;

  const MenuItem({
    required this.id,
    required this.title,
    this.subtitle = "none",
    required this.action,
    required this.icon,
    this.children,
  });
}

///VARIABLES...
//extras icons
final Image iconOll = Image.asset(
  'assets/icons/oll_black.png',
  color: Colors.black54,
  fit: BoxFit.cover,
  width: 20,
  height: 20,
);
final Image iconPll = Image.asset(
  'assets/icons/pll_black.png',
  color: Colors.black54,
  fit: BoxFit.cover,
  width: 20,
  height: 20,
);
final Image headerDrawer = Image.asset(
  'assets/icons/menu_header.png',
  fit: BoxFit.fitWidth,
  width: double.infinity,
  alignment: AlignmentGeometry.bottomCenter,
);

///SideMenuBar include every icon, title and link to the page
final appMenuScreensItems = <MenuItem>[
  MenuItem(
    id: 0,
    // title: 'Cronómetro',
    title: 'Timer',
    action: NavigationAction.goToTimerRoute,
    icon: isIOSDevice ? CupertinoIcons.stopwatch : Icons.timer_outlined,
    // children: **NO TIENE childrens**
  ),

  MenuItem(
    id: 1,
    // title: 'Entrenamiento',
    title: 'Trainer',
    action: NavigationAction.none,
    icon: isIOSDevice
        ? CupertinoIcons.game_controller
        : Icons.control_camera_outlined,
    children: const <MenuItem>[
      MenuItem(
        id: 2,
        title: 'OLL',
        action: NavigationAction.goToOLLTimerRoute,
        icon: CubeIcon.oll_black,
      ),
      MenuItem(
        id: 3,
        title: 'PLL',
        action: NavigationAction.goToPLLTimerRoute,
        icon: CubeIcon.pll_black,
      ),
    ],
  ),
  //Algorithm options
  MenuItem(
    id: 4,
    // title: 'Algoritmos',
    title: 'Algorithms',
    action: NavigationAction.none,
    icon: isIOSDevice ? CupertinoIcons.news : Icons.library_books_outlined,
    children: const <MenuItem>[
      MenuItem(
        id: 5,
        title: 'OLL',
        action: NavigationAction.goToOLLAlgorithmsRoute,
        icon: CubeIcon.oll_black,
      ),
      MenuItem(
        id: 6,
        title: 'PLL',
        action: NavigationAction.goToPLLAlgorithmsRoute,
        icon: CubeIcon.pll_black,
      ),
    ],
  ),
];

final appMenuOthers = <MenuItem>[
  MenuItem(
    id: 8,
    // title: 'Exportar/Importar',
    title: 'Export/Import',
    action: NavigationAction.openImportExportDialog,
    icon: isIOSDevice ? CupertinoIcons.folder : Icons.folder_outlined,
  ),
  const MenuItem(
    id: 9,
    // title: 'Tema de la Aplicación',
    title: 'App Theme',
    action: NavigationAction.openAppThemeDialog,
    icon: Icons.palette_outlined,
  ),
  MenuItem(
    id: 10,
    // title: 'Esquema de Colores',
    title: 'Color Scheme',
    action: NavigationAction.openColorSchemaDialog,
    icon: isIOSDevice ? CupertinoIcons.paintbrush : Icons.format_paint_outlined,
  ),
];

final appMenufinalItems = <MenuItem>[
  MenuItem(
    id: 11,
    // title: 'Ajustes',
    title: 'Settings',
    action: NavigationAction.openSettingsRoute,
    icon: isIOSDevice ? CupertinoIcons.gear : Icons.settings_outlined,
  ),
  MenuItem(
    id: 12,
    // title: 'Donar',
    title: 'Donate',
    action: NavigationAction.openDonateDialog,
    icon: isIOSDevice ? CupertinoIcons.heart : Icons.favorite_outline,
  ),
  MenuItem(
    id: 13,
    // title: 'Acerca de y comentarios',
    title: 'About and Feedback',
    action: NavigationAction.goToAboutRoute,
    icon: isIOSDevice ? CupertinoIcons.question_circle : Icons.help_outline,
  ),
];
