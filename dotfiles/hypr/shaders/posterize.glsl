#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
uniform float levels; // Example: 4.0 for 4-color quantization
out vec4 fragColor;

void main() {
    vec4 color = texture(tex, v_texcoord);
    vec3 quantized = floor(color.rgb * levels) / levels;
    fragColor = vec4(quantized, color.a);
}
