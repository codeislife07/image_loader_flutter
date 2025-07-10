import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_loader_flutter/src/view_image.dart';

class ImageLoaderFlutterWidgets extends StatelessWidget {
  final String? image;
  final bool circle;
  final bool onTap;
  final bool enableHero;
  final Widget placeHolderWidget;
  final double? radius;
  final double padding;
  final Color? bgColor;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? borderColor;
  final bool enableBorder;
  final double borderWidth;
  final List<BoxShadow>? boxShadow;
  final Alignment imageAlignment;
  final DecorationImage? backgroundImage;
  final Clip clipBehavior;
  final BoxShape? shapeDecoration;

  const ImageLoaderFlutterWidgets({
    super.key,
    required this.image,
    required this.circle,
    required this.radius,
    this.onTap = true,
    this.enableHero = false,
    this.padding = 0,
    this.placeHolderWidget = const Icon(Icons.photo),
    this.bgColor,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
    this.borderColor,
    this.enableBorder = true,
    this.borderWidth = 1.0,
    this.boxShadow,
    this.imageAlignment = Alignment.center,
    this.backgroundImage,
    this.clipBehavior = Clip.antiAlias,
    this.shapeDecoration,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBgColor = bgColor ?? Theme.of(context).cardColor;

    final decoration = BoxDecoration(
      color: effectiveBgColor,
      shape: circle ? BoxShape.circle : BoxShape.rectangle,
      borderRadius: circle ? null : BorderRadius.circular(radius ?? 0),
      border: enableBorder
          ? Border.all(
              color: borderColor ?? Colors.grey[300]!, width: borderWidth)
          : null,
      boxShadow: boxShadow,
      // Remove backgroundImage to avoid conflict with child image widget
      // image: backgroundImage,
    );

    Widget buildContainer(Widget child) => Container(
          height: height,
          width: width,
          decoration: decoration,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: circle
                ? ClipOval(child: child) // clip as circle properly
                : ClipRRect(
                    borderRadius: BorderRadius.circular(radius ?? 0),
                    clipBehavior: clipBehavior,
                    child: child,
                  ),
          ),
        );

    final errorWidget = buildContainer(Center(child: placeHolderWidget));
    final placeholder = buildContainer(const CupertinoActivityIndicator());

    Widget imageWidget;
    if (image == null || image!.isEmpty) {
      imageWidget = errorWidget;
    } else if (image!.startsWith("http")) {
      imageWidget = CachedNetworkImage(
        imageUrl: image!,
        fit: fit, // <-- pass fit here
        placeholder: (_, __) => placeholder,
        errorWidget: (_, __, ___) => errorWidget,
      );
    } else if (image!.contains("assets/")) {
      imageWidget = Image.asset(
        image!,
        fit: fit, // <-- pass fit here
        errorBuilder: (_, __, ___) => errorWidget,
      );
    } else {
      imageWidget = Image.file(
        File(image!),
        fit: fit, // <-- pass fit here
        errorBuilder: (_, __, ___) => errorWidget,
      );
    }

    final imageContainer = buildContainer(imageWidget);

    final imageProvider = image!.startsWith("http")
        ? CachedNetworkImageProvider(image!)
        : image!.contains("assets/")
            ? AssetImage(image!)
            : FileImage(File(image!)) as ImageProvider;

    Widget finalImage = GestureDetector(
      onTap: onTap ? () => _openImageView(context, imageProvider) : null,
      child: imageContainer,
    );

    if (enableHero && image != null && image!.isNotEmpty) {
      finalImage = Hero(tag: image!, child: finalImage);
    }

    return finalImage;
  }

  void _openImageView(BuildContext context, ImageProvider imageProvider) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ViewImageScreen(iMageProvider: imageProvider),
      ),
    );
  }
}
