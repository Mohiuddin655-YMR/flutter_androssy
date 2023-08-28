part of '../widgets.dart';

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

  const ImageView({
    /// BASE PROPERTIES
    super.key,
    super.controller,

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

    ///
    ///
    ///
    ///
    super.absorbMode,
    super.activated,
    super.animation,
    super.animationType,
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
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.flex,
    super.gravity,
    super.height,
    super.heightMax,
    super.heightMin,
    super.hoverColor,
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,
    super.position,
    super.positionType,
    super.pressedColor,
    super.rippleColor,
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
    super.shape,
    super.transform,
    super.transformGravity,
    super.width,
    super.widthMax,
    super.widthMin,
    super.visibility,
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onToggle,
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
  });

  @override
  T initController() => ImageViewController() as T;

  @override
  T attachController(T controller) => controller.fromImageView(this) as T;

  @override
  Widget? attach(BuildContext context, T controller) => RawImageView(
        width: controller.width,
        height: controller.height,
        cacheMode: controller.cacheMode,
        image: controller.image,
        tint: controller.imageTint,
        tintMode: controller.imageTintMode,
        imageType: controller.type,
        scaleType: controller.scaleType,
      );
}

class ImageViewController extends ViewController {
  bool cacheMode = true;
  dynamic _image;
  Color? imageTint;
  BlendMode? imageTintMode;
  ImageType _imageType = ImageType.detect;
  dynamic placeholder;
  Color? placeholderTint;
  BlendMode? placeholderTintMode;
  ImageType _placeholderType = ImageType.detect;
  BoxFit? scaleType;

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

  ImageType get placeholderType =>
      ImageType.from(placeholder, _placeholderType);
}

class RawImageView extends StatelessWidget {
  final dynamic image;
  final ImageType imageType;
  final double? width, height;
  final BoxFit? scaleType;
  final bool cacheMode;
  final Color? tint;
  final BlendMode? tintMode;

  const RawImageView({
    Key? key,
    this.width,
    this.height,
    this.cacheMode = true,
    this.image,
    this.imageType = ImageType.detect,
    this.scaleType,
    this.tint,
    this.tintMode,
  }) : super(key: key);

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
        return CachedNetworkImage(
          imageUrl: "$image",
          width: width,
          height: height,
          fit: scaleType,
          color: tint,
          colorBlendMode: tintMode,
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

extension ImageTypeExtension on String {
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
