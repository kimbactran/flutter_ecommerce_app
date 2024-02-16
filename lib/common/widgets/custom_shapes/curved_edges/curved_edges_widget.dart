import 'package:ecommerce_app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class EcoCurvedEdgeWidget extends StatelessWidget {
  const EcoCurvedEdgeWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: EcoCustomCurvedEdges(),
      child: child,
    );
  }
}