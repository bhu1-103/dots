#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {
    vec4 color = texture(tex, v_texcoord);

    float scanline = sin(v_texcoord.y * 800.0) * 0.1 + 0.95;

    fragColor = vec4(color.rgb * scanline, color.a);
}
