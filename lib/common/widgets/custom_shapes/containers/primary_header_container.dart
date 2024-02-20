import 'package:ecommerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EcoPrimaryHeaderContainer extends StatelessWidget {
  const EcoPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EcoCurvedEdgeWidget(
      child: Container(
        color: EcoColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: EcoCircularContainer(
                  width: 400,
                  height: 400,
                  radius: 400,
                  padding: 0,
                  backgroundColor: EcoColors.textWhite.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: EcoCircularContainer(
                  width: 400,
                  height: 400,
                  radius: 400,
                  padding: 0,
                  backgroundColor: EcoColors.textWhite.withOpacity(0.1)),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
