part of 'view.dart';

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

  AndrossyNetworkImageConfig? networkImageConfig;

  void setNetworkImageConfig(AndrossyNetworkImageConfig? value) {
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
    return this;
  }

  dynamic get image => isPlaceholder ? placeholder : _image;

  AndrossyImageType get type => isPlaceholder ? placeholderType : imageType;

  bool get isPlaceholder {
    final data = _image;
    final x = data is String ? data.isEmpty : false;
    final y = imageType == AndrossyImageType.detect ||
        imageType == AndrossyImageType.unknown;
    return x || y;
  }

  AndrossyImageType get imageType => AndrossyImageType.from(_image);

  AndrossyImageType get placeholderType {
    return AndrossyImageType.from(placeholder);
  }
}
