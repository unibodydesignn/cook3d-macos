//
//  BasicShape.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

class BasicShape {
    
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    
    init() {
        createVertices()
        createBuffers()
    }
    
    func createVertices(){
        vertices = [
            Vertex(position: float3( 0, 1,0), color: float4(1,0,0,1)),
            Vertex(position: float3(-1,-1,0), color: float4(0,1,0,1)),
            Vertex(position: float3( 1,-1,0), color: float4(0,0,1,1))
        ]
    }
    
    func createBuffers(){
        vertexBuffer = FusionCore.Device?.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count), options: [])
    }
    
    func renderShape(_ renderCommandEncoder: MTLRenderCommandEncoder!) {
        renderCommandEncoder?.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
    }
}
