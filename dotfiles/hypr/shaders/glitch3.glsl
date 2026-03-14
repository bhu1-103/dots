#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;
out vec4 fragColor;

void main() {
    float offsetY = sin(time * 20.0 + v_texcoord.x * 100.0) * 0.005;

    vec2 uvR = v_texcoord + vec2(0.0, offsetY);
    vec2 uvG = v_texcoord;
    vec2 uvB = v_texcoord - vec2(0.0, offsetY);

    fragColor = vec4(
        texture(tex, uvR).r,
        texture(tex, uvG).g,
        texture(tex, uvB).b,
        1.0
    );
}
