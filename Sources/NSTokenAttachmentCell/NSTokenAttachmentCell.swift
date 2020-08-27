//
//  NSTokenAttachmentCell.swift
//  NSTokenAttachmentCell
//
//  Created by Joel Saltzman on 8/27/20.
//

import Foundation

public protocol NSTokenAttachmentCell {
    #if os(macOS)
    var stringValue: String { get set }
    #endif
}
