//
//  MeshLibrary.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

enum MeshTypes {
    case Triangle
    case Rectangle
}

class MeshLibrary {
    
    private static var meshes: [MeshTypes:Mesh] = [:]
    
    public static func InitializeLibrary(){
        createDefaultMeshes()
    }
    
    private static func createDefaultMeshes(){
        meshes.updateValue(TriangleMesh(), forKey: .Triangle)
        meshes.updateValue(RectangleMesh(), forKey: .Rectangle)
    }
    
    public static func Mesh(_ meshType: MeshTypes)->Mesh{
        return meshes[meshType]!
    }
    
}
