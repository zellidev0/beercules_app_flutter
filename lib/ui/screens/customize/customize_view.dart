import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/common/constants.dart';
import 'package:beercules/ui/screens/customize/customize_model.dart';
import 'package:beercules/ui/screens/customize/widgets/card_details_view.dart';
import 'package:beercules/ui/screens/customize/widgets/customize_card.dart';
import 'package:beercules/ui/screens/customize/widgets/sliver_header_delegate_component.dart';
import 'package:beercules/ui/widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomizeView extends StatelessWidget {
  const CustomizeView({super.key});

  @override
  Widget build(BuildContext context) => ScaffoldWidget(
        padding: EdgeInsets.zero,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            const SliverPersistentHeader(
              delegate: SliverHeaderDelegateComponent(),
            ),
            SliverPadding(
              padding: Constants.pagePadding.copyWith(top: 0),
              sliver: BlocBuilder<CustomizeController, CustomizeModel>(
                builder: (BuildContext context, CustomizeModel model) =>
                    SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.5 / 3.5,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      CustomizeCard(
                    cardType: model.configCards[index].type,
                    onTap: () async {
                      final controller =
                          BlocProvider.of<CustomizeController>(context)
                            ..setSelectedCard(
                              cardType: model.configCards[index].type,
                            );

                      var newAmount = model.configCards[index].amount;

                      await showDialog<int>(
                        context: context,
                        builder: (_) => StatefulBuilder(
                          builder: (BuildContext context, setState) =>
                              CardDetailsView(
                            initialCardInfos: model.configCards[index],
                            onSetAmount: (int amount) {
                              setState(() => newAmount = amount);
                              controller.setCardAmount(newAmount);
                            },
                            onPop: controller.closeCardAmountChangeDialog,
                          ),
                        ),
                      );
                    },
                  ),
                  itemCount: model.configCards.length,
                ),
              ),
            ),
          ],
        ),
      );
}

abstract class CustomizeController extends Cubit<CustomizeModel> {
  CustomizeController(super.initialState);

  void goBackToHome();
  void setSelectedCard({required BeerculesCardType cardType});
  void setCardAmount(int amount);
  void restoreDefault();
  void closeCardAmountChangeDialog();
}
