//
//  Libraries.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

class CoreLibraries {
    
    public static func InitializeLibraries() {
        
        ShaderLibrary.InitializeLibrary()
        VertexDescriptorLibrary.InitializeLibrary()
        RenderPipelineDescriptorLibrary.InitializeLibrary()
        RenderPipelineStateLibrary.InitializeLibrary()
        
    }
}
