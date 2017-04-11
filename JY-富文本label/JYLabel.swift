//
//  JYLabel.swift
//  JY-富文本label
//
//  Created by atom on 2017/4/11.
//  Copyright © 2017年 atom. All rights reserved.
//

import UIKit

class JYLabel: UILabel {
    
    override var text: String? {
        didSet {
            
            prepareTextStorage()
        
        }
    }
    
    override func drawText(in rect: CGRect) {
        let range = NSRange(location: 0, length: textStorage.length)
        layoutManager.drawGlyphs(forGlyphRange: range, at: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareTextSystem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        prepareTextSystem()
        
    }
    
    private func prepareTextSystem() {
        prepareTextStorage()
        textStorage.addLayoutManager(layoutManager)
        layoutManager.addTextContainer(textContainer)
    }
    
    private func prepareTextStorage() {
        if attributedText != nil {
            textStorage.setAttributedString(attributedText!)
        } else {
            textStorage.setAttributedString(NSAttributedString(string: text!))
        }
        
        if let ranges = urlRange() {
            for r in ranges {
                textStorage.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: r)
            }
        }
    }
    
    private func urlRange() -> [NSRange]? {
        let pattern = "[a-zA-Z]*://[a-zA-Z0-9/\\.]*"
        let regex = try! NSRegularExpression(pattern: pattern, options: .dotMatchesLineSeparators)
        let results = regex.matches(in: textStorage.string, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSRange(location: 0, length: textStorage.length))
        var ranges = [NSRange]()
        for r in results {
            ranges.append(r.rangeAt(0))
        }
        return ranges
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private lazy var textStorage = NSTextStorage()
    private lazy var layoutManager = NSLayoutManager()
    private lazy var textContainer = NSTextContainer()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
