import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer_animation/shimmer_animation.dart';

import '../../Helper/Api/api_constant.dart';

class CustomImageNetwork extends StatelessWidget {
  String? image;
  String? baseUrl;
  double? radius;
  double? height;
  double? width;
  BoxFit? fit;

  CustomImageNetwork({
    this.baseUrl,
    required this.image,
    required this.height,
    required this.radius,
    required this.width,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius!),
      child: Container(
        color: Colors.grey[200],
        child: CachedNetworkImage(
          imageUrl: (baseUrl?? ApiConstant.baseUrlImage) + image!,
          height: height!.r,
          width: width!.r,
          fit: fit!,
          progressIndicatorBuilder: (context, url, downloadProgress) => Shimmer(
            child: Container(
              height: height!.r,
              width: width!.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
            ),
          ),
          errorWidget: (context, url, error) =>
              Icon(Icons.error_outline, size: height!.r),
        ),
      ),
    );
  }
}
