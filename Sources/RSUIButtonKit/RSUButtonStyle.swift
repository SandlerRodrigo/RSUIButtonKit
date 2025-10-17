//
//  RSUButtonStyle.swift
//  RSUIButtonKit
//
//  Created by Rodrigo Sandler on 17/10/25.
//


import SwiftUI

public struct RSUButtonStyle: ButtonStyle {
    public enum Size { case small, medium, large }
    public enum Kind { case primary, secondary, destructive }

    private let size: Size
    private let kind: Kind
    private let isFullWidth: Bool

    public init(size: Size = .medium, kind: Kind = .primary, isFullWidth: Bool = false) {
        self.size = size
        self.kind = kind
        self.isFullWidth = isFullWidth
    }

    public func makeBody(configuration: Configuration) -> some View {
        let padding: EdgeInsets = {
            switch size {
            case .small: return EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)
            case .medium: return EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
            case .large: return EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20)
            }
        }()

        let bg: Color = {
            switch kind {
            case .primary: return .blue
            case .secondary: return .gray.opacity(0.2)
            case .destructive: return .red
            }
        }()

        let fg: Color = {
            switch kind {
            case .primary, .destructive: return .white
            case .secondary: return .primary
            }
        }()

        return configuration.label
            .font(.system(.headline))
            .foregroundStyle(fg)
            .frame(maxWidth: isFullWidth ? .infinity : nil)
            .padding(padding)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(bg)
                    .opacity(configuration.isPressed ? 0.8 : 1.0)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(kind == .secondary ? Color.gray.opacity(0.3) : .clear, lineWidth: 1)
            )
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}