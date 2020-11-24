//
//  MainView.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

class MainView: MTKView {
    
    var commandQueue: MTLCommandQueue!
        var renderPipelineState: MTLRenderPipelineState!
        
        required init(coder: NSCoder) {
            super.init(coder: coder)
            
            self.device = MTLCreateSystemDefaultDevice()
            self.clearColor = MTLClearColor(red: 0.5, green: 0.5, blue: 0.66, alpha: 1.0)
            self.colorPixelFormat = .bgra8Unorm
            self.commandQueue = device?.makeCommandQueue()
            
            createRenderPipelineState()
        }
        
        func createRenderPipelineState() -> Void {
            
            let library = device?.makeDefaultLibrary()
            let vertexFunction = library?.makeFunction(name: "basic_vertex_function")
            let fragmentFunction = library?.makeFunction(name: "basic_fragment_function")
            
            let renderPipelineStateDescriptor = MTLRenderPipelineDescriptor()
            renderPipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
            renderPipelineStateDescriptor.vertexFunction = vertexFunction
            renderPipelineStateDescriptor.fragmentFunction = fragmentFunction
            
            do {
                renderPipelineState = try device?.makeRenderPipelineState(descriptor: renderPipelineStateDescriptor)
            } catch let error as NSError { print(error) }
            
        }
        
        override func draw(_ rect: CGRect) {
            guard let drawable = self.currentDrawable, let renderPassDescriptor = self.currentRenderPassDescriptor else { return }
            
            let commandBuffer = commandQueue.makeCommandBuffer()
            let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
            renderCommandEncoder?.setRenderPipelineState(renderPipelineState)
            
            renderCommandEncoder?.endEncoding()
            commandBuffer?.present(drawable)
            commandBuffer?.commit()
            
        }
}
