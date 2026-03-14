#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;
out vec4 fragColor;

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
}

void main() {
    float blockSize = 0.02;
    vec2 blockUV = floor(v_texcoord / blockSize) * blockSize;

    float noise = hash(blockUV + time);
    vec4 blockColor = texture(tex, blockUV);

    // Occasionally replace blocks with static
    if (noise > 0.85) {
        fragColor = vec4(vec3(noise), 1.0); // white noise block
    } else {
        fragColor = blockColor;
    }
}
