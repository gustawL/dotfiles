#version 300 es
precision highp float;
precision highp sampler2D;

in vec2 v_texcoord;
uniform sampler2D tex;
layout(location = 0) out vec4 fragColor;

vec3 srgbToLinear(vec3 c) {
    bvec3 cutoff = lessThanEqual(c, vec3(0.04045));
    vec3 lower = c / 12.92;
    vec3 higher = pow((c + 0.055) / 1.055, vec3(2.4));
    return mix(higher, lower, vec3(cutoff));
}

vec3 linearToSrgb(vec3 c) {
    bvec3 cutoff = lessThanEqual(c, vec3(0.0031308));
    vec3 lower = c * 12.92;
    vec3 higher = 1.055 * pow(c, vec3(1.0 / 2.4)) - 0.055;
    return mix(higher, lower, vec3(cutoff));
}

void main() {
    vec4 color = texture(tex, v_texcoord);

    vec3 linear = srgbToLinear(color.rgb);
    float gray = dot(linear, vec3(0.2126, 0.7152, 0.0722));
    vec3 grayColor = linearToSrgb(vec3(gray));

    fragColor = vec4(grayColor, color.a);
}