import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data.dart';

final taskDatasourceProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});