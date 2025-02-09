#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec3 aTangent;
layout (location = 3) in vec3 aUV;

out vec3 Normal;
out vec3 Position;
out vec3 UV;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
  Normal = mat3(transpose(inverse(model))) * aNormal;
  Position = vec3(model * vec4(aPos, 1.0));
  UV = aUV;
  gl_Position = projection * view * model * vec4(aPos, 1.0);
}