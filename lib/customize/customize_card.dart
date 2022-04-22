import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomizeCard extends StatelessWidget {
  final String _cardKey;
  final GestureTapUpCallback _onTapUp;
  final GestureTapDownCallback _onTapDown;

  const CustomizeCard({
    required String cardKey,
    required GestureTapUpCallback onTapUp,
    required GestureTapDownCallback onTapDown,
    Key? key,
  })  : _cardKey = cardKey,
        _onTapUp = onTapUp,
        _onTapDown = onTapDown,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: _onTapUp,
      onTapDown: _onTapDown,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset("assets/instructions/${_cardKey}_pic.svg"),
        ),
      ),
    );
  }
}
