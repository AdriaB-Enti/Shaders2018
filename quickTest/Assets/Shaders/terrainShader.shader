//TODO--------------------
Shader "ENTI / terrainShader"
{
	Properties
	{
		_HeightmapTex("HeightmapTex",2D) = ""{}
		_MainTex("MainTex",2D) = ""{}
		_ColorTex("ColorTex", 2D) = ""{}
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
		varying vec4 l_Height;
		varying vec4 l_Position;

		void main()
	{
		vec4 l_Height = texture2DLod(_HeightmapTex, gl_MultiTexCoord0.xy, 0.0);
		mat4 l_ViewMatrix = gl_ModelViewMatrix*unity_WorldToObject;
		l_Position = unity_ObjectToWorld*l_Position;
		l_Position.y = l_Position.y + l_Height.x*_MaxHeight;
		TextureCoordinate = vec2(0.5, l_Height.x);

		mat4 l_ViewMatrix = gl_ModelViewMatrix*unity_WorldToObject;
		gl_Position = unity_ObjectToWorld * gl_Vertex;
		gl_Position = l_ViewMatrix * gl_Position;
		gl_Position = gl_ProjectionMatrix * gl_Position;
		
	}
#endif
#ifdef FRAGMENT
	uniform sampler2D _MainTex;
	varying vec2 TextureCoordinate;
	void main()
	{
		gl_FragColor = texture2D(_MainTex, TextureCoordinate);
	}
#endif
	ENDGLSL
	}
	}
}