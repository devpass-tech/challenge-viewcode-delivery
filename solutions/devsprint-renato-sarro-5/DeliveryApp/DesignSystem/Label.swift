import UIKit

enum LabelStyle {
    case largeTitle
    case titleThree
    case titleTwo
    case captionOne
    case subheadline(weight: UIFont.Weight)
    case footnote
    case callout
}

extension UILabel {
    static func build(style: LabelStyle, numberOfLines: Int = 0, alignment: NSTextAlignment = .left) -> UILabel {
        let label: UILabel
        
        switch style {
        case .largeTitle:
            label = buildLargeTitle()
        case .titleThree:
            label = buildTitleThree()
        case .titleTwo:
            label = buildTitleTwo()
        case .captionOne:
            label = buildCaptionOne()
        case .subheadline(let weight):
            label = buildSubheadline(weight: weight)
        case .footnote:
            label = buildFootnote()
        case .callout:
            label = buildCallout()
        }
        
        label.numberOfLines = numberOfLines
        label.textAlignment = alignment
        
        return label
    }
    
    private static func buildCaptionOne() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = DesignSystemColor.secondary.color
        
        return label
    }
    
    private static func buildCallout() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = DesignSystemColor.primary.color
        
        return label
    }
    
    private static func buildFootnote() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = DesignSystemColor.secondary.color
        
        return label
    }
    
    private static func buildLargeTitle() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.textColor = DesignSystemColor.primary.color
        
        return label
    }
    
    private static func buildTitleThree() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = DesignSystemColor.primary.color
        
        return label
    }
    
    private static func buildTitleTwo() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = DesignSystemColor.primary.color
        
        return label
    }
    
    private static func buildSubheadline(weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: weight)
        label.textColor = DesignSystemColor.primary.color
        
        return label
    }
}
