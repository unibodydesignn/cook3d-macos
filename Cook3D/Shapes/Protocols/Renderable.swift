//
//  Renderable.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

protocol Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder)
}
