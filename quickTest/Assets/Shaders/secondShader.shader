Shader "ENTI / secondShader"
{
	Properties
	{
		_Color("Color", color) = (1, 0, 0, 1)
		_MainTex("MainTex",2D) = ""{}
	}
		SubShader
	{
		Tags{ "Queue" = "Geometry" }
		Pass
	{
		GLSLPROGRAM
#ifdef VERTEX
#include "UnityCG.glslinc"
		varying vec2 TextureCoordinate;
		void main()
	{
		mat4 l_ViewMatrix = gl_ModelViewMatrix*unity_WorldToObject;
		gl_Position = unity_ObjectToWorld * gl_Vertex;
		gl_Position = l_ViewMatrix * gl_Position;
		gl_Position = gl_ProjectionMatrix * gl_Position;
		TextureCoordinate = gl_MultiTexCoord0.xy;
	}
#endif
#ifdef FRAGMENT
	uniform vec4 _Color;
	uniform sampler2D _MainTex;
	varying vec2 TextureCoordinate;
	void main()
	{
		gl_FragColor = texture2D(_MainTex, TextureCoordinate)*_Color;
	}
#endif
	ENDGLSL
	}
	}
}