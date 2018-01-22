//
//  ClosedRange+Utils.swift
//  PocketTool-iOS
//
//  Created by Mateusz on 18.12.2017.
//  Copyright © 2017 Vindur. All rights reserved.
//

import Foundation

public extension ClosedRange where Bound: FloatingPoint {
    
    
    public func lerp(with progress: Bound) -> Bound {
        return (1 - progress) * self.lowerBound + progress * self.upperBound
    }
    
    public func inverseLerp(with value: Bound) -> Bound {
        return (value - self.lowerBound) / (self.upperBound - self.lowerBound)
    }
    
    public func remap(_ value: Bound, in newRange: ClosedRange<Bound>) -> Bound {
        return newRange.lerp(with: inverseLerp(with: value))
    }
    
    public func random() -> Bound {
        let max = UInt32.max
        return
            Bound(arc4random_uniform(max)) /
                Bound(max) *
                (upperBound - lowerBound) +
        lowerBound
    }
}

public extension ClosedRange where Bound: BinaryInteger {
    public func lerp(with progress: Bound) -> Bound {
        return (1 - progress) * self.lowerBound + progress * self.upperBound
    }
    
    public func inverseLerp(with value: Bound) -> Bound {
        return (value - self.lowerBound) / (self.upperBound - self.lowerBound)
    }
    
    public func remap(_ value: Bound, in newRange: ClosedRange<Bound>) -> Bound {
        return newRange.lerp(with: inverseLerp(with: value))
    }
    
    public func random() -> Bound {
        return self.lowerBound + Bound(arc4random_uniform(UInt32(self.upperBound - self.lowerBound)))
    }
}

