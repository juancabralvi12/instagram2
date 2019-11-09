//
//  CameraController.swift
//  lasttest
//
//  Created by Juan Cabral on 02/11/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit
import AVKit

class CameraController : UIViewController, AVCapturePhotoCaptureDelegate, UIViewControllerTransitioningDelegate {
    let output = AVCapturePhotoOutput()
    let capturePhotoButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "capture_photo")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleCapturePhoto), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transitioningDelegate = self
        setUpCaptureSession()
        setupButton()
        
    }
    
    @objc func handleCapturePhoto()
    {
        let settings = AVCapturePhotoSettings()
        guard let previewFormatType = settings.availablePreviewPhotoPixelFormatTypes.first else { return }
        settings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String : previewFormatType]
        output.capturePhoto(with: settings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        let previewImage = UIImage(data: imageData)
        let containerView = PreviewPhotoContainerViewController()
        containerView.previewImageView.image = previewImage
        view.addSubview(containerView)
        
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func setUpCaptureSession(){
        // Start instance session
        let captureSession = AVCaptureSession()
        // Add inputs and outputs
        guard let videoDevice = AVCaptureDevice.default(for: .video)
            else { return }
        do {
            let input = try AVCaptureDeviceInput(device: videoDevice)
            if captureSession.canAddInput(input){
                captureSession.addInput(input)
            }
        } catch let error as NSError {
            print("Error: ", error)
        }
        if captureSession.canAddOutput(output){ captureSession.addOutput(output)}
        // Adding our session to our view
        let previewlayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewlayer.frame = view.frame
        view.layer.addSublayer(previewlayer)
        captureSession.startRunning()
    }
    
    func setupButton(){
        view.addSubview(capturePhotoButton)
        
        capturePhotoButton.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 80, height: 80)
        capturePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
