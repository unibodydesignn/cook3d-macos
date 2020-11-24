//
//  FusionCore.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

class FusionCore {
    
    public static var Device: MTLDevice!
    public static var DeviceCommandQueue: MTLCommandQueue!
    
    public static func StartFusion(device: MTLDevice) {
        
        self.Device = device
        self.DeviceCommandQueue = device.makeCommandQueue()
        
        CoreLibraries.InitializeLibraries()
    }
    
}
