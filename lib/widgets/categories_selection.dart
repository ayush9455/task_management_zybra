import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../src/providers/providers.dart';
import '../utils/utils.dart';
import 'circle_container.dart';

class CategoriesSelection extends ConsumerWidget {
  const CategoriesSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final List<TaskCategory> categories = TaskCategory.values.toList();

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Category',
            style: context.textTheme.titleMedium,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                final category = categories[index];

                return GestureDetector(
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = category;
                  },
                  child: CircleContainer(
                    color: selectedCategory == category
                        ? context.colorScheme.primary
                        : category.color.withOpacity(0.3),
                    borderColor: category.color,
                    child: Icon(
                      category.icon,
                      color: category.color.withOpacity(0.5),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
