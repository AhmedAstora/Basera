import 'package:flutter/material.dart';

import '../Constants/app_color.dart';


class LoaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColor.primary,
      ),
    );
  }
}
