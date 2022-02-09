//
//  ScannerViewController.swift
//  CodeScanner
//
//  Created by Oliwia Michalak on 09/02/2022.
//

import UIKit
import AVFoundation

protocol ScannerViewControllerDelegate: AnyObject {
    func didFind(barcode: String)
    func didErrorSurface(error: CameraError)
}

final class ScannerViewController: UIViewController {

    // MARK: Public properities
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var delegate: ScannerViewControllerDelegate?

    // MARK: Lifecycle
    init(scannerDelegate: ScannerViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = scannerDelegate
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let previewLayer = previewLayer else {
            delegate?.didErrorSurface(error: .invalidDeviceInput)
            return
        }

        previewLayer.frame = view.layer.bounds
    }

    // MARK: Private functions
    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            delegate?.didErrorSurface(error: .invalidDeviceInput)
            return
        }

        let videoInput: AVCaptureDeviceInput

        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            delegate?.didErrorSurface(error: .invalidDeviceInput)
            return
        }

        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            delegate?.didErrorSurface(error: .invalidDeviceInput)
            return
        }

        let metaDataOutput = AVCaptureMetadataOutput()

        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            delegate?.didErrorSurface(error: .invalidDeviceInput)
            return
        }

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)

        if let previewLayer = previewLayer {
            previewLayer.videoGravity = .resizeAspectFill
            view.layer.addSublayer(previewLayer)
        }

        captureSession.startRunning()
    }
}

extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else {
            delegate?.didErrorSurface(error: .invalidScannerValue)
            return
        }

        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            delegate?.didErrorSurface(error: .invalidScannerValue)
            return
        }

        guard let barcode = machineReadableObject.stringValue else {
            delegate?.didErrorSurface(error: .invalidScannerValue)
            return
        }

        delegate?.didFind(barcode: barcode)
    }
}
