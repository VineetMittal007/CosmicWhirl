export default `
#define delta ( 1.0 / 30.0 )

void main() {

    vec2 uv = gl_FragCoord.xy / resolution.xy;

    vec4 tmpPos = texture2D( texturePosition, uv );
    vec3 pos = tmpPos.xyz;

    vec4 tmpVel = texture2D( textureVelocity, uv );
    vec3 vel = tmpVel.xyz;

    // Dynamics
    if (pos.x != 0.0 && pos.y != 0.0 && pos.z != 0.0){
        pos += vel * delta;
    }

    // Output the positions and isDarkMatter in the output color
    gl_FragColor = vec4( pos, tmpPos.w);
}
`
