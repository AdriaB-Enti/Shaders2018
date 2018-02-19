Shader "ENTI / mixerRGBAShader"
{
	Properties
	{
		//_Color("Color", color) = (1, 0, 0, 1)
		_gMixer("Mixer",2D) = "defaulttexture"{}
		_gText0("Texture0",2D) = "defaulttexture"{}
		_gText1("Texture1",2D) = "defaulttexture"{}
		_gText2("Texture2",2D) = "defaulttexture"{}
		_gText3("Texture3",2D) = "defaulttexture"{}
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
	uniform sampler2D _gText2;
	uniform sampler2D _gText3;
	void main()
	{
		vec4 v_Mixer = texture2D(_gMixer, gTextureCoordinate);
		vec4 RedColor = texture2D(_gText0, gTextureCoordinate);
		vec4 GreenColor = texture2D(_gText1, gTextureCoordinate);
		vec4 BlueColor = texture2D(_gText2, gTextureCoordinate);
		vec4 AlphaColor = texture2D(_gText3, gTextureCoordinate);
		//gl_FragColor = BlueColor;
		gl_FragColor = RedColor*v_Mixer.x
			+ GreenColor * v_Mixer.y
			+ BlueColor * v_Mixer.z
			+ BlueColor * v_Mixer.w;
		
	}
#endif
	ENDGLSL
	}
	}
}