import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbProvider = Provider<AppDatabase>((ref) => AppDatabase());
