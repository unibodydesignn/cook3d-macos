//
//  shaders.metal
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct RasterizerData {
  
    float4 position [[ position ]];
    float4 color;
};

vertex RasterizerData default_vertex_shader(const VertexIn vIn [[ stage_in ]]) {
    
    RasterizerData rasterizerData;
    
    rasterizerData.position = float4(vIn.position, 1);
    rasterizerData.color = vIn.color;
    
    return rasterizerData;
}

fragment half4 default_fragment_shader(RasterizerData rasterizerData [[ stage_in ]]) {
    float4 color = rasterizerData.color;
    return half4(color.r, color.g, color.b, color.a);
}
