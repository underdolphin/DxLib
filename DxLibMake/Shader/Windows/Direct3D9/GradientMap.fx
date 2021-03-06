float3 RGBToY : register( c0 ) ;

sampler SrcTexture         : register( s0 ) ;
sampler GradientMapTexture : register( s1 ) ;

struct VS_OUTPUT
{
	float4 Position        : POSITION ;
	float2 TexCoords0      : TEXCOORD0 ;
} ;

float4 GradientMap_PS(VS_OUTPUT In) : COLOR
{
	float4 Color;

	Color = tex2D( SrcTexture, In.TexCoords0 ) ;
	return tex2D( GradientMapTexture, float2( dot( Color.rgb, RGBToY.rgb ), 0 ) ) ;
}

float4 GradientMapRev_PS(VS_OUTPUT In) : COLOR
{
	float4 Color;

	Color = tex2D( SrcTexture, In.TexCoords0 ) ;
	return tex2D( GradientMapTexture, float2( 1.0f - dot( Color.rgb, RGBToY.rgb ), 0 ) ) ;
}
