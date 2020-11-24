//
//  ShaderLibrary.swift
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

import MetalKit

protocol Shader {
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction! { get }
}

public struct DefaultVertexShader: Shader {
    
    public var name: String = "Default Vertex Shader"
    public var functionName: String = "default_vertex_shader"
    public var function: MTLFunction!
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function!.label = "Default Vertex Shader"
    }
    
}

public struct DefaultFragmentShader: Shader {
    public var name: String = "Default Fragment Shader"
    public var functionName: String = "default_fragment_shader"
    public var function: MTLFunction!
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function!.label = "Default Fragment Shader"
    }
}

enum VertexShaderTypes{
    case Default
}

enum FragmentShaderTypes {
    case Default
}

class ShaderLibrary {
    
    public static var DefaultLibrary: MTLLibrary!
    private static var vertexShaders: [VertexShaderTypes: Shader] = [:]
    private static var fragmentShaders: [FragmentShaderTypes: Shader] = [:]
    
    public static func InitializeLibrary() {
        DefaultLibrary = FusionCore.Device.makeDefaultLibrary()
        createDefaultShaders()
    }
    
    public static func createDefaultShaders(){
        //Vertex Shaders
        vertexShaders.updateValue(DefaultVertexShader(), forKey: .Default)
        
        //Fragment Shaders
        fragmentShaders.updateValue(DefaultFragmentShader(), forKey: .Default)
    }
        
    public static func VertexFunction(_ vertexShaderType: VertexShaderTypes) -> MTLFunction{
        return vertexShaders[vertexShaderType]!.function
    }
    
    public static func FragmentFunction(_ fragmentShaderType: FragmentShaderTypes) -> MTLFunction{
        return fragmentShaders[fragmentShaderType]!.function
    }
    
}
