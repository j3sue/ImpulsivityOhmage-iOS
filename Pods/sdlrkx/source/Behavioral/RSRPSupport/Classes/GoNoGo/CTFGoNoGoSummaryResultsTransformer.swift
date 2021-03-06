//
//  CTFGoNoGoSummaryResultsGenerator.swift
//  ImpulsivityOhmage
//
//  Created by James Kizer on 1/30/17.
//  Copyright © 2017 Foundry @ Cornell Tech. All rights reserved.
//

import UIKit
import ResearchKit
import sdlrkx
import ResearchSuiteResultsProcessor

public class CTFGoNoGoSummaryResultsTransformer: RSRPFrontEndTransformer {

    public static func transform(parameters: [String : ORKStepResult]) -> RSRPIntermediateResult? {
        
        guard let goNoGoResult = parameters["GoNoGoResult"]?.firstResult as? CTFGoNoGoResult else {
            return nil
        }
        
        guard let summary = CTFGoNoGoSummary(result: goNoGoResult) else {
            return nil
        }
        
        summary.startDate = goNoGoResult.startDate
        summary.endDate = goNoGoResult.endDate
        
        return summary
    }
    
    private static let supportedTypes = [
        "GoNoGoSummary"
    ]
    
    public static func supportsType(type: String) -> Bool {
        return self.supportedTypes.contains(type)
    }
}
