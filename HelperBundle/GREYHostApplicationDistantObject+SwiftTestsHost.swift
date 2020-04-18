//
//  GREYHostApplicationDistantObject+SwiftTestsHost.swift
//  HelperBundle
//
//  Created by Bastián Véliz Vega on 18-04-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

extension GREYHostApplicationDistantObject: SwiftTestsHost {
    func interfaceOrientation() -> UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }
}
