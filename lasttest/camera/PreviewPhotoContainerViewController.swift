//
//  PreviewPhotoContainerViewController.swift
//  lasttest
//
//  Created by Juan Cabral on 02/11/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit

class PreviewPhotoContainerViewController : UIView {
    
    let previewImageView : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setUpPreviewImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpPreviewImageView(){
        addSubview(previewImageView)
        
        previewImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
}
