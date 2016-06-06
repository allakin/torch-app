//
//  ViewController.swift
//  Torch
//
//  Created by Павел Анплеенко on 04/06/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	var images = ["torchon.jpg", "torchoff.jpg"]

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	//let image = UIImage(named: "torchon.jpg") as UIImage!
	
	@IBAction func torchButton(sender: AnyObject) {
			let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
				
			if device.hasTorch{
				do{
					try device.lockForConfiguration()
					device.torchMode = device.torchMode == AVCaptureTorchMode.On ? .Off : .On
					device.unlockForConfiguration()
				} catch{
					print(error)
				}
		}

	}
}

