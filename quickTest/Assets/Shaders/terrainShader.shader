﻿//TODO--------------------
Shader "ENTI / terrainShader"
{
	Properties
	{
		_HeightmapTex("HeightmapTex",2D) = ""{}
		_HeatmapTex("HeatmapTex",2D) = ""{}
		_gMaxHeight("Max. height", float) = 1
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
		uniform vec4 l_Height;
		//varying vec4 l_Position;
		uniform float _gMaxHeight;
		//uniform sampler2D _HeightmapTex;
		//uniform sampler2D _HeightmapTex;

		void main()
	{
		/*vec4 l_Height = vec4(0, 0, texture2DLod(_HeightmapTex, gl_MultiTexCoord0.xy, 0.0).x * _gMaxHeight, 0);
		mat4 l_ViewMatrix = gl_ModelViewMatrix * unity_WorldToObject;
		gl_Position = unity_ObjectToWorld	* (gl_Vertex + lHeight);
		gl_Position = lViewMatrix			* gl_Position;
		gl_Position = gl_ProjectionMatrix	* gl_Position;
		TextureCoordinate = vec2(0.5, l_Height.z);*/
		gl_Position = vec3(0,0,0,0);
	}
#endif
#ifdef FRAGMENT
	//uniform sampler2D _MainTex;
	varying vec2 TextureCoordinate;
	void main()
	{
		gl_FragColor = vec4(1, 0, 0, 1);	//per testing
	}
#endif
	ENDGLSL
	}
	}
}