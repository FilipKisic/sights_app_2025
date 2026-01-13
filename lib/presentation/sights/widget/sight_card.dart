import 'package:flutter/material.dart';
import 'package:sights_app/domain/model/sight.dart';
import 'package:sights_app/presentation/core/style/extensions.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard(this.sight, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [context.colorGradientBegin, context.colorGradientEnd],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(
                sight.imageUrl,
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sight.title, overflow: TextOverflow.ellipsis),
                Text(sight.address, overflow: TextOverflow.ellipsis),
                Text('${sight.lat}, ${sight.lng}'),
                Text('Rating: ${sight.rating}'),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_rounded),
          ),
        ],
      ),
    );
  }
}

