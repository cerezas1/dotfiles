#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;

out vec4 fragColor;

void main() {
    vec4 color = texture(tex, v_texcoord);
    
    color.r = color.r * 1.0;
    color.g = color.g * 0.65;
    color.b = color.b * 0.35; 

    fragColor = color;
}
