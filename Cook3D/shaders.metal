//
//  shaders.metal
//  Cook3D
//
//  Created by Melih Mete on 24.11.2020.
//

#include <metal_stdlib>
using namespace metal;

vertex float4 basic_vertex_function() {
    return float(1);
}

fragment half4 basic_fragment_function() {
    return half4(1);
}
