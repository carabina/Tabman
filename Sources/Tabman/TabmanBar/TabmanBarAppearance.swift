//
//  TabmanBarStyle.swift
//  Tabman
//
//  Created by Merrick Sapsford on 22/02/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import UIKit

public extension TabmanBar {
    
    /// Appearance configuration for a TabmanBar.
    public class AppearanceConfig: Any {
        
        // MARK: Structs
        
        /// Indicator configuration
        public struct Indicator {
            /// The preferred style to use for the indicator. 
            /// This is optionally conformed to by the bar.
            public var preferredStyle: TabmanIndicator.Style?
            /// The color of the bar indicator.
            public var color: UIColor?
            /// The weight (thickness) of the bar indicator.
            public var weight: TabmanLineIndicator.Weight?
            /// Whether the indicator transiton is progressive.
            public var isProgressive: Bool?
            /// Whether the indicator bounces at the end of page ranges.
            public var bounces: Bool?
            /// Whether to use rounded corners on line indicators.
            public var useRoundedCorners: Bool?
        }
        
        /// Text configuration
        public struct Text {
            /// The font to use for text labels in the bar.
            public var font: UIFont?
            /// The text color to use for selected tabs in the bar.
            public var selectedColor: UIColor?
            /// The text color to use for tabs in the bar.
            public var color: UIColor?
        }
        
        /// Layout configuration
        public struct Layout {
            /// The spacing between items in the bar.
            public var interItemSpacing: CGFloat?
            /// The spacing at the edge of the items in the bar.
            public var edgeInset: CGFloat?
        }
        
        /// Bar style configuration.
        public struct Style {
            /// The background style for the bar.
            public var background: TabmanBarBackgroundView.BackgroundStyle?
            /// Whether to show a fade on the items at the bounds edge of the bar.
            public var showEdgeFade: Bool?
        }
        
        /// Bar interaction configuration
        public struct Interaction {
            /// Whether scroll is enabled on the scroll view in the bar.
            public var isScrollEnabled: Bool?
        }
        
        // MARK: Properties
        
        /// The indicator configuration.
        public lazy var indicator = Indicator()
        /// Text display configuration.
        public lazy var text = Text()
        /// Layout configuration.
        public lazy var layout = Layout()
        /// Bar style configuration.
        public lazy var style = Style()
        /// Bar interaction configuration
        public lazy var interaction = Interaction()
        
        // MARK: Init

        public init(_ configurer: (AppearanceConfig) -> ()) {
            self.setDefaultValues()
            configurer(self)
        }
        
        static var defaultAppearance: AppearanceConfig {
            let config = AppearanceConfig({ _ in })
            config.setDefaultValues()
            return config
        }
        
        private func setDefaultValues() {
            
            self.indicator.bounces = true
        }
    }
}

/// Appearance updating
public protocol TabmanAppearanceUpdateable {
    
    /// Update the appearance of the tab bar for a new configuration.
    ///
    /// - Parameter appearance: The new configuration.
    func update(forAppearance appearance: TabmanBar.AppearanceConfig)
}
