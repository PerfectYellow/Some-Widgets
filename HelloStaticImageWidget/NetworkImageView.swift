//
//  NetworkImageView.swift
//  SimpleStaticWidgetExtension
//
//  Created by Mohammad Afshar on 20/01/2024.
//

import SwiftUI

struct NetworkImageView: View {
    let url: URL
    var body: some View {
        if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
            Image(uiImage: image)
                .resizable()
//                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            Image(systemName: "person")
        }
    }
}
