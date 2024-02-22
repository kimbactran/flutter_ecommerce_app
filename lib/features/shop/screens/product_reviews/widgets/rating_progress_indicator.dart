import 'package:ecommerce_app/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:flutter/material.dart';

class EcoOverallProductRating extends StatelessWidget {
  const EcoOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              EcoRatingProgressIndicator(
                text: '5',
                value: 1,
              ),
              EcoRatingProgressIndicator(
                text: '4',
                value: 0.8,
              ),
              EcoRatingProgressIndicator(
                text: '3',
                value: 0.6,
              ),
              EcoRatingProgressIndicator(
                text: '2',
                value: 0.4,
              ),
              EcoRatingProgressIndicator(
                text: '1',
                value: 0.2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
