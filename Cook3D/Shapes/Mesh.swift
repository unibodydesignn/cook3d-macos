//
//  Mesh.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
}

class CustomMesh: Mesh {
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    var vertexCount: Int! {
        return vertices.count
    }
    
    init() {
        createVertices()
        createBuffers()
    }
    
    func createVertices(){ }
    
    func createBuffers(){
        vertexBuffer = FusionCore.Device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count), options: [])
    }
}

class TriangleMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            Vertex(position: float3( 0, 1,0), color: float4(1,0,0,1)),
            Vertex(position: float3(-1,-1,0), color: float4(0,1,0,1)),
            Vertex(position: float3( 1,-1,0), color: float4(0,0,1,1))
        ]
    }
}

class RectangleMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            Vertex(position: float3( 0.5, 0.5,0), color: float4(1,0,0,1)), //Top Right
            Vertex(position: float3(-0.5, 0.5,0), color: float4(0,1,0,1)), //Top Left
            Vertex(position: float3(-0.5,-0.5,0), color: float4(0,0,1,1)),  //Bottom Left
            
            Vertex(position: float3( 0.5, 0.5,0), color: float4(1,0,0,1)), //Top Right
            Vertex(position: float3(-0.5,-0.5,0), color: float4(0,0,1,1)), //Bottom Left
            Vertex(position: float3( 0.5,-0.5,0), color: float4(1,0,1,1))  //Bottom Right
        ]
    }
}
