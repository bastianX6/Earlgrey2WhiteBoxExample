//
//  GREYHostApplicationDistantObject+SwiftTestsHost.swift
//  HelperBundle
//
//  Created by Bastián Véliz Vega on 18-04-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

@testable import Earlgrey2WhiteBoxExample
import Foundation

extension GREYHostApplicationDistantObject: SwiftTestsHost {
    public func interfaceOrientation() -> UIInterfaceOrientation {
        guard let orientation = UIApplication.shared.windows.first?.windowScene?.interfaceOrientation else {
            #if DEBUG
                fatalError("Could not obtain UIInterfaceOrientation from a valid windowScene")
            #else
                return nil
            #endif
        }
        return orientation
    }

    public func getRootVC() -> UIViewController {
        // Get the foreground, active scene
        let foregroundScene = UIApplication.shared.connectedScenes.filter { $0.activationState == .foregroundActive }.first!
        // get the scene delegate for the aforementioned scene
        let sceneDelegate = foregroundScene.delegate as! SceneDelegate

        return sceneDelegate.window!.rootViewController!
    }

    public func dismissModal() {
        self.getRootVC().dismiss(animated: true, completion: nil)
    }
}
