

import UIKit

public class Segment {
    let color: UIColor
    let value: CGFloat
    let label: String
    let labelColor: UIColor
    
    public init(color: UIColor,
                value: CGFloat,
                label:String,
                labelColor: UIColor) {
        self.color = color
        self.value = value
        self.label = label
        self.labelColor = labelColor
    }
}

public class PieChart: UIView {
    
    public var segments: [Segment] = []{
        didSet {
            setNeedsDisplay()
        }
    }
    
    override public func prepareForInterfaceBuilder() {
        setNeedsDisplay()
    }
    
    override public func draw(_ rect: CGRect) {
        guard let contex = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let radius = min(frame.width, frame.height) * 0.5
        let viewCenter = bounds.center
        let textPositionOffset:CGFloat = 0.6
        let totalSegmantsValue = segments.reduce(0, {$0 + $1.value})
        var startAngle = -CGFloat.pi * 0.5
        
        for segment in segments {
            contex.setFillColor(segment.color.cgColor)
            
            let endAngle = startAngle + 2 * .pi * (segment.value/totalSegmantsValue)
            contex.move(to: viewCenter)
            contex.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            contex.fillPath()
            
            let halfAngle = startAngle + (endAngle - startAngle)/2
            let segmentCenter = viewCenter.projected(by: radius * textPositionOffset, angle: halfAngle)
            let textToRender = segment.label as NSString
            let labelAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 10),
                .foregroundColor: segment.labelColor
            ]
            let renderRect = CGRect(centeredOn: segmentCenter, size: textToRender.size(withAttributes: labelAttributes))
            textToRender.draw(in: renderRect, withAttributes: labelAttributes)
            
            startAngle = endAngle
        }
    }
    
    public func setSize(width: CGFloat, height: CGFloat) {
        heightConstraint?.constant = height
        widthConstraint?.constant = width
    }
}
