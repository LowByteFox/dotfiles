#version 330
uniform sampler2D tex;

in vec2 texcoord; 

vec4 default_post_processing(vec4 c);

vec4 window_shader() {
    vec4 c = default_post_processing(texelFetch(tex, ivec2(texcoord), 0));
    return vec4(vec3(0.2126 * c.r + 0.7152 * c.g + 0.0722 * c.b), c.a);
}
