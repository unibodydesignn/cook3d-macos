//
//  BasicShape.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

class Shape: Node {
    
    var mesh: Mesh!
    
    init(meshType: MeshTypes) {
        mesh = MeshLibrary.Mesh(meshType)
    }
    
}


extension Shape: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
}
