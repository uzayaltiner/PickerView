
# ImagePickerView
ImagePickerView allows you to combine UIImageView and UIImagePicker in one line of code. Ready to use in Storyboard or Programmatic coding.
## Installation

**Swift Package Manager**

In Xcode go to `File`  -> `Add Packages`  and insert url:

```https://github.com/uzayaltiner/ImagePickerView```

## Quick Start
```import ImagePickerView```

**Usage**

```swift
let imageView = ImagePickerView()
view.addSubview(imageView)
```
Thats all!

**Properties** (more to come)
```
imageView.placeholder = UIImage(named: "your_asset")
imageView.color = .yourColor
```

```
imageView.onImagePicker = { selectedImage in
  // After selecting the image, you can perform the operations you want to do here.
}
```
## Contribute

I made this to improve myself and we can add more features for expand the library. If you want to help, feel free to create PR.

  
## License

[MIT](https://choosealicense.com/licenses/mit/)

  
