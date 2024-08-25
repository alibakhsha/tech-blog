/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/bluemic.png
  AssetGenImage get bluemic => const AssetGenImage('assets/icons/bluemic.png');

  /// File path: assets/icons/bluepen.png
  AssetGenImage get bluepen => const AssetGenImage('assets/icons/bluepen.png');

  /// File path: assets/icons/down_cat_arrow.svg
  String get downCatArrow => 'assets/icons/down_cat_arrow.svg';

  /// File path: assets/icons/hashtagicon.png
  AssetGenImage get hashtagicon =>
      const AssetGenImage('assets/icons/hashtagicon.png');

  /// File path: assets/icons/homebtn.png
  AssetGenImage get homebtn => const AssetGenImage('assets/icons/homebtn.png');

  /// File path: assets/icons/userbtn.png
  AssetGenImage get userbtn => const AssetGenImage('assets/icons/userbtn.png');

  /// File path: assets/icons/wbtn.png
  AssetGenImage get wbtn => const AssetGenImage('assets/icons/wbtn.png');

  /// List of all assets
  List<dynamic> get values =>
      [bluemic, bluepen, downCatArrow, hashtagicon, homebtn, userbtn, wbtn];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/1.png
  AssetGenImage get a1 => const AssetGenImage('assets/images/1.png');

  /// File path: assets/images/2.png
  AssetGenImage get a2 => const AssetGenImage('assets/images/2.png');

  /// File path: assets/images/3.png
  AssetGenImage get a3 => const AssetGenImage('assets/images/3.png');

  /// File path: assets/images/4.png
  AssetGenImage get a4 => const AssetGenImage('assets/images/4.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/poster_test.png
  AssetGenImage get posterTest =>
      const AssetGenImage('assets/images/poster_test.png');

  /// File path: assets/images/splashSc.png
  AssetGenImage get splashSc =>
      const AssetGenImage('assets/images/splashSc.png');

  /// File path: assets/images/tech_bot.svg
  String get techBot => 'assets/images/tech_bot.svg';

  /// File path: assets/images/user_profile.png
  AssetGenImage get userProfile =>
      const AssetGenImage('assets/images/user_profile.png');

  /// List of all assets
  List<dynamic> get values =>
      [a1, a2, a3, a4, logo, posterTest, splashSc, techBot, userProfile];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
