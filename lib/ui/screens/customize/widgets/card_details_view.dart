import 'package:beercules/common/theme.dart';
import 'package:beercules/ui/screens/customize/customize_model.dart';
import 'package:beercules/ui/widgets/playing_card.dart';
import 'package:flutter/material.dart';

class CardDetailsView extends StatefulWidget {
  final CustomizeModelCard initialCardInfos;
  final void Function(int amount) onSetAmount;
  final void Function() onPop;
  const CardDetailsView({
    required this.initialCardInfos,
    required this.onSetAmount,
    required this.onPop,
    super.key,
  });

  @override
  State<CardDetailsView> createState() => _CardDetailsViewState();
}

class _CardDetailsViewState extends State<CardDetailsView> {
  late int _amount;

  @override
  void initState() {
    super.initState();
    _amount = widget.initialCardInfos.amount;
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PlayingCard(
            onTap: () => widget.onPop(),
            showLogo: widget.initialCardInfos.type.isBasicRule(),
            cardType: widget.initialCardInfos.type,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() => _amount = (_amount + 1) % 6);
              widget.onSetAmount(_amount);
            },
            child: Text(
              _amount.toString(),
              style: TextStyles.header3.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      );
}
