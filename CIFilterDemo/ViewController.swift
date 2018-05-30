//
//  ViewController.swift
//  CIFilterDemo
//
//  Created by Johnny Wang on 2018/5/30.
//  Copyright © 2018年 Johnny Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var brightnessSlider: UISlider!
    @IBOutlet weak var contrastSlider: UISlider!
    @IBOutlet weak var saturationSlider: UISlider!
    @IBOutlet weak var hueSlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //List all CIFilter
        print(CIFilter.filterNames(inCategory: kCICategoryBuiltIn))
        
        //List all parameters of CIHueAdjust CIFilter
        print(CIFilter(name: "CIHueAdjust")?.attributes ?? "")
    }

    @IBAction func valueChanged(_ sender: UISlider) {
        let image = CIImage(image: UIImage(named: "DemoIMG")!)
        
        let colorfilter = CIFilter(name: "CIColorControls")
        colorfilter?.setValue(image, forKey: kCIInputImageKey)
        colorfilter?.setValue(brightnessSlider.value, forKey: kCIInputBrightnessKey)
        colorfilter?.setValue(contrastSlider.value, forKey: kCIInputContrastKey)
        colorfilter?.setValue(saturationSlider.value, forKey: kCIInputSaturationKey)
        
        let hueFilter = CIFilter(name: "CIHueAdjust")
        hueFilter?.setValue(colorfilter?.outputImage, forKey: kCIInputImageKey)
        hueFilter?.setValue(hueSlider.value, forKey: kCIInputAngleKey)
        
        let result = hueFilter?.outputImage
        imageView.image = UIImage(ciImage: result!)
        
        print("b:\(brightnessSlider.value), c:\(contrastSlider.value), s:\(saturationSlider.value), h:\(hueSlider.value)")
    }
    
}

