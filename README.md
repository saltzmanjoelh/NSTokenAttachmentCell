# NSTokenAttachmentCell

A description of this package.


You can make the private method available like this:

```
extension NSTokenFieldCell {
    //This is a private method, we declare it so that we can override it. The default implementation still gets called
    @objc func setUpTokenAttachmentCell(_ aCell: NSTokenAttachmentCell?, forRepresentedObject anObj: Any?) -> NSTokenAttachmentCell? {
        return aCell
    }
}
```

You will then want to make your custom token cell for drawing with:
```
public class CustomTokenAttachmentCell: NSTokenAttachmentCell {
    @objc public override func drawToken(withFrame fp8: NSRect, inView fp24: Any!) {
        super.drawToken(withFrame: fp8, inView: fp24)
        drawImage()
    }
    @objc public override func drawInterior(withFrame fp8: NSRect, in fp24: Any!) {
        super.drawInterior(withFrame: fp8, in: fp24)
        drawImage()
    }

    override open func drawingRect(forBounds rect: NSRect) -> NSRect {
        let result = super.drawingRect(forBounds: rect)
        lastDrawingRect = result
        return result
    }
    override open func titleRect(forBounds rect: NSRect) -> NSRect {
        //Make some space for the image to be drawn.
        // [**title**]
    }


    func drawImage() {
        //custom drawing here
    }
}
```

You can now access the method to override it:

```
public class CustomTokenFieldCell: NSTokenFieldCell {
    //Now we can override it and have some custom drawing actions
    @objc override public func setUpTokenAttachmentCell(_ aCell: NSTokenAttachmentCell?, forRepresentedObject anObj: Any?) -> NSTokenAttachmentCell? {
        //note the CustomTokenAttachmentCell here
        let customCell = CustomTokenAttachmentCell.init(textCell: aCell?.stringValue)
        customCell?.attachment = aCell?.attachment
        customCell?.representedObject = anObj
        return customCell
    }
    var lastStringValue = String()
    var lastAttributedString: NSAttributedString?
    @objc override public var attributedStringValue: NSAttributedString {
        get {
            //Try to prevent the cell from creating expensive NSAttributedStrings when it doesn't have to
            if lastAttributedString == nil ||
                lastStringValue != stringValue {
                lastAttributedString = super.attributedStringValue
                lastStringValue = stringValue
            }
            return lastAttributedString ?? super.attributedStringValue
        }
        set {
            super.attributedStringValue = newValue
        }
    }
}
```

Finally, in Interface Builder, I update use the Custom Class section to change the NSTokenFieldCell to CustomTokenFieldCell
