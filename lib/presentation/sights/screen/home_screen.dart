import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/core/style/extensions.dart';
import 'package:sights_app/presentation/sights/notifier/state/sight_list_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sightNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home Screen', style: context.textSubtitle),
              switch (state) {
                LoadingState() => Expanded(child: Center(child: CircularProgressIndicator(color: context.colorText))),
                SuccessState(sights: final listOfSights) => Expanded(
                    child: ListView.separated(
                      itemCount: listOfSights.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (_, index) => Text(listOfSights[index].title),
                    ),
                  ),
                EmptyState() => const Expanded(child: Center(child: Text("Empty compadre..."))),
                ErrorState(message: final errorMessage) => Expanded(child: Center(child: Text(errorMessage))),
              }
            ],
          ),
        ),
      ),
    );
  }
}
