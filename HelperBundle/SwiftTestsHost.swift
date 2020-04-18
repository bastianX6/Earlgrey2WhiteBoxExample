//
//  SwiftTestsHost.swift
//  HelperBundle
//
//  Created by Bastián Véliz Vega on 18-04-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

@objc
protocol SwiftTestsHost {
    /// Obtain the host application's interface orientation.
    func interfaceOrientation() -> UIInterfaceOrientation
}
