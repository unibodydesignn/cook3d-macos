//
//  RenderPipelineDescriptorLibrary.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

protocol RenderPipelineDescriptor {
    
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor { get }
}

public struct BasicRenderPipelineDescriptor: RenderPipelineDescriptor {
    var name: String = "Basic Render Pipeline Descriptor"
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor {
        
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = Options.MainPixelFormat
        renderPipelineDescriptor.vertexFunction = ShaderLibrary.VertexFunction(.Default)
        renderPipelineDescriptor.fragmentFunction = ShaderLibrary.FragmentFunction(.Default)
        renderPipelineDescriptor.vertexDescriptor = VertexDescriptorLibrary.VertexDescriptor(.Basic)
        
        return renderPipelineDescriptor
    }
}

enum RenderPipelineDescriptorTypes {
    case Basic
}

class RenderPipelineDescriptorLibrary {
    
    private static var renderPipelineDescriptors: [RenderPipelineDescriptorTypes : RenderPipelineDescriptor] = [:]
    
    public static func InitializeLibrary() {
        createDefaultRenderPipelineDescriptors()
    }
    
    private static func createDefaultRenderPipelineDescriptors() {
        renderPipelineDescriptors.updateValue(BasicRenderPipelineDescriptor(), forKey: .Basic)
    }
    
    public static func RenderPipelineDescriptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorTypes) -> MTLRenderPipelineDescriptor {
        return renderPipelineDescriptors[renderPipelineDescriptorType]!.renderPipelineDescriptor
    }
    
}
