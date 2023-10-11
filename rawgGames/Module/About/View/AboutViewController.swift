//
//  AboutViewController.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 10/10/23.
//

import Foundation
import UIKit
import SwiftUI

class AboutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "About"
        let swiftUIView = AboutSwiftUI()
        let hostingController = UIHostingController(rootView: swiftUIView)
        // Add the hosting controller's view as a child view
        addChild(hostingController)
        let hostingView = hostingController.view
        view.addSubview(hostingView!)
        hostingView!.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        hostingController.didMove(toParent: self)
        
    }
    
}
