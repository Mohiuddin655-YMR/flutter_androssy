part of '../widgets.dart';

typedef ImageViewProgressBuilder = Widget Function(
    BuildContext, String, DownloadProgress);
typedef ImageViewErrorBuilder = Widget Function(BuildContext, String, Object);

class ImageViewController extends ViewController {
  bool cacheMode = true;

  void setCacheMode(bool value) {
    onNotifyWithCallback(() => cacheMode = value);
  }

  dynamic _image;

  set image(dynamic value) => _image = value;

  void setImage(dynamic value) {
    onNotifyWithCallback(() => image = value);
  }

  Color? imageTint;

  void setImageTint(Color? value) {
    onNotifyWithCallback(() => imageTint = value);
  }

  BlendMode? imageTintMode;

  void setImageTintMode(BlendMode value) {
    onNotifyWithCallback(() => imageTintMode = value);
  }

  ImageType _imageType = ImageType.detect;

  set imageType(ImageType value) => _imageType = value;

  void setImageType(ImageType value) {
    onNotifyWithCallback(() => imageType = value);
  }

  NetworkImageConfig? networkImageConfig;

  void setNetworkImageConfig(NetworkImageConfig? value) {
    onNotifyWithCallback(() => networkImageConfig = value);
  }

  dynamic placeholder;

  void setPlaceholder(dynamic value) {
    onNotifyWithCallback(() => placeholder = value);
  }

  Color? placeholderTint;

  void setPlaceholderTint(Color? value) {
    onNotifyWithCallback(() => placeholderTint = value);
  }

  BlendMode? placeholderTintMode;

  void setPlaceholderTintMode(dynamic value) {
    onNotifyWithCallback(() => placeholderTintMode = value);
  }

  ImageType _placeholderType = ImageType.detect;

  set placeholderType(ImageType value) => _placeholderType = value;

  void setPlaceholderType(ImageType value) {
    onNotifyWithCallback(() => placeholderType = value);
  }

  BoxFit? scaleType;

  void setScaleType(BoxFit? value) {
    onNotifyWithCallback(() => scaleType = value);
  }

  ImageViewController fromImageView(ImageView view) {
    super.fromView(view);
    cacheMode = view.cacheMode ?? true;
    placeholder = view.placeholder;
    placeholderTint = view.placeholderTint;
    placeholderTintMode = view.placeholderTintMode;
    scaleType = view.scaleType;
    _image = view.image;
    imageTint = view.tint;
    imageTintMode = view.tintMode;
    _imageType = view.imageType ?? ImageType.detect;
    _placeholderType = view.placeholderType ?? ImageType.detect;
    return this;
  }

  dynamic get image => isPlaceholder ? placeholder : _image;

  ImageType get type => isPlaceholder ? placeholderType : imageType;

  bool get isPlaceholder {
    final data = _image;
    final x = data is String ? data.isEmpty : false;
    final y = imageType == ImageType.detect || imageType == ImageType.unknown;
    return x || y;
  }

  ImageType get imageType => ImageType.from(_image, _imageType);

  ImageType get placeholderType {
    return ImageType.from(placeholder, _placeholderType);
  }
}

class ImageView<T extends ImageViewController> extends YMRView<T> {
  final bool? cacheMode;
  final dynamic image;
  final Color? tint;
  final BlendMode? tintMode;
  final ImageType? imageType;
  final dynamic placeholder;
  final Color? placeholderTint;
  final BlendMode? placeholderTintMode;
  final ImageType? placeholderType;
  final BoxFit? scaleType;
  final NetworkImageConfig? networkImageConfig;

  const ImageView({
    /// ROOT PROPERTIES
    super.key,
    super.controller,

    ///BASE PROPERTIES
    super.absorbMode,
    super.activated,
    super.background,
    super.backgroundState,
    super.backgroundBlendMode,
    super.backgroundGradient,
    super.backgroundGradientState,
    super.backgroundImage,
    super.backgroundImageState,
    super.clipBehavior,
    super.dimensionRatio,
    super.elevation,
    super.enabled,
    super.expandable,
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.flex,
    super.gravity,
    super.height,
    super.heightState,
    super.heightMax,
    super.heightMin,
    super.hoverColor,
    super.orientation,
    super.position,
    super.positionType,
    super.pressedColor,
    super.rippleColor,
    super.scrollable,
    super.scrollController,
    super.scrollingType,
    super.shape,
    super.transform,
    super.transformGravity,
    super.width,
    super.widthState,
    super.widthMax,
    super.widthMin,
    super.visibility,

    /// ANIMATION PROPERTIES
    super.animation,
    super.animationType,

    /// BORDER PROPERTIES
    super.borderColor,
    super.borderColorState,
    super.borderSize,
    super.borderSizeState,
    super.borderHorizontal,
    super.borderHorizontalState,
    super.borderVertical,
    super.borderVerticalState,
    super.borderTop,
    super.borderTopState,
    super.borderBottom,
    super.borderBottomState,
    super.borderStart,
    super.borderStartState,
    super.borderEnd,
    super.borderEndState,
    super.borderStrokeAlign,

    /// BORDER RADIUS PROPERTIES
    super.borderRadius,
    super.borderRadiusState,
    super.borderRadiusBL,
    super.borderRadiusBLState,
    super.borderRadiusBR,
    super.borderRadiusBRState,
    super.borderRadiusTL,
    super.borderRadiusTLState,
    super.borderRadiusTR,
    super.borderRadiusTRState,

    /// MARGIN PROPERTIES
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,

    /// PADDING PROPERTIES
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,

    /// SHADOW PROPERTIES
    super.shadow,
    super.shadowBlurRadius,
    super.shadowBlurStyle,
    super.shadowColor,
    super.shadowType,
    super.shadowSpreadRadius,
    super.shadowHorizontal,
    super.shadowVertical,
    super.shadowStart,
    super.shadowEnd,
    super.shadowTop,
    super.shadowBottom,

    /// LISTENER PROPERTIES
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onHover,
    super.onToggle,

    /// CHILD PROPERTIES
    this.cacheMode,
    this.image,
    this.tint,
    this.tintMode,
    this.imageType,
    this.placeholder,
    this.placeholderTint,
    this.placeholderTintMode,
    this.placeholderType,
    this.scaleType,
    this.networkImageConfig,
  });

  @override
  T initController() => ImageViewController() as T;

  @override
  T attachController(T controller) => controller.fromImageView(this) as T;

  @override
  Widget? attach(BuildContext context, T controller) {
    return RawImageView(
      width: controller.width,
      height: controller.height,
      cacheMode: controller.cacheMode,
      image: controller.image,
      tint: controller.imageTint,
      tintMode: controller.imageTintMode,
      imageType: controller.type,
      scaleType: controller.scaleType,
      networkImageConfig: controller.networkImageConfig,
    );
  }
}

class RawImageView extends StatelessWidget {
  final dynamic image;
  final ImageType imageType;
  final double? width, height;
  final BoxFit? scaleType;
  final bool cacheMode;
  final Color? tint;
  final BlendMode? tintMode;
  final NetworkImageConfig? networkImageConfig;

  const RawImageView({
    super.key,
    this.width,
    this.height,
    this.cacheMode = true,
    this.image,
    this.imageType = ImageType.detect,
    this.scaleType,
    this.tint,
    this.tintMode,
    this.networkImageConfig,
  });

  @override
  Widget build(BuildContext context) {
    final type = ImageType.from(image, imageType);
    if (type == ImageType.asset) {
      return Image.asset(
        "$image",
        width: width,
        height: height,
        fit: scaleType,
        color: tint,
        colorBlendMode: tintMode,
      );
    } else if (type == ImageType.network) {
      if (cacheMode) {
        final config = networkImageConfig ?? const NetworkImageConfig();
        return CachedNetworkImage(
          imageUrl: "$image",
          width: width,
          height: height,
          fit: scaleType,
          color: tint,
          colorBlendMode: tintMode,
          alignment: config.alignment,
          cacheKey: config.cacheKey,
          cacheManager: config.cacheManager,
          errorWidget: config.errorBuilder,
          errorListener: config.errorListener,
          fadeInCurve: config.fadeInCurve,
          fadeInDuration: config.fadeInDuration,
          fadeOutCurve: config.fadeOutCurve,
          fadeOutDuration: config.fadeOutDuration,
          filterQuality: config.filterQuality,
          httpHeaders: config.httpHeaders,
          imageBuilder: config.imageBuilder,
          imageRenderMethodForWeb: config.imageRenderMethodForWeb,
          matchTextDirection: config.matchTextDirection,
          maxHeightDiskCache: config.maxHeightDiskCache,
          maxWidthDiskCache: config.maxWidthDiskCache,
          memCacheHeight: config.memCacheHeight,
          memCacheWidth: config.memCacheWidth,
          placeholder: config.placeholder,
          placeholderFadeInDuration: config.placeholderFadeInDuration,
          progressIndicatorBuilder: config.progressBuilder,
          repeat: config.repeat,
          useOldImageOnUrlChange: config.useOldImageOnUrlChange,
        );
      } else {
        return Image.network(
          "$image",
          width: width,
          height: height,
          fit: scaleType,
          color: tint,
          colorBlendMode: tintMode,
        );
      }
    } else if (type == ImageType.file) {
      return Image.file(
        image,
        width: width,
        height: height,
        fit: scaleType,
        color: tint,
        colorBlendMode: tintMode,
      );
    } else if (type == ImageType.memory) {
      return Image.memory(
        image,
        width: width,
        height: height,
        fit: scaleType,
        color: tint,
        colorBlendMode: tintMode,
      );
    } else if (type == ImageType.svg) {
      return SvgPicture.asset(
        image,
        width: width,
        height: height,
        fit: scaleType ?? BoxFit.contain,
        colorFilter: tint != null
            ? ColorFilter.mode(
                tint!,
                tintMode ?? BlendMode.srcIn,
              )
            : null,
        theme: SvgTheme(
          currentColor: tint ?? const Color(0xFF808080),
        ),
      );
    } else if (type == ImageType.svgNetwork) {
      return SvgPicture.network(
        image,
        width: width,
        height: height,
        fit: scaleType ?? BoxFit.contain,
        colorFilter: tint != null
            ? ColorFilter.mode(
                tint!,
                tintMode ?? BlendMode.srcIn,
              )
            : null,
        theme: SvgTheme(
          currentColor: tint ?? const Color(0xFF808080),
        ),
      );
    } else if (type == ImageType.svgCode) {
      return SvgPicture.string(
        image,
        width: width,
        height: height,
        fit: scaleType ?? BoxFit.contain,
        colorFilter: tint != null
            ? ColorFilter.mode(
                tint!,
                tintMode ?? BlendMode.srcIn,
              )
            : null,
        theme: SvgTheme(
          currentColor: tint ?? const Color(0xFF808080),
        ),
      );
    } else {
      return SizedBox(
        width: width,
        height: height,
      );
    }
  }
}

class NetworkImageConfig {
  final Alignment alignment;
  final BaseCacheManager? cacheManager;
  final String? cacheKey;
  final LoadingErrorWidgetBuilder? errorBuilder;
  final ValueChanged<Object>? errorListener;
  final Curve fadeInCurve;
  final Duration fadeInDuration;
  final Curve fadeOutCurve;
  final Duration? fadeOutDuration;
  final FilterQuality filterQuality;
  final Map<String, String>? httpHeaders;
  final ImageWidgetBuilder? imageBuilder;
  final ImageRenderMethodForWeb imageRenderMethodForWeb;
  final bool matchTextDirection;
  final int? maxHeightDiskCache;
  final int? maxWidthDiskCache;
  final int? memCacheHeight;
  final int? memCacheWidth;
  final PlaceholderWidgetBuilder? placeholder;
  final ProgressIndicatorBuilder? progressBuilder;
  final Duration? placeholderFadeInDuration;
  final ImageRepeat repeat;
  final bool useOldImageOnUrlChange;

  const NetworkImageConfig({
    this.alignment = Alignment.center,
    this.cacheManager,
    this.cacheKey,
    this.errorBuilder,
    this.errorListener,
    this.fadeInCurve = Curves.easeIn,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeOutCurve = Curves.easeOut,
    this.fadeOutDuration,
    this.filterQuality = FilterQuality.low,
    this.httpHeaders,
    this.imageBuilder,
    this.imageRenderMethodForWeb = ImageRenderMethodForWeb.HtmlImage,
    this.matchTextDirection = false,
    this.maxHeightDiskCache,
    this.maxWidthDiskCache,
    this.memCacheHeight,
    this.memCacheWidth,
    this.placeholder,
    this.progressBuilder,
    this.placeholderFadeInDuration,
    this.repeat = ImageRepeat.noRepeat,
    this.useOldImageOnUrlChange = false,
  });
}

enum ImageType {
  unknown,
  detect,
  asset,
  file,
  memory,
  network,
  svg,
  svgCode,
  svgNetwork;

  factory ImageType.from(dynamic data, [ImageType type = ImageType.detect]) {
    if (type == ImageType.detect || type == ImageType.unknown) {
      if (data is String) {
        if (data.isAsset) {
          if (data.isSvg) {
            return ImageType.svg;
          } else {
            return ImageType.asset;
          }
        } else if (data.isNetwork) {
          if (data.isSvg) {
            return ImageType.svgNetwork;
          } else {
            return ImageType.network;
          }
        } else if (data.isSvgCode) {
          return ImageType.svgCode;
        } else {
          return ImageType.unknown;
        }
      } else if (data is File) {
        return ImageType.file;
      } else if (data is Uint8List) {
        return ImageType.memory;
      } else {
        return ImageType.unknown;
      }
    } else {
      return type;
    }
  }
}

extension _ImageTypeExtension on String {
  bool get isAsset {
    return startsWith('assets/') || startsWith('asset/');
  }

  bool get isNetwork {
    return startsWith('https://') || startsWith('http://');
  }

  bool get isSvg {
    return endsWith(".svg");
  }

  bool get isSvgCode {
    var code = replaceAll("\n", "");
    return code.startsWith("<svg") && code.endsWith("/svg>");
  }
}
