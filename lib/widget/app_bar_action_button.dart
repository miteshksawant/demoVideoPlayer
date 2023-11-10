import 'package:flutter/material.dart';
import 'package:video_player_demo/usage/app_common.dart';
import 'package:video_player_demo/widget/app_cached_network_image.dart';


class AppBarActionButton extends StatelessWidget {
  const AppBarActionButton({
    Key? key,
    required this.asset,
    required this.onPressed,
    this.padding,
    this.isNetworkImage = false,
  }) : super(key: key);

  final String asset;
  final Function() onPressed;
  final double? padding;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(padding ?? 16),
      icon: isNetworkImage
          ? Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AppCommon.cachedNetworkProvider(
                    url: asset,
                    maxHeight: 30,
                    maxWidth: 30,
                  ),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            )
          : AppImageWidget(
              asset: asset,
              height: 30,
              width: 30,
            ),
      /*: Image.asset(
              asset,
              height: 30,
              width: 30,
              fit: BoxFit.fitHeight,
            ),*/
      onPressed: () => onPressed(),
      splashRadius: 20,
    );
  }
}
