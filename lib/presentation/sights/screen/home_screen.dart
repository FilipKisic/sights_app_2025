import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/core/style/extensions.dart';
import 'package:sights_app/presentation/sights/notifier/state/sight_list_state.dart';
import 'package:sights_app/presentation/sights/widget/sight_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sightListNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Places', style: context.textTitle),
              switch (state) {
                SightListLoading() =>
                    Expanded(child: Center(child: Lottie.asset('assets/animations/loading_sights.json', width: 70))),
                SightListEmpty() => Expanded(child: Center(child: SightListStateWidget.empty())),
                SightListFilled(sights: final sightList) => Expanded(
                  child: Expanded(
                    child: ListView.separated(
                      itemCount: sightList.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                      itemBuilder: (context, index) => SightCard(sightList[index]),
                      shrinkWrap: true,
                    ),
                  ),
                ),
                SightListError(message: final errorMessage) =>
                    Expanded(child: Center(child: SightListStateWidget.error(errorMessage)))
              }
            ],
          ),
        ),
      ),
    );
  }
}

class SightListStateWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const SightListStateWidget(
    this.imageUrl,
    this.title,
    this.description, {
    super.key,
  });

  factory SightListStateWidget.error(final String errorMessage) => SightListStateWidget(
        'assets/images/error_image.png',
        errorMessage,
        'Please try again later.',
      );

  factory SightListStateWidget.empty() => const SightListStateWidget(
        'assets/images/no_locations_found.png',
        'No places found',
        'Try to refresh the screen or check later.',
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageUrl, width: 200),
        const SizedBox(height: 30),
        Text(title, style: context.textSubtitle),
        Text(description),
      ],
    );
  }
}
