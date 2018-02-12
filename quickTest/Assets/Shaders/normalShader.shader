Shader "ENTI / normalShader"
{
	Properties
	{
		//_Color("Color", color) = (1, 0, 0, 1)
		//_MainTex("MainTex",2D) = ""{}
	}
		SubShader
	{
		Tags{ "Queue" = "Geometry" }
		Pass
	{
		GLSLPROGRAM
#ifdef VERTEX
#include "UnityCG.glslinc"
	varying vec3 normal;
	void main()
	{
		mat4 l_ViewMatrix = gl_ModelViewMatrix*unity_WorldToObject;
		gl_Position = unity_ObjectToWorld * gl_Vertex;
		gl_Position = l_ViewMatrix * gl_Position;
		gl_Position = gl_ProjectionMatrix * gl_Position;
		normal = normalize((unity_ObjectToWorld * vec4(gl_Normal.xyz, 0.0)).xyz);
		//normal = normalize(normal);
	}
#endif
#ifdef FRAGMENT
	varying vec3 normal;
	void main()
	{
		//normal = normalize(normal)
		gl_FragColor = vec4(normalize(normal), 1.0);
		//gl_FragColor = vec4(normal, 1.0);
	}
#endif
	ENDGLSL
	}
	}
}