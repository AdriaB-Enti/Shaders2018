Shader "ENTI / Basic"
{
	Properties
	{
		_Color("Color", color) = (1, 0, 0, 1)
	}
	SubShader
	{
		Tags{ "Queue" = "Geometry" }
		Pass
	{
		GLSLPROGRAM
#ifdef VERTEX
	#include "UnityCG.glslinc"

	void main()
	{
		mat4 l_ViewMatrix = gl_ModelViewMatrix*unity_WorldToObject;
		gl_Position = unity_ObjectToWorld * gl_Vertex;
		gl_Position = l_ViewMatrix * gl_Position;
		gl_Position = gl_ProjectionMatrix * gl_Position;
	}
#endif
#ifdef FRAGMENT
	uniform vec4 _Color;
	void main()
	{
		gl_FragColor = _Color;
	}
#endif
	ENDGLSL
	}
	}
}