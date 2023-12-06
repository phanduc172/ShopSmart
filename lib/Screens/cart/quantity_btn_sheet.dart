import 'package:flutter/material.dart';
import 'package:shop_smart/widgets/subtitle_text.dart';

class QuantityBottomSheetWidget extends StatelessWidget {
  const QuantityBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    print("index $index");
                  },
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SubtitleTextWidge(label: "${index+1}"),
                  )),
                );
              }),
        ),
      ],
    );
  }
}
