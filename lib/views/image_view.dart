part of '../widgets.dart';

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

extension _ImageType on String {
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

class ImageView<T extends ImageViewController> extends YMRView<T> {
  final bool? cacheMode;
  final dynamic image;
  final ImageType? imageType;
  final dynamic placeholder;
  final ImageType? placeholderType;
  final BoxFit? scaleType;

  const ImageView({
    super.key,
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
    super.border,
    super.borderHorizontal,
    super.borderVertical,
    super.borderTop,
    super.borderBottom,
    super.borderStart,
    super.borderEnd,
    super.borderColor,
    super.borderGradient,
    super.borderRadius,
    super.borderRadiusBL,
    super.borderRadiusBR,
    super.borderRadiusTL,
    super.borderRadiusTR,
    super.child,
    super.clipBehavior,
    super.controller,
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
    super.ripple,
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
    this.placeholder,
    this.placeholderType,
    this.scaleType,
    this.image,
    this.imageType,
  });

  @override
  T initController() {
    return ImageViewController() as T;
  }

  @override
  T attachController(T controller) => controller.fromView(
        this,
        cacheMode: cacheMode,
        placeholder: placeholder,
        placeholderType: placeholderType,
        scaleType: scaleType,
        image: image,
        imageType: imageType,
      ) as T;

  @override
  Widget? attach(BuildContext context, T controller) => RawImageView(
        width: controller.width,
        height: controller.height,
        cacheMode: controller.cacheMode,
        image: controller.image,
        imageType: controller.type,
        scaleType: controller.scaleType,
      );
}

class ImageViewController extends ViewController {
  bool cacheMode = true;
  dynamic _image;
  ImageType _imageType = ImageType.detect;
  dynamic placeholder;
  ImageType _placeholderType = ImageType.detect;
  BoxFit? scaleType;

  @override
  ImageViewController fromView(
    YMRView<ViewController> view, {
    bool? cacheMode,
    dynamic image,
    ImageType? imageType,
    dynamic placeholder,
    ImageType? placeholderType,
    BoxFit? scaleType,
  }) {
    super.fromView(view);
    this.cacheMode = cacheMode ?? true;
    this.placeholder = placeholder;
    this.scaleType = scaleType;
    _image = image;
    _imageType = imageType ?? ImageType.detect;
    _placeholderType = placeholderType ?? ImageType.detect;
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

  const RawImageView({
    Key? key,
    this.width,
    this.height,
    this.cacheMode = true,
    this.image,
    this.imageType = ImageType.detect,
    this.scaleType,
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
      );
    } else if (type == ImageType.network) {
      if (cacheMode) {
        return CachedNetworkImage(
          imageUrl: "$image",
          width: width,
          height: height,
          fit: scaleType,
        );
      } else {
        return Image.network(
          "$image",
          width: width,
          height: height,
          fit: scaleType,
        );
      }
    } else if (type == ImageType.file) {
      return Image.file(
        image,
        width: width,
        height: height,
        fit: scaleType,
      );
    } else if (type == ImageType.memory) {
      return Image.memory(
        image,
        width: width,
        height: height,
        fit: scaleType,
      );
    } else if (type == ImageType.svg) {
      return SvgPicture.asset(
        image,
        width: width,
        height: height,
        fit: scaleType ?? BoxFit.contain,
      );
    } else if (type == ImageType.svgNetwork) {
      return SvgPicture.network(
        image,
        width: width,
        height: height,
        fit: scaleType ?? BoxFit.contain,
      );
    } else if (type == ImageType.svgCode) {
      return SvgPicture.string(
        image,
        width: width,
        height: height,
        fit: scaleType ?? BoxFit.contain,
      );
    } else {
      return SizedBox(
        width: width,
        height: height,
      );
    }
  }
}
