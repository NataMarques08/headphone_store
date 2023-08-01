import 'package:flutter/material.dart';

import 'data.dart';

class AnimatedProductPageAdvance extends StatefulWidget {
  const AnimatedProductPageAdvance({super.key});

  @override
  State<AnimatedProductPageAdvance> createState() =>
      _AnimatedProductPageAdvanceState();
}

class MyCustomClipper extends CustomClipper<Path> {
  final double animationValue;

  MyCustomClipper({required this.animationValue});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromCenter(
        center: Offset(size.width / 2, size.height),
        width: size.width * animationValue,
        height: size.height * animationValue));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _AnimatedProductPageAdvanceState extends State<AnimatedProductPageAdvance>
    with TickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimation;
  late AnimationController clipperAnimation;

  @override
  void initState() {
    super.initState();
    _slideAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);
    _slideAnimation = Tween<Offset>(begin: Offset(0, -0.15), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: _slideAnimationController, curve: Curves.easeInOut));
    clipperAnimation = AnimationController(
        vsync: this, duration: Duration(seconds: 3), upperBound: 5);
  }
  final Product currentProduct = Product(
    title: "BoAt Rockerz 450 com fone de ouvido Bluetooth de até 15 horas de reprodução",
    images: [blackVariation,beigeVariation,blueVariation],
    relatedProducts: relatedProducts,
    description: description,
    highlights:highlights,
    priceBefore: 300,
    price: 199,
    rating: 4.8
  
  );
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
