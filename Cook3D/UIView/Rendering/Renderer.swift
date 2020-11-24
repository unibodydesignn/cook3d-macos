//
//  Renderer.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

class Renderer: NSObject {
    
    var basicShape: Shape = Shape(meshType: .Rectangle)
}

extension Renderer: MTKViewDelegate {
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
        // Change aspect ration when windows size is changed!
    }
    
    // Call this draw function 60 times at a second - 60 FPS
    func draw(in view: MTKView) {
        
        guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        
        let commandBuffer = FusionCore.DeviceCommandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        basicShape.doRender(renderCommandEncoder!)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
        
    }
}
