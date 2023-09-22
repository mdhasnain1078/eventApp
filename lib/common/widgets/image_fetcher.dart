import 'package:flutter/material.dart';

import '../utils/appColors.dart';

Widget imageFetcher({required String imageUrl}){
  return Image.network(
  imageUrl,
  fit: BoxFit.cover,
  loadingBuilder: (BuildContext context, Widget child,
      ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) {
      return child;
    } else if (loadingProgress.expectedTotalBytes != null) {
      return Center(
        child: CircularProgressIndicator(
          color: AppColors.black,
          value: loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes!,
        ),
      );
    } else {
      return const Placeholder();
    }
  },
  errorBuilder: (BuildContext context, Object error,
      StackTrace? stackTrace) {
    return const Text(
        'Error loading image'); 
  },
);
}