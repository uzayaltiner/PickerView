

# ImagePickerView
ImagePickerView allows you to combine UIImageView and UIImagePicker in one line of code. Also adds Document Picker with single line of code to any UIView. Ready to use in Storyboard or Programmatic coding.
## Installation

**Swift Package Manager**

In Xcode go to `File`  -> `Add Packages`  and insert uArl:

```https://github.com/uzayaltiner/ImagePickerView```

# Quick Start
## ImagePickerView
```import ImagePickerView```

**Usage**

```swift
let imageView = ImagePickerView()
view.addSubview(imageView)
```
Thats all!

**Properties** (more to come)
```swift
imageView.placeholder = UIImage(named: "your_asset")
imageView.color = .yourColor
imageView.cornerRadius = 10
```

```swift
imageView.onImagePicker = { selectedImage in
  // After selecting the image, you can perform the operations you want to do here.
}
```
## DocumentPicker

**Usage**
```swift
let exampleView = UIView()
exampleView.setupDocumentPicker { url in
        // After selecting the document's url path, you can perform the operations you want to do here.
    }
view.addSubview(exampleView)
```


## Contribute

I made this to improve myself and we can add more features for expand the library. If you want to help, feel free to create PR.

## Contact

For your requests and suggestions, you can contact with me from uzayaltiner@gmail.com

## License

[MIT](https://github.com/uzayaltiner/ImagePickerView/blob/main/LICENSE)
