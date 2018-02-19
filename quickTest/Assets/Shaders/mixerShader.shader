Shader "ENTI / mixerShader"
{
	Properties
	{
		//_Color("Color", color) = (1, 0, 0, 1)
		_gMixer("Mixer",2D) = "defaulttexture"{}
		_gText0("Texture0",2D) = "defaulttexture"{}
		_gText1("Texture1",2D) = "defaulttexture"{}
	}
		SubShader
	{
		Tags{ "Queue" = "Geometry" }
		Pass
	{
		GLSLPROGRAM
#ifdef VERTEX
#include "UnityCG.glslinc"
	varying vec2 gTextureCoordinate;
	void main()
	{

		mat4 l_ViewMatrix = gl_ModelViewMatrix*unity_WorldToObject;
		gl_Position = unity_ObjectToWorld * gl_Vertex;
		gl_Position = l_ViewMatrix * gl_Position;
		gl_Position = gl_ProjectionMatrix * gl_Position;
		gTextureCoordinate = gl_MultiTexCoord0.xy;
	}
#endif
#ifdef FRAGMENT
	varying vec2 gTextureCoordinate;
	uniform sampler2D _gMixer;
	uniform sampler2D _gText0;
	uniform sampler2D _gText1;
	void main()
	{
		//gl_FragColor = vec4(0,1,0, 1.0);	//per testing
		gl_FragColor = mix(texture2D(_gText0, gTextureCoordinate), 
			texture2D(_gText1, gTextureCoordinate), texture2D(_gMixer, gTextureCoordinate).xxxx);
	}
#endif
	ENDGLSL
	}
	}
}