
## How to use

Load Network Image

```dart
 SizedBox(
    height: 100,
    width: 100,
    child: ImageLoaderFlutterWidgets(
          radius: 0,
          circle: false,
          image: "https://codingislife.net/wp-content/uploads/2023/09/Untitled_design__1___2_-removebg-preview-215x38.png",
        ),
    )
```

Load File Image

```dart
 SizedBox(
    height: 100,
    width: 100,
    child: ImageLoaderFlutterWidgets(
          radius: 0,
          circle: false,
          image: File("file_path").path,
        ),
    )
```

Load Assets Image

```dart
 SizedBox(
    height: 100,
    width: 100,
    child: ImageLoaderFlutterWidgets(
          radius: 0,
          circle: false,
          image: "assets/images/file_name.png",
        ),
    )
```
VIew fullscreen image

```dart
 SizedBox(
    height: 100,
    width: 100,
    child: ImageLoaderFlutterWidgets(
          radius: 0,
          circle: false,
          onTap: true,
          image: "assets/images/file_name.png",
        ),
    )
```

Show custom radius

```dart
 SizedBox(
    height: 100,
    width: 100,
    child: ImageLoaderFlutterWidgets(
          radius: 10,
          circle: false,
          onTap: true,
          image: "assets/images/file_name.png",
        ),
    )
```


Show circle image

```dart
 SizedBox(
    height: 100,
    width: 100,
    child: ImageLoaderFlutterWidgets(
          radius: 0,
          circle: true,
          image: "assets/images/file_name.png",
        ),
    )
```


