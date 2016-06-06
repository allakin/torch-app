//
//  ViewController.swift
//  torch0.1
//
//  Created by Павел Анплеенко on 06/06/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	
	let imageon = "torchon.jpg"
	let imageoff = "torchoff.jpg"
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func torchButton(sender: AnyObject) {
		var device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
		
		if (device.hasTorch) {
			do {
				try device.lockForConfiguration()
				if (device.torchMode == AVCaptureTorchMode.On) {
					device.torchMode = AVCaptureTorchMode.Off
				} else {
					try device.setTorchModeOnWithLevel(1.0)
				}
				device.unlockForConfiguration()
			} catch {
				print(error)
			}
		}
//		if device.hasTorch{
//			do{
//				try device.lockForConfiguration()
//				device.torchMode = device.torchMode == AVCaptureTorchMode.On ? .Off : .On
//				device.torchMode = UIImage(named: "torchon")
//				device.unlockForConfiguration()
//			} catch{
//				print(error)
//			}
//		}
	}
}

