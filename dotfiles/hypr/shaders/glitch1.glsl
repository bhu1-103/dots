#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
uniform float time; // Animate the glitch over time
out vec4 fragColor;

void main() {
    // Simulate random horizontal distortion
    float glitchStrength = sin(v_texcoord.y * 50.0 + time * 5.0) * 0.005;

    // Offset each color channel slightly
    float offset = glitchStrength;
    vec2 uvR = v_texcoord + vec2(offset, 0.0);
    vec2 uvG = v_texcoord;
    vec2 uvB = v_texcoord - vec2(offset, 0.0);

    float noise = step(0.9, fract(sin(dot(v_texcoord * time, vec2(12.9898, 78.233))) * 43758.5453));

    vec4 color;
    color.r = texture(tex, uvR).r;
    color.g = texture(tex, uvG).g;
    color.b = texture(tex, uvB).b;
    color.a = texture(tex, v_texcoord).a;

    if (noise > 0.0 && mod(v_texcoord.y * 200.0 + time * 10.0, 10.0) < 1.0) {
        color.rgb = vec3(1.0, 0.0, 0.0); // Red glitch
    }

    fragColor = color;
}
