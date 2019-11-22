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
