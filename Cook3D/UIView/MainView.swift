//
//  MainView.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

class MainView: MTKView {
    
    var renderer: Renderer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        
        FusionCore.StartFusion(device: device!)
        
        self.clearColor = Options.ClearColor
        self.colorPixelFormat = Options.MainPixelFormat
        
        self.renderer = Renderer()
        self.delegate = renderer
    }
    
}
