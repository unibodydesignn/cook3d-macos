//
//  VertexDescriptorLibrary.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor! { get }
}

class VertexDescriptorLibrary {
    
    private static var vertexDescriptors: [VertexDescriptorTypes: VertexDescriptor] = [:]
    
    public static func InitializeLibrary(){
        createDefaultVertexDescriptors()
    }
    
    private static func createDefaultVertexDescriptors(){
        vertexDescriptors.updateValue(Basic_VertexDescriptor(), forKey: .Basic)
    }
    
    public static func VertexDescriptor(_ vertexDescriptorType: VertexDescriptorTypes)->MTLVertexDescriptor{
        return vertexDescriptors[vertexDescriptorType]!.vertexDescriptor
    }
    
}

enum VertexDescriptorTypes {
    case Basic
}

public struct Basic_VertexDescriptor: VertexDescriptor{
    var name: String = "Basic Vertex Descriptor"
    
    var vertexDescriptor: MTLVertexDescriptor!
    init() {
        vertexDescriptor = MTLVertexDescriptor()
        
        //Position
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        
        //Color
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = float3.size
        
        vertexDescriptor.layouts[0].stride = Vertex.stride
        
    }
}
