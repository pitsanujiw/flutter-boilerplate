import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget imageLazyLoad(BuildContext context, {double height = 400}) =>
    Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: height,
      ),
    );