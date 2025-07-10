ImageLoaderFlutterWidgets
A versatile Flutter widget for loading and displaying images from various sources (network, assets, or local files) with extensive customization options. It supports circular or rectangular shapes, borders, box shadows, hero animations, and tap-to-view full-screen functionality. The widget leverages the cached_network_image package for efficient network image loading and provides fallback mechanisms for error handling.
Features

Image Source Support:
Network images (via URLs)
Asset images (from the app's asset bundle)
Local file images (from the device’s file system)


Customization:
Circular or rectangular image shapes
Configurable border (color, width, enable/disable)
Box shadow effects
Background color
Padding and image alignment
Customizable image fit and clipping behavior


Interactivity:
Tap-to-view full-screen image with navigation to a ViewImageScreen
Hero animation support for smooth transitions


Error Handling:
Custom placeholder widget during loading
Custom error widget for failed image loads


Performance:
Uses cached_network_image for efficient network image loading and caching



Installation
To use ImageLoaderFlutterWidgets, add the following dependency to your pubspec.yaml:
dependencies:
  image_loader_flutter: ^0.0.11

Run the following command to install the dependency:
flutter pub get

Ensure that the ViewImageScreen widget (used for full-screen image viewing) is implemented in your project or included as part of the package. You may also need to handle file permissions for local images (e.g., using path_provider or similar packages).
Usage
Import the widget into your Dart file:
import 'package:image_loader_flutter_widgets/image_loader_flutter_widgets.dart';

Use the ImageLoaderFlutterWidgets widget in your Flutter app with the desired configuration:
ImageLoaderFlutterWidgets(
  image: 'https://example.com/sample.jpg',
  circle: true,
  radius: 50.0,
  onTap: true,
  enableHero: true,
  placeHolderWidget: const Icon(Icons.image),
  padding: 4.0,
  bgColor: Colors.white,
  height: 100.0,
  width: 100.0,
  fit: BoxFit.cover,
  borderColor: Colors.blue,
  enableBorder: true,
  borderWidth: 2.0,
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 4.0,
      offset: Offset(2, 2),
    ),
  ],
  imageAlignment: Alignment.center,
  clipBehavior: Clip.antiAlias,
)

Parameters
The ImageLoaderFlutterWidgets widget accepts the following parameters, each with a specific role in customizing the widget's appearance and behavior:



Parameter
Type
Description
Default Value



image
String?
The path or URL of the image (network URL, asset path, or file path).
null


circle
bool
If true, displays the image as a circle. If false, uses a rectangle.
false


radius
double?
Border radius for rectangular images. Ignored if circle is true.
null (0 if not specified)


onTap
bool
Enables tap-to-view full-screen image functionality.
true


enableHero
bool
Enables hero animation for smooth transitions to full-screen view.
false


placeHolderWidget
Widget
Widget displayed while the image is loading or if it fails to load.
Icon(Icons.photo)


padding
double
Padding inside the container around the image.
0


bgColor
Color?
Background color of the container. Defaults to the theme's card color.
Theme.of(context).cardColor


height
double?
Height of the image container.
null (auto-sized)


width
double?
Width of the image container.
null (auto-sized)


fit
BoxFit
How the image should fit within the container.
BoxFit.fill


borderColor
Color?
Color of the border. Applied only if enableBorder is true.
Colors.grey[300]


enableBorder
bool
Enables or disables the border around the image.
true


borderWidth
double
Width of the border. Applied only if enableBorder is true.
1.0


boxShadow
List<BoxShadow>?
List of box shadows to apply to the container for elevation effects.
null (no shadow)


imageAlignment
Alignment
Alignment of the image within the container.
Alignment.center


backgroundImage
DecorationImage?
Optional background image for the container (not typically used).
null


clipBehavior
Clip
Clipping behavior for the image (e.g., anti-aliasing for smooth edges).
Clip.antiAlias


shapeDecoration
BoxShape?
Shape of the container. Overrides circle if provided.
null


Parameter Details

image: Specifies the source of the image. Supports:
Network URLs (e.g., https://example.com/image.jpg)
Asset paths (e.g., assets/image.png)
Local file paths (e.g., /path/to/image.jpg)
If null or empty, the placeHolderWidget is displayed.


circle: Determines whether the image is clipped into a circular shape (true) or a rectangle (false). When true, the radius parameter is ignored.
radius: Sets the corner radius for rectangular images. Ignored if circle is true. Useful for rounded rectangles.
onTap: Enables or disables the tap gesture to open the image in a full-screen view using ViewImageScreen.
enableHero: Wraps the image in a Hero widget for smooth transition animations when navigating to the full-screen view. The image string is used as the hero tag.
placeHolderWidget: A fallback widget displayed during image loading (for network images) or if the image fails to load.
padding: Adds padding inside the container, affecting the space between the image and the container's edges.
bgColor: Sets the background color of the container. If not specified, it defaults to the theme's card color.
height and width: Define the dimensions of the image container. If not set, the container sizes itself based on the child image.
fit: Controls how the image fits within the container (e.g., BoxFit.cover, BoxFit.cover, BoxFit.fill).
borderColor: Sets the color of the border. Defaults to a light grey if not specified.
enableBorder: Toggles the border on or off. If false, borderColor and borderWidth are ignored.
borderWidth: Sets the thickness of the border when enableBorder is true.
boxShadow: Applies shadow effects to the container for a raised or elevated appearance.
imageAlignment: Aligns the image within the container (e.g., Alignment.topLeft, Alignment.center).
backgroundImage: An optional background image for the container. Note that this is rarely used as it may conflict with the primary image widget.
clipBehavior: Defines how the image is clipped (e.g., Clip.antiAlias for smooth edges, Clip.hardEdge for sharper cuts).
shapeDecoration: Overrides the shape of the container (e.g., BoxShape.circle or BoxShape.rectangle). If provided, it takes precedence over the circle parameter.

Examples
Below are several examples demonstrating different configurations of the ImageLoaderFlutterWidgets widget.
Example 1: Circular Network Image with Border and Hero Animation
Display a circular image from a network URL with a border and hero animation for full-screen transitions.
ImageLoaderFlutterWidgets(
  image: 'https://example.com/sample.jpg',
  circle: true,
  radius: 50.0,
  enableHero: true,
  borderColor: Colors.black,
  borderWidth: 2.0,
  fit: BoxFit.cover,
  height: 100.0,
  width: 100.0,
)

Example 2: Rectangular Asset Image with Shadow
Display a rectangular image from the app's assets with a shadow effect and no border.
ImageLoaderFlutterWidgets(
  image: 'assets/profile.png',
  circle: false,
  radius: 10.0,
  enableBorder: false,
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
  height: 150.0,
  width: 150.0,
  fit: BoxFit.cover,
)

Example 3: Local File Image with Custom Placeholder
Display an image from the local file system with a custom placeholder widget and padding.
ImageLoaderFlutterWidgets(
  image: '/path/to/local/image.jpg',
  circle: false,
  radius: 8.0,
  placeHolderWidget: const Text('Loading...'),
  padding: 8.0,
  bgColor: Colors.grey[200],
  height: 120.0,
  width: 120.0,
  fit: BoxFit.contain,
)

Example 4: Disabled Tap and No Hero Animation
Display a network image without tap-to-view functionality or hero animation.
ImageLoaderFlutterWidgets(
  image: 'https://example.com/photo.jpg',
  circle: true,
  onTap: false,
  enableHero: false,
  height: 80.0,
  width: 80.0,
  fit: BoxFit.fill,
)

Example 5: Custom Clipping and Alignment
Display a network image with custom clipping behavior and top-left alignment.
ImageLoaderFlutterWidgets(
  image: 'https://example.com/image.jpg',
  circle: false,
  radius: 12.0,
  imageAlignment: Alignment.topLeft,
  clipBehavior: Clip.hardEdge,
  height: 200.0,
  width: 200.0,
  fit: BoxFit.cover,
)

Notes

Network Images: The cached_network_image package is used for efficient loading and caching of network images. Ensure the dependency is added to your project.
Asset Images: Asset images must be declared in your pubspec.yaml under the assets section.
Local File Images: Ensure proper file access permissions are configured in your app (e.g., for Android, add storage permissions in AndroidManifest.xml).
ViewImageScreen: The full-screen image view functionality relies on a ViewImageScreen widget, which must be implemented separately or provided as part of your package. The widget expects an ImageProvider for rendering the image.
Hero Animations: The enableHero option uses the image string as the hero tag. Ensure each image has a unique image value to avoid hero animation conflicts.
Error Handling: If the image fails to load or is null, the placeHolderWidget is displayed. Customize this widget to match your app’s design.
Performance: The CachedNetworkImage widget caches network images to improve performance. Adjust cache settings in the cached_network_image package if needed.

Dependencies

cached_network_image: For loading and caching network images.
flutter: Core Flutter framework for widget rendering and theming.
dart:io: For handling local file images.

Limitations

The backgroundImage parameter is included but not typically used, as it may conflict with the primary image widget. Use with caution.
The shapeDecoration parameter overrides the circle parameter if provided, which may lead to unexpected behavior if both are set.
The ViewImageScreen widget is not included in the provided code and must be implemented separately.

License
This project is licensed under the MIT License.