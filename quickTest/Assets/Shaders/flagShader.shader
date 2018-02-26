Shader "ENTI / Flag Shader"
{
	Properties
	{
		_MainTex("MainTex",2D) = ""{}
		_gAmplitudeX("AmplitudeX", float) = 1.0
		_gAmplitudeZ("AmplitudeZ", float) = 1.0
		_gSpeed("Speed", float) = 1.0
		_gDividerX("DividerX", float) = 1.0
		_gDividerZ("DividerZ", float) = 1.0

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
	uniform float _gAmplitudeX;
	uniform float _gAmplitudeZ;
	uniform float _gSpeed;
	uniform float _gDividerX;
	uniform float _gDividerZ;
	void main()
	{
		mat4 l_ViewMatrix = gl_ModelViewMatrix*unity_WorldToObject;
		//gl_Position = unity_ObjectToWorld * gl_Vertex;
		gl_Position = gl_Vertex;
		gl_Position.y += _gAmplitudeX*sin(gl_MultiTexCoord0.x * _gDividerX +
			_Time.y * _gSpeed) - _gAmplitudeX*sin(_Time.y * _gSpeed);
		gl_Position.z += _gAmplitudeZ*sin(gl_MultiTexCoord0.x * _gDividerZ +
			_Time.y * _gSpeed) - _gAmplitudeZ*sin(_Time.y * _gSpeed);
		gl_Position = unity_ObjectToWorld * gl_Position;
		gl_Position = l_ViewMatrix * gl_Position;
		gl_Position = gl_ProjectionMatrix * gl_Position;
		TextureCoordinate = gl_MultiTexCoord0.xy;
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