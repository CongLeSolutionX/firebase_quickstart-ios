// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit

final class EmptyView: UIView {
    
    init() {
        super.init(frame: CGRect.zero)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        let systemImageName = "exclamationmark.circle"
        let placeHolderImage = UIImage(systemName: systemImageName)?.withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: placeHolderImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        let label = UILabel()
        label.numberOfLines = 3
        label.attributedText = configuredAttributedString()
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.80).isActive = true
    }
    
    private func configuredAttributedString() -> NSAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byWordWrapping
        paragraph.alignment = .center
        
        let attributes: [NSAttributedString.Key : Any] = [.paragraphStyle: paragraph, .foregroundColor: UIColor.secondaryLabel]
        
        let imageAttachment = NSTextAttachment()
        let imageName = "person.crop.circle.fill.badge.plus"
        let image = UIImage(systemName: imageName)?.withTintColor(.systemOrange, renderingMode: .alwaysOriginal)
        imageAttachment.image = image
        
        let firstPartOfString = "There are no users currently signed in. Press the "
        let secondPartOfString = " button on the tab bar and select a login option."
        let fullString = NSMutableAttributedString(string: firstPartOfString)
        fullString.append(NSAttributedString(attachment: imageAttachment))
        fullString.append(NSAttributedString(string: secondPartOfString))
        fullString.addAttributes(attributes, range: NSRange(location: 0, length: fullString.length))
        
        return fullString
    }
    
}
