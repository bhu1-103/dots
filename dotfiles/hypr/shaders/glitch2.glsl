#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;
out vec4 fragColor;

float rand(float x) {
    return fract(sin(x * 12345.6789) * 98765.4321);
}

void main() {
    float rows = 30.0;
    float yBlock = floor(v_texcoord.y * rows);

    // Generate random horizontal shift for each row
    float shift = (rand(yBlock + floor(time * 10.0)) - 0.5) * 0.1;

    vec2 uv = v_texcoord;
    uv.x += shift;

    vec4 color = texture(tex, uv);
    fragColor = color;
}
