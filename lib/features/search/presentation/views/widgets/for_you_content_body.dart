import 'package:flutter/material.dart';

import '../../../data/models/for_you_model.dart';
import 'for_you_item.dart';

class ForYouContantBody extends StatelessWidget {
  const ForYouContantBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: forYouDummyData.length,
      itemBuilder: (context, index) => ForYouItem(
        model: forYouDummyData[index],
        index: index,
      ),
    );
  }
}
