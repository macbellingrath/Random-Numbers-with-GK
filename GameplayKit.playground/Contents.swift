//: GameplayKit Playground

import Foundation
import XCPlayground
import GameplayKit
import UIKit

public func roll(samples: Int) -> [Int] {
    //build a source
    let source = GKARC4RandomSource()
    
    //drop the first n > 768 values
    source.dropValuesWithCount(1024)
    
    //build a distribution 
    let distribution = GKGaussianDistribution(randomSource: source, lowestValue: 0, highestValue: 100)
    
    //Access random values
    var counts = Array(count: 101, repeatedValue: 0)
    
    for _ in 1...samples {
        counts[distribution.nextInt()]++}
    return counts
}


public func go(){
    for (_, value) in roll(10000).enumerate(){
        XCPCaptureValue("Values", value: value)
    }
}


go()
















