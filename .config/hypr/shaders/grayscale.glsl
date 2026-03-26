#version 300 es
precision mediump float;
in vec2 v_texcoord;
layout(location = 0) out vec4 FragColor;

uniform sampler2D tex;

void main(){
    vec4 c = texture(tex, v_texcoord);
    float g = dot(c.rgb, vec3(0.299, 0.587, 0.114));
    FragColor = vec4(vec3(g), c.a);
}