import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../../../../index.dart';

class HomeDrawerHeader extends StatelessWidget {
  const HomeDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LinearLayout(
      width: double.infinity,
      layoutGravity: LayoutGravity.center,
      paddingTop: 80,
      paddingBottom: 50,
      children: [
        ImageView(
          tint: Colors.white,
          image: LogoContent.logo,
          width: 80,
          widthMax: 100,
          widthMin: 60,
        )
      ],
    );
  }
}
