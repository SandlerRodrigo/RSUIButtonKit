// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct RSUButton: View {
    private let title: String
    private let action: () -> Void
    private let style: RSUButtonStyle
    private let systemImage: String?

    public init(
        _ title: String,
        systemImage: String? = nil,
        style: RSUButtonStyle = RSUButtonStyle(),
        action: @escaping () -> Void
    ) {
        self.title = title
        self.systemImage = systemImage
        self.style = style
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let systemImage { Image(systemName: systemImage) }
                Text(title)
            }
        }
        .buttonStyle(style)
        .accessibilityLabel(Text(title))
        .accessibilityAddTraits(.isButton)
    }
}
