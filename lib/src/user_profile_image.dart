import 'package:flutter/material.dart';
import 'package:image_loader_flutter/image_loader_flutter.dart';

class UserProfileImage extends StatelessWidget {
  final String? imageUrl;
  final String? userName;
  final double radius; // base avatar radius (circle diameter = 2 * radius)
  final bool enableHero;
  final bool enableTap;
  final BoxShadow? shadow;

  final bool isCircle;
  final double borderRadius; // for square only
  final bool enableBorder;
  final double borderWidth;
  final Color? borderColor; // if null, use gradient border
  final BoxFit fit;

  final double? width; // total width including border
  final double? height; // total height including border

  const UserProfileImage({
    super.key,
    required this.userName,
    this.imageUrl,
    this.radius = 24,
    this.enableHero = false,
    this.enableTap = false,
    this.shadow,
    this.isCircle = true,
    this.borderRadius = 8,
    this.enableBorder = true,
    this.borderWidth = 3.0,
    this.borderColor,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  static const Map<String, Color> _charColors = {
    'A': Colors.red,
    'B': Colors.green,
    'C': Colors.blue,
    'D': Colors.orange,
    'E': Colors.purple,
    'F': Colors.cyan,
    'G': Colors.teal,
    'H': Colors.pink,
    'I': Colors.indigo,
    'J': Colors.lime,
    'K': Colors.amber,
    'L': Colors.brown,
    'M': Colors.blueGrey,
    'N': Colors.deepOrange,
    'O': Colors.deepPurple,
    'P': Colors.lightBlue,
    'Q': Colors.lightGreen,
    'R': Colors.yellow,
    'S': Colors.redAccent,
    'T': Colors.greenAccent,
    'U': Colors.blueAccent,
    'V': Colors.orangeAccent,
    'W': Colors.purpleAccent,
    'X': Colors.cyanAccent,
    'Y': Colors.tealAccent,
    'Z': Colors.pinkAccent,
  };

  Color _getCharColor(String char) {
    return _charColors[char.toUpperCase()] ?? Colors.grey;
  }

  Gradient get _instagramGradient => const LinearGradient(
        colors: [
          Color(0xFFF58529),
          Color(0xFFDD2A7B),
          Color(0xFF8134AF),
          Color(0xFF515BD4),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  Widget build(BuildContext context) {
    final String initial = (userName?.isNotEmpty ?? false)
        ? userName!.trim()[0].toUpperCase()
        : '?';
    final Color bgColor = _getCharColor(initial);

    // Calculate the total size: width & height (including border)
    final double totalWidth =
        width ?? (radius * 2 + (enableBorder ? borderWidth * 2 : 0));
    final double totalHeight =
        height ?? (radius * 2 + (enableBorder ? borderWidth * 2 : 0));

    // Inner image size (without border)
    final double innerWidth = totalWidth - (enableBorder ? borderWidth * 2 : 0);
    final double innerHeight =
        totalHeight - (enableBorder ? borderWidth * 2 : 0);

    // If border disabled, just return ImageLoaderFlutterWidgets directly
    if (!enableBorder) {
      return SizedBox(
        width: totalWidth,
        height: totalHeight,
        child: ImageLoaderFlutterWidgets(
          image: imageUrl,
          circle: isCircle,
          radius: radius,
          enableHero: enableHero,
          onTap: enableTap,
          height: innerHeight,
          width: innerWidth,
          placeHolderWidget: Text(
            initial,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: radius * 0.8,
            ),
          ),
          bgColor: bgColor,
          fit: fit,
          enableBorder: false,
          clipBehavior: Clip.antiAlias,
          shapeDecoration: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
      );
    }

    // Build the border decoration (solid or gradient)
    final Decoration borderDecoration = BoxDecoration(
      shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      borderRadius: isCircle ? null : BorderRadius.circular(borderRadius),
      border: borderColor != null
          ? Border.all(color: borderColor!, width: borderWidth)
          : null,
      gradient: borderColor == null ? _instagramGradient : null,
      boxShadow: shadow != null ? [shadow!] : null,
    );

    // Build the avatar image widget
    final Widget avatarImage = ImageLoaderFlutterWidgets(
      image: imageUrl,
      circle: isCircle,
      radius: radius,
      enableHero: enableHero,
      onTap: enableTap,
      height: innerHeight,
      width: innerWidth,
      placeHolderWidget: Text(
        initial,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: radius * 0.8,
        ),
      ),
      bgColor: bgColor,
      fit: fit,
      enableBorder: false,
      clipBehavior: Clip.antiAlias,
      shapeDecoration: isCircle ? BoxShape.circle : BoxShape.rectangle,
    );

    // Wrap avatar with proper clip & padding to show border perfectly
    return Container(
      width: totalWidth,
      height: totalHeight,
      decoration: borderDecoration,
      padding: EdgeInsets.all(borderWidth),
      child: isCircle
          ? ClipOval(child: avatarImage)
          : ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              clipBehavior: Clip.antiAlias,
              child: avatarImage,
            ),
    );
  }
}
