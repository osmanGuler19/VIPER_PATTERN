//
//  View+Extension.swift
//  dummy_social-media
//
//  Created by Osman Güler on 1.05.2023.
//

import SwiftUI
import UIKit

func setupNavigationBarAppearanceForLogin(titleColor: UIColor, barColor: UIColor) {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = barColor
    appearance.titleTextAttributes = [.foregroundColor: titleColor]
    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().compactAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
}

