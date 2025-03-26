
Shader "Unlit/ZZZ_Shader"
{
    Properties
    {
        _BaseMap("Base Map", 2D) = "white" {}
        _Color("Color", Color) = (1,1,1,1)
        _OutLineWidth("OutLine Width",Range(0,1)) = 0.1
        _MaxOutlineZoffset("Max Outline Z offset",Range(0,0.1)) = 0.01
        _OutlineColor("Outline Color",Color) = (0,0,0,1)
        _OtherDataTex("Other Data Tex", 2D) = "white" {}
        _OtherDataTex2("Other Data Tex2", 2D) = "white" {}
        _NormalMap("Normal Map", 2D) = "bump" {}
        _BumpScale("Bump Scale", Range(-5, 5)) = 1
        _LightSDFTex("Light SDF Tex", 2D) = "white" {}
        _AlbedoSmoothness("Albedo Smoothness", Range(0.0, 1)) = 0.1
        _MaterialIDUSE("Material ID USE", Range(0, 4)) = 0 // 添加材质ID属性
        _UseSDFTex("Use SDF Tex", Range(0, 1)) = 0
        _OutlineColor2("Outline Color2",Color) = (0,0,0,1)
        _OutlineColor3("Outline Color3",Color) = (0,0,0,1)
        _OutlineColor4("Outline Color4",Color) = (0,0,0,1)
        _OutlineColor5("Outline Color5",Color) = (0,0,0,1)
        _ShadowColor("Shadow Color", Color) = (0,0,0,1) // 添加阴影颜色属性
        _ShadowColor2("Shadow Color2", Color) = (0,0,0,1)
        _ShadowColor3("Shadow Color3", Color) = (0,0,0,1)
        _ShadowColor4("Shadow Color4", Color) = (0,0,0,1)
        _ShadowColor5("Shadow Color5", Color) = (0,0,0,1)
        _ShallowColor("Shallow Color", Color) = (0,0,0,1)
        _ShallowColor2("Shallow Color2", Color) = (0,0,0,1)
        _ShallowColor3("Shallow Color3", Color) = (0,0,0,1)
        _ShallowColor4("Shallow Color4", Color) = (0,0,0,1)
        _ShallowColor5("Shallow Color5", Color) = (0,0,0,1)
        _PostShadowFadeTint("Post Shadow Fade Tint", Color) = (1,1,1,1) // 添加后阴影淡化色调属性
        _PostShadowTint("Post Shadow Tint", Color) = (1,1,1,1)
        _PostShallowFadeTint("Post Shallow Fade Tint", Color) = (1,1,1,1)
        _PostShallowTint("Post Shallow Tint", Color) = (1,1,1,1)
        _PostSSSTint("Post SSS Tint", Color) = (1,1,1,1)
        _PostFrontTint("Post Front Tint", Color) = (1,1,1,1)
        _PostForwardTint("Post Forward Tint", Color) = (1,1,1,1)

        _AmbientColorIntensity("Ambient Color Intensity", Range(0, 1)) = 0.333
        

        [Enum(s0,0,s1,1,s2,2,s3,3,s4,4,s5,5)] _SkinMatId("Skin Mat Id", Float) = 0
        [Enum(s0,0,s1,1,s2,2,s3,3,s4,4,s5,5)] _GlossMatId("Gloss Mat Id", Float) = 0

        _UseSphere("Use Sphere", Range(0,5)) = 1
        _Metallic("Metallic", Range(0,1)) = 0
        _Glossiness("Smoothness", Range(0,1)) = 0.5

        [Header(Specular)]
        [Toggle] _HighLightShape("HighLight Shape 1", float) = 0
        [Toggle] _HighLightShape2("HighLight Shape 2", float) = 0
        [Toggle] _HighLightShape3("HighLight Shape 3", float) = 0
        [Toggle] _HighLightShape4("HighLight Shape 4", float) = 0
        [Toggle] _HighLightShape5("HighLight Shape 5", float) = 0

        _ToonSpecular("Toon Specular 1", Range(0, 1)) = 0.01
        _ToonSpecular2("Toon Specular 2", Range(0, 1)) = 0.01
        _ToonSpecular3("Toon Specular 3", Range(0, 1)) = 0.01
        _ToonSpecular4("Toon Specular 4", Range(0, 1)) = 0.01
        _ToonSpecular5("Toon Specular 5", Range(0, 1)) = 0.01

        _SpecularRange("Specular Range 1", Range(0, 2)) = 1
        _SpecularRange2("Specular Range 2", Range(0, 2)) = 1
        _SpecularRange3("Specular Range 3", Range(0, 2)) = 1
        _SpecularRange4("Specular Range 4", Range(0, 2)) = 1
        _SpecularRange5("Specular Range 5", Range(0, 2)) = 1

        _ShapeSoftness("Shape Softness 1", Range(0, 1)) = 0.1
        _ShapeSoftness2("Shape Softness 2", Range(0, 1)) = 0.1
        _ShapeSoftness3("Shape Softness 3", Range(0, 1)) = 0.1
        _ShapeSoftness4("Shape Softness 4", Range(0, 1)) = 0.1
        _ShapeSoftness5("Shape Softness 5", Range(0, 1)) = 0.1

        _SpecIntensity("Spec Intensity", Range(0, 10)) = 0.1

        _SpecularColor("Specular Color", Color) = (1,1,1,1)
        _SpecularColor2("Specular Color 2", Color) = (1,1,1,1)
        _SpecularColor3("Specular Color 3", Color) = (1,1,1,1)
        _SpecularColor4("Specular Color 4", Color) = (1,1,1,1)
        _SpecularColor5("Specular Color 5", Color) = (1,1,1,1)

        [Header(Rim Glow)]
        [HDR] _RimGlowLightColor("Rim Glow Light Color", Color) = (0.55,0.55,0.55,1)
        [HDR] _RimGlowLightColor2("Rim Glow Light Color 2", Color) = (0.55,0.55,0.55,1)
        [HDR] _RimGlowLightColor3("Rim Glow Light Color 3", Color) = (0.55,0.55,0.55,1)
        [HDR] _RimGlowLightColor4("Rim Glow Light Color 4", Color) = (0.55,0.55,0.55,1)
        [HDR] _RimGlowLightColor5("Rim Glow Light Color 5", Color) = (0.55,0.55,0.55,1)

        [HDR] _UISunColor("UI Sun Color", Color) = (1,0.92,0.9,1)
        [HDR] _UISunColor2("UI Sun Color 2", Color) = (1,0.92,0.9,1)
        [HDR] _UISunColor3("UI Sun Color 3", Color) = (1,0.92,0.9,1)
        [HDR] _UISunColor4("UI Sun Color 4", Color) = (1,0.92,0.9,1)
        [HDR] _UISunColor5("UI Sun Color 5", Color) = (1,0.92,0.9,1)


        [HideInInspector]_HeadCenter("Head Center", Vector) = (0,0,0)
        [HideInInspector]_HeadForward("Head Forward", Vector) = (0,0,0)
        [HideInInspector]_HeadRight("Head Right", Vector) = (0,0,0)
        _HeadSphereRange("Head Sphere Range", Range(0, 1)) = 0

        [Header(MatCap)]
        [Toggle(_MATCAP_ON)] _MatCap("MatCap", float) = 0
        [NoScaleOffset] _MatCapTex("MatCap Tex 1", 2D) = "white" {}
        [NoScaleOffset] _MatCapTex2("MatCap Tex 2", 2D) = "white" {}
        [NoScaleOffset] _MatCapTex3("MatCap Tex 3", 2D) = "white" {}
        [NoScaleOffset] _MatCapTex4("MatCap Tex 4", 2D) = "white" {}
        [NoScaleOffset] _MatCapTex5("MatCap Tex 5", 2D) = "white" {}

        _MatCapColorTint("MatCap Color Tint 1", Color) = (1,1,1,1)
        _MatCapColorTint2("MatCap Color Tint 2", Color) = (1,1,1,1)
        _MatCapColorTint3("MatCap Color Tint 3", Color) = (1,1,1,1)
        _MatCapColorTint4("MatCap Color Tint 4", Color) = (1,1,1,1)
        _MatCapColorTint5("MatCap Color Tint 5", Color) = (1,1,1,1)

        _MatCapColorBurst("MatCap Color Burst 1", Range(0, 10)) = 1
        _MatCapColorBurst2("MatCap Color Burst 2", Range(0, 10)) = 1
        _MatCapColorBurst3("MatCap Color Burst 3", Range(0, 10)) = 1
        _MatCapColorBurst4("MatCap Color Burst 4", Range(0, 10)) = 1
        _MatCapColorBurst5("MatCap Color Burst 5", Range(0, 10)) = 1

        _MatCapAlphaBurst("MatCap Alpha Burst 1", Range(0, 10)) = 1
        _MatCapAlphaBurst2("MatCap Alpha Burst 2", Range(0, 10)) = 1
        _MatCapAlphaBurst3("MatCap Alpha Burst 3", Range(0, 10)) = 1
        _MatCapAlphaBurst4("MatCap Alpha Burst 4", Range(0, 10)) = 1
        _MatCapAlphaBurst5("MatCap Alpha Burst 5", Range(0, 10)) = 1

        [Toggle] _MatCapRefract("MatCap Refract 1", float) = 0
        [Toggle] _MatCapRefract2("MatCap Refract 2", float) = 0
        [Toggle] _MatCapRefract3("MatCap Refract 3", float) = 0
        [Toggle] _MatCapRefract4("MatCap Refract 4", float) = 0
        [Toggle] _MatCapRefract5("MatCap Refract 5", float) = 0

        _RefractDepth("Refract Depth 1", Range(0, 2)) = 0.5
        _RefractDepth2("Refract Depth 2", Range(0, 2)) = 0.5
        _RefractDepth3("Refract Depth 3", Range(0, 2)) = 0.5
        _RefractDepth4("Refract Depth 4", Range(0, 2)) = 0.5
        _RefractDepth5("Refract Depth 5", Range(0, 2)) = 0.5

        _RefractParam("Refract WrapOffset 1", Vector) = (5,5,0,0)
        _RefractParam2("Refract WrapOffset 2", Vector) = (5,5,0,0)
        _RefractParam3("Refract WrapOffset 3", Vector) = (5,5,0,0)
        _RefractParam4("Refract WrapOffset 4", Vector) = (5,5,0,0)
        _RefractParam5("Refract WrapOffset 5", Vector) = (5,5,0,0)

        _ModelSize("Model Size 1", Range(0, 100)) = 1
        _ModelSize2("Model Size 2", Range(0, 100)) = 1
        _ModelSize3("Model Size 3", Range(0, 100)) = 1
        _ModelSize4("Model Size 4", Range(0, 100)) = 1
        _ModelSize5("Model Size 5", Range(0, 100)) = 1
        

        _AlphaClip("Alpha Clip", Range(0, 1)) = 0.333

        [Header(Screen Space Rim)]
        [Toggle(_SCREEN_SPACE_RIM)] _ScreenSpaceRim("Screen Space Rim", Float) = 1
        _ScreenSpaceRimWidth("Screen Space Rim Width", Range(0, 10)) = 1
        _ScreenSpaceRimThreshold("Screen Space Rim Threshold", Range(0, 1)) = 0.01
        _ScreenSpaceRimFadeout("Screen Space Rim Fadeout", Range(0, 10)) = 0.5
        _ScreenSpaceRimBrightness("Screen Space Rim Brightness", Range(0, 10)) = 1

        [Header(Screen Space Shadow)]
        [Toggle(_SCREEN_SPACE_SHADOW)] _ScreenSpaceShadow("Screen Space Shadow", Float) = 1
        _ScreenSpaceShadowWidth("Screen Space Shadow Width", Range(0, 1)) = 0.2
        _ScreenSpaceShadowFadeout("Screen Space Shadow Fadeout", Range(0, 1)) = 0.015
        _ScreenSpaceShadowThreshold("Screen Space Shadow Threshold", Range(0, 10)) = 0.2

        [Enum(AlphaBlended,0,Add,1,Overlay,2)] _MatCapBlendMode("MatCap Blend Mode 1", Float) = 0
        [Enum(AlphaBlended,0,Add,1,Overlay,2)] _MatCapBlendMode2("MatCap Blend Mode 2", Float) = 0
        [Enum(AlphaBlended,0,Add,1,Overlay,2)] _MatCapBlendMode3("MatCap Blend Mode 3", Float) = 0
        [Enum(AlphaBlended,0,Add,1,Overlay,2)] _MatCapBlendMode4("MatCap Blend Mode 4", Float) = 0
        [Enum(AlphaBlended,0,Add,1,Overlay,2)] _MatCapBlendMode5("MatCap Blend Mode 5", Float) = 0

        [Header(Option)]
        [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull(Default back)", Float) = 2
        [Enum(Off,0,On,1)] _Zwrite("Zwrite (Default On)", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] _SrcBlendMode("SrcBlendMode(Default One)", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] _DstBlendMode("DstBlendMode(Default Zero)", Float) = 0
        [Enum(UnityEngine.Rendering.BlendOp)] _BlendOp("BlendOp(Default Add)", Float) = 0
        _StencilRef("Stencil reference", int) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp("Stencil comparison function", int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilPassOp("Stencil pass operation", int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilFailOp("Stencil fail operation", int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilZFailOp("Stencil Z fail operation", int) = 0

        [Header(SRP Default)]
        [Toggle(_SRP_DEFAULT_PASS)] _SRPDefaultPass("SRP Default Pass", int) = 0
        [Enum(UnityEngine.Rendering.BlendMode)] _SRPSrcBlendMode("SRP SrcBlendMode(Default One)", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] _SRPDstBlendMode("SRP DstBlendMode(Default Zero)", Float) = 0
        [Enum(UnityEngine.Rendering.BlendOp)] _SRPBlendOp("SRP BlendOp(Default Add)", Float) = 0
        _SRPStencilRef("SRP Stencil reference", int) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _SRPStencilComp("SRP Stencil comparison function", int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _SRPStencilPassOp("SRP Stencil pass operation", int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _SRPStencilFailOp("SRP Stencil fail operation", int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _SRPStencilZFailOp("SRP Stencil Z fail operation", int) = 0

        


        
        
    }

    SubShader
    {
        Tags { "RenderType" = "Opaque" "RenderPipeline" = "UniversalPipeline" }
        LOD 100

        
        Pass
        {
            Name "ShadowCaster"
            Tags { "LightMode" = "ShadowCaster" }
            ZWrite [_ZWrite]
            ZTest LEqual
            Cull [_Cull]

            HLSLPROGRAM

            #pragma mulit_compile_instancing
            #pragma mulit_compile_DOTS_INSTANCING_ON

            #pragma mulit_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

            #pragma vertex vert
            #pragma fragment fragDepth

            float3 _LightDirWS;
            float3 _LightPositionWS;
            float _AlpahClip;

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
                float3 normalOS : NORMAL;
                float2 texcoord : TEXCOORD0;
            };

            struct Varyings
            {
                float2 uv : TEXCOORD0;
                float4 positionCS : SV_POSITION;
            };

            float4 GetShadowPositionHClip(Attributes IN)
            {
                float3 positionWS = TransformObjectToWorld(IN.positionOS).xyz;
                float3 normalWS = TransformObjectToWorldNormal(IN.normalOS);

            #if _CASTING_PUNCTUAL_LIGHT_SHADOW
                float3 lightDirWS = normalize(_LightPositionWS - positionWS);
            #else
                float3 lightDirWS = _LightDirWS;
            #endif

                float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirWS));

            #if UNITY_REVERSED_Z
                positionCS.z = min(positionCS.z, UNITY_NEAR_CLIP_VALUE);
            #else
                positionCS.z = max(positionCS.z, UNITY_NEAR_CLIP_VALUE);
            #endif       
            
                return positionCS;                    
            }

            Varyings vert(Attributes IN)
            {
                Varyings OUT;
                OUT.uv = IN.texcoord;
                OUT.positionCS = TransformObjectToHClip(IN.positionOS.xyz);
                return OUT;
            }

            float4 fragDepth(Varyings IN) : SV_Target
            {
                clip(1.0 - _AlpahClip);
                return 0;
            }
            ENDHLSL
        }
        Pass
        {
            Name "DepthOnly"
            Tags { "LightMode" = "DepthOnly" }
            ZWrite [_ZWrite]
            ColorMask 0
            Cull [_Cull]

            HLSLPROGRAM

            #pragma mulit_compile_instancing
            #pragma mulit_compile_DOTS_INSTANCING_ON

            #pragma vertex vert
            #pragma fragment fragDepth

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
            };

            struct Varyings
            {
                float4 positionCS : SV_POSITION;
            };

            float _AlpahClip;

            Varyings vert(Attributes IN)
            {
                Varyings OUT;
                OUT.positionCS = TransformObjectToHClip(IN.positionOS.xyz);
                return OUT;
            }

            float4 fragDepth(Varyings IN) : SV_Target
            {
                clip(1.0 - _AlpahClip);
                return 0;
            }
            ENDHLSL
        }

        Pass
        {
            Name "DepthNormals"
            Tags { "LightMode" = "DepthNormals" }
            ZWrite [_ZWrite]
            Cull [_Cull]

            HLSLPROGRAM

            #pragma mulit_compile_instancing
            #pragma mulit_compile_DOTS_INSTANCING_ON

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
                float4 tangentOS : TANGENT;
                float3 normalOS : NORMAL;
                float2 texcoord : TEXCOORD0;
            };

            struct Varyings
            {
                float4 positionCS : SV_POSITION;
                float2 uv : TEXCOORD0;
                float3 normalWS : TEXCOORD1;
                float4 tangentWS : TEXCOORD2;
            };

            float _AlpahClip;

            Varyings vert(Attributes input)
            {
                Varyings output = (Varyings)0;

                output.uv = input.texcoord;
                output.positionCS = TransformObjectToHClip(input.positionOS.xyz);

                VertexPositionInputs vertexInput = GetVertexPositionInputs(input.positionOS.xyz);
                VertexNormalInputs normalInput = GetVertexNormalInputs(input.normalOS, input.tangentOS);

                float3 viewDirWS = GetWorldSpaceNormalizeViewDir(vertexInput.positionWS);                           
                output.normalWS = half3(normalInput.normalWS);
                float sign = input.tangentOS.w * float(GetOddNegativeScale());
                output.tangentWS = half4(normalInput.tangentWS.xyz,sign);

                return output;               
            }

            half4 frag(Varyings input) : SV_Target
            {
                clip(1.0 - _AlphaClip);
                float3 normalWS = input.normalWS.xyz;
                return half4(NormalizeNormalPerPixel(normalWS),0.0);
            }
            ENDHLSL
            
        }

        Pass
        {
            Name "UniversalForward"
            Tags { "LightMode" = "UniversalForward" }
             Cull [_Cull]
             Blend [_SrcBlendMode] [_DstBlendMode]
             BlendOp [_BlendOp]
             ZWrite [_ZWrite]
             Stencil
             {
                 Ref [_StencilRef]
                 Comp [_StencilComp]
                 Pass [_StencilPassOp]
                 Fail [_StencilFailOp]
                 ZFail [_StencilZFailOp]
             }

            HLSLPROGRAM
            #pragma shader_feature_local _SCREEN_SPACE_RIM
            #pragma shader_feature_local _SCREEN_SPACE_SHADOW

            #pragma vertex vert
            #pragma fragment frag

            #pragma multi_compile_fog

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"

            #define DEFINE_MINMAX3(TYPE) \
            TYPE min3(TYPE a, TYPE b, TYPE c) { return TYPE(min(min(a, b), c)); } \
            TYPE##2 min3(TYPE##2 a, TYPE##2 b, TYPE##2 c) { return TYPE##2(min(min(a, b), c)); } \
            TYPE##3 min3(TYPE##3 a, TYPE##3 b, TYPE##3 c) { return TYPE##3(min(min(a, b), c)); } \
            TYPE##4 min3(TYPE##4 a, TYPE##4 b, TYPE##4 c) { return TYPE##4(min(min(a, b), c)); } \
            TYPE max3(TYPE a, TYPE b, TYPE c) { return TYPE(max(max(a, b), c)); } \
            TYPE##2 max3(TYPE##2 a, TYPE##2 b, TYPE##2 c) { return TYPE##2(max(max(a, b), c)); } \
            TYPE##3 max3(TYPE##3 a, TYPE##3 b, TYPE##3 c) { return TYPE##3(max(max(a, b), c)); } \
            TYPE##4 max3(TYPE##4 a, TYPE##4 b, TYPE##4 c) { return TYPE##4(max(max(a, b), c)); }

            DEFINE_MINMAX3(bool)
            DEFINE_MINMAX3(uint)
            DEFINE_MINMAX3(int)
            DEFINE_MINMAX3(float)
            DEFINE_MINMAX3(half)

            #define DEFINE_POW(TYPE) \
            TYPE pow2(TYPE x) { return TYPE (x * x);} \
            TYPE##2 pow2(TYPE##2 x) { return TYPE##2 (x * x);} \
            TYPE##3 pow2(TYPE##3 x) { return TYPE##3 (x * x);} \
            TYPE##4 pow2(TYPE##4 x) { return TYPE##4 (x * x);} \
            TYPE pow3(TYPE x) { return TYPE (x * x * x);} \
            TYPE##2 pow3(TYPE##2 x) { return TYPE##2 (x * x * x);} \
            TYPE##3 pow3(TYPE##3 x) { return TYPE##3 (x * x * x);} \
            TYPE##4 pow3(TYPE##4 x) { return TYPE##4 (x * x * x);} \
            TYPE pow4(TYPE x) { TYPE xx = x * x; return TYPE (xx * xx);} \
            TYPE##2 pow4(TYPE##2 x) { TYPE##2 xx = x * x; return TYPE##2 (xx * xx);} \
            TYPE##3 pow4(TYPE##3 x) { TYPE##3 xx = x * x; return TYPE##3 (xx * xx);} \
            TYPE##4 pow4(TYPE##4 x) { TYPE##4 xx = x * x; return TYPE##4 (xx * xx);} \
            TYPE pow5(TYPE x) { TYPE xx = x * x; return TYPE (xx * xx * x);} \
            TYPE##2 pow5(TYPE##2 x) { TYPE##2 xx = x * x; return TYPE##2 (xx * xx * x);} \
            TYPE##3 pow5(TYPE##3 x) { TYPE##3 xx = x * x; return TYPE##3 (xx * xx * x);} \
            TYPE##4 pow5(TYPE##4 x) { TYPE##4 xx = x * x; return TYPE##4 (xx * xx * x);} \
            TYPE pow6(TYPE x) { TYPE xx = x * x; return TYPE (xx * xx * xx);} \
            TYPE##2 pow6(TYPE##2 x) { TYPE##2 xx = x * x; return TYPE##2 (xx * xx * xx);} \
            TYPE##3 pow6(TYPE##3 x) { TYPE##3 xx = x * x; return TYPE##3 (xx * xx * xx);} \
            TYPE##4 pow6(TYPE##4 x) { TYPE##4 xx = x * x; return TYPE##4 (xx * xx * xx);} \

            DEFINE_POW(bool)
            DEFINE_POW(uint)
            DEFINE_POW(int)
            DEFINE_POW(float)
            DEFINE_POW(half)
            
            


             // 定义 select 函数
             float3 select(int id, float3 e0, float3 e1, float3 e2, float3 e3, float3 e4)
             {
                 return id == 0 ? e0 : (id == 1 ? e1 : (id == 2 ? e2 : (id == 3 ? e3 : e4)));
             }

            struct Attributes
            {
                float4 positionOS   : POSITION;
                float4 tangentOS    : TANGENT;
                float3 normalOS     : NORMAL;
                float2 uv: TEXCOORD0;
                float2 texcoord : TEXCOORD1;
            };

            struct Varyings
            {
                float4 positionCS  : SV_POSITION;
                float2 uv: TEXCOORD0;
                float4 positionWSAndFogFactor : TEXCOORD1;
                float3 normalWS : TEXCOORD2;
                float4 tangentWS : TEXCOORD3;
                float3 viewDirWS : TEXCOORD4;
            };

            TEXTURE2D(_BaseMap);
            SAMPLER(sampler_BaseMap);
            TEXTURE2D(_OtherDataTex);
            SAMPLER(sampler_OtherDataTex);
            TEXTURE2D(_OtherDataTex2);
            SAMPLER(sampler_OtherDataTex2);
            TEXTURE2D(_NormalMap);
            SAMPLER(sampler_NormalMap);

            CBUFFER_START(UnityPerMaterial)
            float4 _Color;
            float4 _BaseMap_ST;
            float4 _OtherDataTex_ST;
            float4 _OtherDataTex2_ST;
            float4 _NormalMap_ST;
            float _BumpScale;
            float _Metallic;
            float _Glossiness;
            float _AlbedoSmoothness;
            float _MaterialIDUSE; // 添加材质ID变量
            float _UseSDFTex;
            float4 _ShadowColor; // 添加阴影颜色变量
            float4 _ShadowColor2;
            float4 _ShadowColor3;
            float4 _ShadowColor4;
            float4 _ShadowColor5;
            float4 _ShallowColor;
            float4 _ShallowColor2;
            float4 _ShallowColor3;
            float4 _ShallowColor4;
            float4 _ShallowColor5;
            float4 _PostShadowFadeTint; // 添加后阴影淡化色调变量
            float4 _PostShadowTint;
            float4 _PostShallowFadeTint;
            float4 _PostShallowTint;
            float4 _PostSSSTint;
            float4 _PostFrontTint;
            float4 _PostForwardTint;
            float _ScreenSpaceShadowWidth;
            float _ScreenSpaceShadowFadeout;
            float _ScreenSpaceShadowThreshold;
            float3 _HeadCenter;
            float3 _HeadForward;
            float3 _HeadRight;

            float _ScreenSpaceRimWidth;
            float _ScreenSpaceRimThreshold;
            float _ScreenSpaceRimFadeout;
            float _ScreenSpaceRimBrightness;

            float3 _RimGlowLightColor;
            float3 _RimGlowLightColor2;
            float3 _RimGlowLightColor3;
            float3 _RimGlowLightColor4;
            float3 _RimGlowLightColor5;

            float3 _UISunColor;
            float3 _UISunColor2;
            float3 _UISunColor3;
            float3 _UISunColor4;
            float3 _UISunColor5;

            float _UseSphere;
            float _HighLightShape;
            float _HighLightShape2;
            float _HighLightShape3;
            float _HighLightShape4;
            float _HighLightShape5;
            
            float _HeadSphereRange;
            sampler2D _LightSDFTex;
            sampler2D _MatCapTex;
            sampler2D _MatCapTex2;
            sampler2D _MatCapTex3;
            sampler2D _MatCapTex4;
            sampler2D _MatCapTex5;
            float _MatCapRefract;
            float _MatCapRefract2;
            float _MatCapRefract3;
            float _MatCapRefract4;
            float _MatCapRefract5;
            float4 _RefractParam;
            float4 _RefractParam2;
            float4 _RefractParam3;
            float4 _RefractParam4;
            float4 _RefractParam5;
            float _RefractDepth;
            float _RefractDepth2;
            float _RefractDepth3;
            float _RefractDepth4;
            float _RefractDepth5;
            float4 _MatCapColorTint;
            float4 _MatCapColorTint2;
            float4 _MatCapColorTint3;
            float4 _MatCapColorTint4;
            float4 _MatCapColorTint5;
            float _MatCapAlphaBurst;
            float _MatCapAlphaBurst2;
            float _MatCapAlphaBurst3;
            float _MatCapAlphaBurst4;
            float _MatCapAlphaBurst5;
            float _MatCapColorBurst;
            float _MatCapColorBurst2;
            float _MatCapColorBurst3;
            float _MatCapColorBurst4;
            float _MatCapColorBurst5;
            float _MatCapBlendMode;
            float _MatCapBlendMode2;
            float _MatCapBlendMode3;
            float _MatCapBlendMode4;
            float _MatCapBlendMode5;
            float _ShapeSoftness;
            float _ShapeSoftness2;
            float _ShapeSoftness3;
            float _ShapeSoftness4;
            float _ShapeSoftness5;
            float _SpecularRange;
            float _SpecularRange2;
            float _SpecularRange3;
            float _SpecularRange4;
            float _SpecularRange5;
            float _ToonSpecular;
            float _ToonSpecular2;
            float _ToonSpecular3;
            float _ToonSpecular4;
            float _ToonSpecular5;
            float _ModelSize;
            float _ModelSize2;
            float _ModelSize3;
            float _ModelSize4;
            float _ModelSize5;
            float _SpecIntensity;

            float4 _SpecularColor;
            float4 _SpecularColor2;
            float4 _SpecularColor3;
            float4 _SpecularColor4;
            float4 _SpecularColor5;

            float _AmbientColorIntensity;

            int _SkinMatId;
            int _GlossMatId;
            
            //sampler2D _CameraDepthTexture;
            //SAMPLER(sampler_CameraDepthTexture);
            //float4 _ZBufferParams;
            //float4 _ScaledScreenParams;
            
            
            float AverageColor(float3 color)
            {
                return dot(color,float3(1.0,1.0,1.0))/3.0;
            }

            float3 NormalizeColorByAverage(float3 color)
            {
                float average = AverageColor(color);
                return color / max(average,1e-5);
            }

            float3 ScaleColorByMax(float3 color)
            {
                float maxComponent = max3(color.r,color.g,color.g);
                maxComponent = min(maxComponent,1.0);
                return float3(color * maxComponent);
            }
            // float LoadSceneDepth(float2 uv)
            // {
            //     // 从深度纹理中采样深度值
            //     float rawDepth = tex2D(_CameraDepthTexture, uv).r;
            //     return rawDepth;
            // }

            float3 ClampColorMax(float3 color)
            {
                float maxComponent = max3(color.r,color.g,color.b);
                if (maxComponent > 1.0)
                {
                    return color / maxComponent;
                }
                return color;
            }

            //float UseSphere = _UseSphere;

            CBUFFER_END

            Varyings vert(Attributes IN)
            {
                Varyings OUT;

                OUT.positionCS = TransformObjectToHClip(IN.positionOS.xyz);
                OUT.uv = TRANSFORM_TEX(IN.uv, _BaseMap);

                OUT.positionWSAndFogFactor = float4(TransformObjectToWorld(IN.positionOS.xyz), ComputeFogFactor(OUT.positionCS.z));
                OUT.normalWS = normalize(TransformObjectToWorldNormal(IN.normalOS));
                OUT.tangentWS = float4(normalize(TransformObjectToWorldNormal(IN.tangentOS.xyz)), IN.tangentOS.w);
                OUT.viewDirWS = GetWorldSpaceViewDir(OUT.positionWSAndFogFactor.xyz);

                return OUT;
            }

            float4 frag(Varyings IN, bool isFrontFace : SV_IsFrontFace) : SV_Target
            {
                float4 texel = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, IN.uv);
                float3 normalWS = normalize(IN.normalWS);
                float3 pixelNormalWS = normalWS;
                float  diffuseBias = 0;

                float metallic = 0.0;


                float matCapMask = 0;

                int materialid = 0;

                float baseAlpha = 1.0;
                
                float3 positionWS = IN.positionWSAndFogFactor.xyz;

                float4 shadowCoord = TransformWorldToShadowCoord(positionWS);
                Light mainLight = GetMainLight(shadowCoord);
                float3 lightDirWS = normalize(mainLight.direction);
                float3 lightColor = mainLight.color;

                float angleThreshold = 0;
                float angleMapping = 0;
                float angleFunction = 0;
                float angleMapMask = 0;

                
                

                // 根据 MaterialID 选择使用自身法线还是贴图法线
                if (_MaterialIDUSE == 0)
                {
                    // 使用自身法线
                    pixelNormalWS = normalWS;
                }
                else
                {
                    // 使用法线贴图

                float4 lightData = SAMPLE_TEXTURE2D(_NormalMap,sampler_NormalMap, IN.uv);
                lightData = lightData * 2 - 1;
                diffuseBias = lightData.z * 2;

                float sgn = IN.tangentWS.w;
                float3 tangentWS = normalize(IN.tangentWS.xyz);
                float3 bitangentWS = cross(normalWS, tangentWS) * sgn;

                float3 pixelNormalTS = float3(lightData.xy,0.0);
                pixelNormalTS.xy *= _BumpScale;
                pixelNormalTS.z = sqrt(1.0 - min(0.0, dot(pixelNormalTS.xy, pixelNormalTS.xy)));
                pixelNormalWS = TransformTangentToWorld(pixelNormalTS,float3x3(tangentWS,bitangentWS,normalWS));
                pixelNormalWS = normalize(pixelNormalWS);
            }

                float4 otherData = SAMPLE_TEXTURE2D(_OtherDataTex, sampler_OtherDataTex, IN.uv);
                materialid = max(0,4 - floor(otherData.x *5)); // 将 x 通道值映射到 0-5的整数范围

                metallic = _Metallic * otherData.y;
                float specularMask = 0.0;
                float smoothness = 0.5;

                float4 otherData2 = SAMPLE_TEXTURE2D(_OtherDataTex2, sampler_OtherDataTex2, IN.uv);
                smoothness = _Glossiness * otherData2.y;
                matCapMask = otherData2.z;
                specularMask = otherData.z;
                
                if (_UseSDFTex > 0)
                {
                float3 headForward = normalize(_HeadForward - _HeadCenter);
                float3 headRight = normalize(_HeadRight - _HeadCenter);
                float3 headUp = normalize(cross(headForward, headRight));

                float3 lightDirectionProjHeadWS = lightDirWS - dot(lightDirWS,headUp) * headUp;
                lightDirectionProjHeadWS = normalize(lightDirectionProjHeadWS);

                float sX = dot(lightDirectionProjHeadWS,headRight);
                float sZ = dot(lightDirectionProjHeadWS, -headForward);
                angleThreshold = atan2(sX,sZ) / 3.14159265359;
                angleThreshold = angleThreshold >0 ? (1 - angleThreshold) : (1 + angleThreshold);

                float2 angleUV = IN .uv;
                if (dot(lightDirectionProjHeadWS,headRight) > 0)
                {
                    angleUV.x = 1.0 - angleUV.x;
                }

                float4 angleData = tex2D(_LightSDFTex, angleUV);
                angleMapping = angleData.r;
                angleFunction = angleData.g;
                angleMapMask = angleData.a;

                }
                else
                {
                    angleThreshold = 0.0;
                    angleMapping = 0.0;
                    angleFunction = 0.0;
                    angleMapMask = 0.0;
                }
                
                metallic *= _Metallic;
                smoothness *= _Glossiness;

                normalWS *= isFrontFace ? 1 : -1;
                pixelNormalWS *= isFrontFace ? 1 : -1;

                //float4 cameraDepthTex = tex2D(_CameraDepthTexture, IN.uv);


                float shadowAttenuation = 1.0;
                
                #if _SCREEN_SPACE_SHADOW
                {
                    // 计算线性眼空间深度
                    float linearEyeDepth = IN.positionCS.w;
                    float perspective = 1.0 / linearEyeDepth;

                    // 计算阴影偏移量
                    float offsetMul = _ScreenSpaceShadowWidth * 5.0 * perspective / 100.0;

                    float3 lightDirectionVS = TransformWorldToViewDir(normalize(lightDirWS));
                    float2 offset =  lightDirectionVS.xy * offsetMul;// 计算偏移

                    // 计算偏移后的屏幕坐标
                    int2 coord = IN.positionCS.xy + offset * _ScaledScreenParams.xy;
                    coord = min(max(0,coord), _ScaledScreenParams.xy - 1);
                    float offsetSceneDepth = LoadSceneDepth(coord);
                    float offsetSceneLinearEyeDepth = LinearEyeDepth(offsetSceneDepth, _ZBufferParams);

                    float fadeout = max(1e-5, _ScreenSpaceShadowFadeout);
                    shadowAttenuation = saturate((offsetSceneLinearEyeDepth - (linearEyeDepth - _ScreenSpaceShadowThreshold)) * 50 / fadeout);
                }
                #endif

                float3 baseAttenuation = 1.0;
                {
                    float NoL = dot(pixelNormalWS, lightDirWS);
                    baseAttenuation = NoL;
                    baseAttenuation += diffuseBias;
                }

                float albedoSmoothness = max(1e-5, _AlbedoSmoothness);

                float albedoShadowFade = 1.0;
                float albedoShadow = 1.0;
                float albedoShallowFade = 1.0;
                float albedoShallow = 1.0;
                float albedoSSS = 1.0;
                float albedoFront = 1.0;
                float albedoForward = 1.0;
                {
                    float attenuation = baseAttenuation * 1.5;
                    float s0 = albedoSmoothness * 1.5; 
                    float s1 = 1.0 - s0;

                    float aRamp[6] = {
                        (attenuation + 1.5) / s1 + 0.0,
                        (attenuation + 0.5) / s0 + 0.5,
                        (attenuation + 0.0) / s1 + 0.5,
                        (attenuation - 0.5) / s0 + 0.5,
                        (attenuation - 0.5) / s0 - 0.5,
                        (attenuation - 2.0) / s1 + 1.5,

                    };

                    albedoShadowFade = saturate(1 - aRamp[0]);
                    albedoShadow = saturate(min(1 - aRamp[1], aRamp[0]));
                    albedoShallowFade = saturate(min(1 - aRamp[2], aRamp[1]));
                    albedoShallow = saturate(min(1 - aRamp[3], aRamp[2]));
                    albedoSSS = saturate(min(1 - aRamp[4], aRamp[3]));
                    albedoFront = saturate(min(1 - aRamp[5], aRamp[4]));
                    albedoForward = saturate(aRamp[5]);  
                    
                    float sRamp[2] = {
                        2.0 * shadowAttenuation,
                        2.0 * shadowAttenuation - 1.0,
                    };

                    albedoShallowFade *= saturate(sRamp[0]);
                    albedoShallowFade += (1 - albedoShadowFade - albedoShadow) * saturate(1 - sRamp[0]);
                    albedoShallow *= saturate(min(sRamp[0], 1 - sRamp[1])) + saturate(sRamp[1]);
                    albedoSSS *= saturate(min(sRamp[0], 1 - sRamp[1])) + saturate(sRamp[1]);
                    albedoSSS += (albedoFront + albedoForward) * saturate(min(sRamp[0], 1 - sRamp[1]));
                    albedoFront *= saturate(sRamp[1]);
                    albedoForward *= saturate(sRamp[1]);
                }

                
                float a = 0;
                float s = lerp(_AlbedoSmoothness, 0.025, saturate(2.5 * (angleFunction - 0.5)));
                s = max(1e-5, s);
                if (_UseSDFTex > 0)
                {

                float angleAttenuation = 0.6 + (angleMapping * 1.2 - 0.6) / (s * 4 + 1) - angleThreshold;;
                //a = angleAttenuation;
                float aRamp[3] ={
                    angleAttenuation / s,
                    angleAttenuation / s - 1.0,
                    angleAttenuation / 0.125 - 16 * s
                };
                float angleShadowFade  = saturate(1 - aRamp[0]);
                float angleShadow = 0;
                float angleShallowFade = 0;
                float angleShallow = 0;
                float angleSSS = min(saturate(1 - aRamp[1]),saturate(aRamp[0]));
                float angleFront = min(saturate(1 - aRamp[2]),saturate(aRamp[1]));
                float angleForward = saturate(aRamp[2]);

                float sRamp[1] = {
                    2 * shadowAttenuation
                };

                angleShadowFade *= saturate(1 - sRamp[0]);
                angleShallowFade += (1 - angleForward - angleFront - angleSSS - angleShallow) * saturate(sRamp[0]);
                angleShallowFade += (angleSSS + angleFront + angleForward) * saturate(1 - sRamp[0]);
                angleSSS *= saturate(sRamp[0]);
                angleFront *= saturate(sRamp[0]);
                angleForward *= saturate(sRamp[0]);

                albedoShadowFade = lerp(albedoShadowFade, angleShadowFade, angleMapMask);
                albedoShadow = lerp(albedoShadow, angleShadow, angleMapMask);
                albedoShallowFade = lerp(albedoShallowFade, angleShallowFade, angleMapMask);
                albedoShallow = lerp(albedoShallow, angleShallow, angleMapMask);
                albedoSSS = lerp(albedoSSS, angleSSS, angleMapMask);
                albedoFront = lerp(albedoFront, angleFront, angleMapMask);
                albedoForward = lerp(albedoForward, angleForward, angleMapMask);
                }
                else
                {
                    a = 0;
                    s = 0;
                }

                float3 shadowFadeColor = 1.0;
                float3 shadowColor = 1.0;
                float3 shallowFadeColor = 1.0;
                float3 shallowColor = 1.0;
                float3 sssColor = 1.0;
                float3 frontColor = 1.0;
                float3 forwardColor = 1.0;
                {
                    float zFade = saturate(IN.positionCS.w + 0.43725);

                    shadowColor = select(materialid,
                        _ShadowColor,
                        _ShadowColor2,
                        _ShadowColor3,
                        _ShadowColor4,
                        _ShadowColor5
                        );

                        shadowColor = lerp(NormalizeColorByAverage(shadowColor), shadowColor, zFade);
                        shadowFadeColor = shadowColor * _PostShadowFadeTint;
                        shadowColor = shadowColor * _PostShadowTint;

                        shallowColor = select(materialid,
                            _ShallowColor,
                            _ShallowColor2,
                            _ShallowColor3,
                            _ShallowColor4,
                            _ShallowColor5
                            );
    
                            shallowColor = lerp(NormalizeColorByAverage(shallowColor), shallowColor, zFade);
                            shallowFadeColor = shallowColor * _PostShallowFadeTint;
                            shallowColor = shallowColor * _PostShallowTint;

                            sssColor = _PostSSSTint;
                            frontColor = _PostFrontTint;
                            forwardColor = 1.0;
                }

                float3 lightColorScaledBymax = ScaleColorByMax(lightColor);
                float3 albedo = (albedoForward * forwardColor + albedoFront * frontColor + albedoSSS * sssColor) * lightColor;
                albedo += (albedoShadowFade * shadowFadeColor + albedoShadow * shadowColor + albedoShallowFade * shallowFadeColor + albedoShallow * shallowColor) * lightColorScaledBymax;
               
                //float a = abs(albedoShadowFade + albedoShadow + albedoShallowFade + albedoShallow + albedoSSS + albedoFront + albedoForward - 1.0) < 0.01;

                float3 capColor = texel.rgb;
                //#if _MATCAP_ON && _MATCAP_ON > 0
                //{
                    float mask = matCapMask;

                    float3 normalVS = TransformWorldToViewDir(pixelNormalWS);
                    float2 capUV = normalVS.xy * 0.5 + 0.5;

                    float refract = select(materialid,
                        _MatCapRefract,
                        _MatCapRefract2,
                        _MatCapRefract3,
                        _MatCapRefract4,
                        _MatCapRefract5
                        );

                        if(refract > 0.5) {
                            float4 param = float4(select(materialid,
                                _RefractParam,
                                _RefractParam2,
                                _RefractParam3,
                                _RefractParam4,
                                _RefractParam5
                                ),1.0);

                                float depth = select(materialid,
                                    _RefractDepth,
                                    _RefractDepth2,
                                    _RefractDepth3,
                                    _RefractDepth4,
                                    _RefractDepth5
                                    );

                                    capUV = capUV * depth + param.xy * IN.uv + param.zw;
                        }

                        capColor = select(materialid,
                            tex2D(_MatCapTex, capUV).rgb,
                            tex2D(_MatCapTex2, capUV).rgb,
                            tex2D(_MatCapTex3, capUV).rgb,
                            tex2D(_MatCapTex4, capUV).rgb,
                            tex2D(_MatCapTex5, capUV).rgb
                            );

                            float3 tintColor = select(materialid,
                                _MatCapColorTint,
                                _MatCapColorTint2,
                                _MatCapColorTint3,
                                _MatCapColorTint4,
                                _MatCapColorTint5
                                );

                                float alphaBurst = select(materialid,
                                    _MatCapAlphaBurst,
                                    _MatCapAlphaBurst2,
                                    _MatCapAlphaBurst3,
                                    _MatCapAlphaBurst4,
                                    _MatCapAlphaBurst5
                                    );

                                float colorBurst = select(materialid,
                                    _MatCapColorBurst,
                                    _MatCapColorBurst2,
                                    _MatCapColorBurst3,
                                    _MatCapColorBurst4,
                                    _MatCapColorBurst5
                                    );
                                
                                int blendMode = select(materialid,
                                    _MatCapBlendMode,
                                    _MatCapBlendMode2,
                                    _MatCapBlendMode3,
                                    _MatCapBlendMode4,
                                    _MatCapBlendMode5
                                    );

                                if (blendMode == 0)
                                {
                                    float alpha = saturate(mask * alphaBurst);
                                    float3 blendColor = tintColor * capColor * colorBurst;                                   
                                    capColor = lerp(texel.rgb, blendColor, alpha);
                                }
                                else if (blendMode == 1)
                                {
                                    float alpha = saturate(alphaBurst * mask);
                                    float3 blendColor = tintColor * capColor * colorBurst;
                                    capColor = texel.rgb + alpha * blendColor;
                                }
                                else if (blendMode == 2)
                                {
                                    float alpha = saturate(alphaBurst * mask);
                                    float3 blendColor = saturate((capColor * tintColor - 0.5) * colorBurst + capColor * tintColor);
                                    blendColor = lerp(0.5, blendColor, alpha);
                                    capColor = lerp(blendColor * texel.rgb * 2, 1 - 2 * (1 - texel.rgb) * (1 - blendColor), texel.rgb >= 0.5);
                                }
                //}
                //#endif

                float3 gammaColor = capColor;
                {
                    float pixelNoL = dot(lightDirWS, pixelNormalWS);
                    float NoL = dot(lightDirWS , normalWS);

                    float occlusion = saturate(1 - 3 * (NoL - pixelNoL)) * 2;
                    occlusion *= sqrt(occlusion);
                    occlusion = min(1, occlusion);

                    float attenuation = lerp((pixelNoL * 0.5 + 0.5) * occlusion, saturate(pixelNoL), 0.5);

                    float3 capColorClamped = ClampColorMax(capColor);

                    float luminance = Luminance(capColor);
                    float gamma = lerp(luminance * 0.2875 + 1.4375, 1, attenuation);

                    float3 capColorGamma = pow(max(1e-5, capColorClamped),gamma);
                    float3 capColorGammaHalf = lerp(capColor, capColorGamma, 0.5);

                    gammaColor = lerp(capColorGammaHalf, capColorGamma, saturate(NoL));

                }

                float3 pbrDiffuseColor = lerp(0.96 * gammaColor, 0, metallic);
                float3 pbrSpecularColor = lerp(0.04, gammaColor, metallic);
                float3 specularColor = 0;

                if (_UseSphere == 1)
                {
                float shape = select(materialid,
                    _HighLightShape,
                    _HighLightShape2,
                    _HighLightShape3,
                    _HighLightShape4,
                    _HighLightShape5
                    );

                    float range = select(materialid,
                        _SpecularRange,
                        _SpecularRange2,
                        _SpecularRange3,
                        _SpecularRange4,
                        _SpecularRange5
                        );

                    float3 halfWS = normalize(lightDirWS + IN.viewDirWS);
                    float LoH = dot(lightDirWS, halfWS);
                    float rangeLoH = saturate(range * LoH * 0.75 + 0.25);
                    float rangeLoH2 = max(0.1, rangeLoH * rangeLoH);

                    float NoL = dot(pixelNormalWS, lightDirWS);
                    float rangeNoL = saturate(range * NoL * 0.75 + 0.25);


                    float specular = 0;

                    if(shape > 0.5)
                    {
                        bool useSphere = _HeadSphereRange > 0;

                        float3 shpereNormalWS = positionWS - _HeadCenter;
                        float len = length(shpereNormalWS);
                        shpereNormalWS = normalize(shpereNormalWS);
                        float sphereUsage = 1.0 - saturate((len - _HeadSphereRange) * 20);
                        float3 shapeNormalWS = lerp(pixelNormalWS, shpereNormalWS, sphereUsage);

                        float attenuation = saturate(baseAttenuation * 1.5 + 0.5);
                        float shapeNoL = dot(lightDirWS, shapeNormalWS);
                        float shapeAttenuation = sqrt(saturate(shapeNoL * 0.5 + 0.5));

                        shapeNormalWS = useSphere ? shapeNormalWS : pixelNormalWS;
                        shapeAttenuation = useSphere ? shapeAttenuation : attenuation;

                        float NoH = dot(shapeNormalWS, halfWS);
                        float NoH01 = saturate(NoH * 0.5 + 0.5);

                        specular = NoH01 * shapeAttenuation + specularMask -1;

                        float softness = select(materialid,
                            _ShapeSoftness,
                            _ShapeSoftness2,
                            _ShapeSoftness3,
                            _ShapeSoftness4,
                            _ShapeSoftness5
                            );
                            specular = saturate(specular / softness);
                            specular = specular * min(1.0, 1.0 / (6.0 * rangeLoH2)) * rangeNoL;             
                    }
                else
                {
                    float perceptualRoughness = 1.0 - smoothness;
                    float roughness = perceptualRoughness * perceptualRoughness;
                    float normalizationTerm = roughness * 4 + 2;
                    float roughness2 = roughness * roughness;
                    float roughness2MinusOne = roughness2 - 1;

                    float NoH = dot(pixelNormalWS, halfWS);
                    float rangeNoH = saturate(range * NoH * 0.75 + 0.25);

                    float d = rangeNoH * rangeNoH * roughness2MinusOne + 1;
                    float d2 = d * d;

                    float ggx = roughness2 / (d2 * rangeLoH2 * normalizationTerm);
                    specular = saturate(ggx - smoothness) * rangeNoL;

                    specular /= max(1e-5, roughness);

                    float toon = select(materialid,
                        _ToonSpecular,
                        _ToonSpecular2,
                        _ToonSpecular3,
                        _ToonSpecular4,
                        _ToonSpecular5
                        );

                        float size = select(materialid,
                            _ModelSize,
                            _ModelSize2,
                            _ModelSize3,
                            _ModelSize4,
                            _ModelSize5
                            );

                            specular *= toon * size * specularMask;
                            specular *= 10;
                            specular = saturate(specular);
                }

                specular *= 100;
                specular *= _SpecIntensity;

                float3 tintColor = select(materialid,
                    _SpecularColor,
                    _SpecularColor2,
                    _SpecularColor3,
                    _SpecularColor4,
                    _SpecularColor5
                    );

                    specularColor = specular * tintColor;
                    specularColor *= texel.rgb * 0.5;
            }
            

            float3 ambientColor = SampleSH(pixelNormalWS) * gammaColor * _AmbientColorIntensity;

            float3 rimGlowColor = 0;
            {
                bool isSkin = materialid == _SkinMatId;

                float LoV = dot(lightDirWS, IN.viewDirWS);
                float viewAttenuation = -LoV * 0.5 + 0.5;
                viewAttenuation = pow2(viewAttenuation);
                float edgeAttenuation = 1 - pow4(pow5(viewAttenuation));
                viewAttenuation = viewAttenuation * 0.5 + 0.5;

                float verticalAttenuation = pixelNormalWS.y * 0.5 + 0.5;
                verticalAttenuation = isSkin ? verticalAttenuation : pow2(verticalAttenuation);
                verticalAttenuation = smoothstep(0, 1.0, verticalAttenuation);

                float lightAttenuation = saturate(dot(pixelNormalWS ,lightDirWS)) * shadowAttenuation;

                float cameraDistance = length(IN.viewDirWS);

                float NoV = dot(pixelNormalWS, IN.viewDirWS);
                float fresnelDistanceFade = (isSkin ? 0.75 : 0.65) - 0.45 * min(1, cameraDistance / 12.0);
                float fresnelAttenuation = 1 - NoV - fresnelDistanceFade;
                float fresnelSoftness = isSkin ? 0.2 : 0.3;
                fresnelAttenuation = smoothstep(0, fresnelSoftness, fresnelAttenuation);

                float distanceAttenuation = 1 - 0.7 * saturate(cameraDistance * 0.2 - 1);

                float3 sunColor = select(materialid,
                    _UISunColor,
                    _UISunColor2,
                    _UISunColor3,
                    _UISunColor4,
                    _UISunColor5
                    );
                    float sunLuminance = Luminance(sunColor);
                    sunColor = isSkin ? sunColor : sunLuminance.xxx;

                    float3 sunColorScaled = pow2(pow4(sunColor));
                    sunColorScaled /= max(1e-5, dot(sunColorScaled, 0.7));

                    sunColor = AverageColor(sunColor) * sunColorScaled;
                    sunColor = lerp(albedo, sunColor, shadowAttenuation);
                    sunColor = lerp(albedo, sunColor, edgeAttenuation);

                    float3 rimDiffuse = pow(max(1e-5, pbrDiffuseColor), 0.2);
                    rimDiffuse = normalize(rimDiffuse);
                    float diffuseBrightness = AverageColor(pbrDiffuseColor);
                    diffuseBrightness = (1 - 0.2 * pow2(diffuseBrightness)) * 0.1;
                    rimDiffuse *= diffuseBrightness;

                    float3 rimSpecular = pbrSpecularColor;

                    float3 rimColor = lerp(rimDiffuse,rimSpecular, metallic);
                    rimColor *= 48;
                    rimColor *= fresnelAttenuation * verticalAttenuation * viewAttenuation * lightAttenuation * distanceAttenuation * sunColor;

                    float3 glowColor = select(materialid,
                        _RimGlowLightColor,
                        _RimGlowLightColor2,
                        _RimGlowLightColor3,
                        _RimGlowLightColor4,
                        _RimGlowLightColor5
                        );

                        rimColor *= glowColor;

                        float3 rimColorBrightness = AverageColor(rimColor);
                        rimColorBrightness = pow2(rimColorBrightness);
                        rimColorBrightness = 1 + 0.5 * rimColorBrightness;
                        rimColor *= rimColorBrightness;
                        
                        float screenSpaceRim = 1.0;
                        #if _SCREEN_SPACE_RIM
                        {
                            float linearEyeDepth = IN.positionCS.w;
                            float3 normalVS = TransformWorldToViewDir(normalWS);
                            float2 uvOffset = float2(normalize(normalVS.xy)) * _ScreenSpaceRimWidth / linearEyeDepth;
                            int2 texPos = IN.positionCS.xy + uvOffset;
                            texPos = min(max(0, texPos), _ScaledScreenParams.xy - 1);
                            float offsetSceneDepth = LoadSceneDepth(texPos);
                            float offsetSceneLinearEyeDepth = LinearEyeDepth(offsetSceneDepth, _ZBufferParams);
                            screenSpaceRim = saturate((offsetSceneLinearEyeDepth - (linearEyeDepth + _ScreenSpaceRimThreshold)) * 10 / _ScreenSpaceRimFadeout);
                            screenSpaceRim *= _ScreenSpaceRimBrightness;
                        }
                        #endif

                        rimGlowColor = rimColor * screenSpaceRim;
                        rimGlowColor = min(rimGlowColor, 1.0);

            }

            bool isGloss = materialid == _GlossMatId;


            float3 color = ambientColor;
            color += pbrDiffuseColor * albedo + pbrSpecularColor * specularColor * albedo;
            color += max(0, pbrSpecularColor * specularColor * albedo - 1);
            color += rimGlowColor;

            color = MixFog(color, IN.positionWSAndFogFactor.w);

                //return float4(albedo * texel, baseAlpha);
                return float4(color, baseAlpha);
                

            }
            ENDHLSL
        }

        Pass
        {
            Name "SRPDefaulUnlit"
            Tags { "LightMode" = "SRPDefaultUnlit" }
            Cull [_Cull]
            Blend [_SRPSrcBlendMode] [_SRPDstBlendMode]
            BlendOp [_SRPBlendOp]
            ZWrite [_ZWrite]
            Stencil
            {
                Ref [_StencilRef]
                Comp [_StencilComp]
                Pass [_StencilPassOp]
                Fail [_StencilFailOp]
                ZFail [_StencilZFailOp]
            }

            HLSLPROGRAM
            #pragma shader_feature_local _SRP_DEFAULT_PASS
            #pragma shader_feature_local _SCREEN_SPACE_RIM
            #pragma shader_feature_local _SCREEN_SPACE_SHADOW
            #pragma shader_feature_local _MATCAP_ON

            #pragma vertex MainVS2
            #pragma fragment MainPS2

            #pragma multi_compile_fog

            #if _SRP_DEFAULT_PASS
            UniversalVaryings MainVS2(UniversalAttributes input) { return MainVS(input); }
            float4 MainPS2(UniversalVaryings input, bool isFrontFace : SV_IsFrontFace) : SV_Target { return MainPS(input, isFrontFace); }
            #else
            void MainVS2() {};
            void MainPS2() {};
            #endif

            ENDHLSL
        }
            
        // Pass
        // {
        //     Name "UniversalForward2"
        //     Tags { "LightMode" = "UniversalForward" }
        //     Cull [_Cull]
        //     Blend [_SrcBlendMode] [_DstBlendMode]
        //     BlendOp [_BlendOp]
        //     ZWrite [_ZWrite]
        //     Stencil
        //     {
        //         Ref [_StencilRef]
        //         Comp [_StencilComp]
        //         Pass [_StencilPassOp]
        //         Fail [_StencilFailOp]
        //         ZFail [_StencilZFailOp]
        //     }

        //     HLSLPROGRAM
        //     #pragma shader_feature_local _SCREEN_SPACE_RIM
        //     #pragma shader_feature_local _SCREEN_SPACE_SHADOW

        //     #pragma vertex vert
        //     #pragma fragment frag

        //     #pragma multi_compile_fog

        //     #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        //     #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        //     #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"

        //     #define DEFINE_MINMAX3(TYPE) \
        //     TYPE min3(TYPE a, TYPE b, TYPE c) { return TYPE(min(min(a, b), c)); } \
        //     TYPE##2 min3(TYPE##2 a, TYPE##2 b, TYPE##2 c) { return TYPE##2(min(min(a, b), c)); } \
        //     TYPE##3 min3(TYPE##3 a, TYPE##3 b, TYPE##3 c) { return TYPE##3(min(min(a, b), c)); } \
        //     TYPE##4 min3(TYPE##4 a, TYPE##4 b, TYPE##4 c) { return TYPE##4(min(min(a, b), c)); } \
        //     TYPE max3(TYPE a, TYPE b, TYPE c) { return TYPE(max(max(a, b), c)); } \
        //     TYPE##2 max3(TYPE##2 a, TYPE##2 b, TYPE##2 c) { return TYPE##2(max(max(a, b), c)); } \
        //     TYPE##3 max3(TYPE##3 a, TYPE##3 b, TYPE##3 c) { return TYPE##3(max(max(a, b), c)); } \
        //     TYPE##4 max3(TYPE##4 a, TYPE##4 b, TYPE##4 c) { return TYPE##4(max(max(a, b), c)); }

        //     DEFINE_MINMAX3(bool)
        //     DEFINE_MINMAX3(uint)
        //     DEFINE_MINMAX3(int)
        //     DEFINE_MINMAX3(float)
        //     DEFINE_MINMAX3(half)

        //      // 定义 select 函数
        //      float3 select(int id, float3 e0, float3 e1, float3 e2, float3 e3, float3 e4)
        //      {
        //          return id == 0 ? e0 : (id == 1 ? e1 : (id == 2 ? e2 : (id == 3 ? e3 : e4)));
        //      }

        //     struct Attributes
        //     {
        //         float4 positionOS   : POSITION;
        //         float4 tangentOS    : TANGENT;
        //         float3 normalOS     : NORMAL;
        //         float2 uv: TEXCOORD0;
        //         float2 texcoord : TEXCOORD1;
        //     };

        //     struct Varyings
        //     {
        //         float4 positionCS  : SV_POSITION;
        //         float2 uv: TEXCOORD0;
        //         float4 positionWSAndFogFactor : TEXCOORD1;
        //         float3 normalWS : TEXCOORD2;
        //         float4 tangentWS : TEXCOORD3;
        //         float3 viewDirWS : TEXCOORD4;
        //     };

        //     TEXTURE2D(_BaseMap);
        //     SAMPLER(sampler_BaseMap);
        //     TEXTURE2D(_OtherDataTex);
        //     SAMPLER(sampler_OtherDataTex);
        //     TEXTURE2D(_NormalMap);
        //     SAMPLER(sampler_NormalMap);

        //     CBUFFER_START(UnityPerMaterial)
        //     float4 _Color;
        //     float4 _BaseMap_ST;
        //     float4 _OtherDataTex_ST;
        //     float4 _NormalMap_ST;
        //     float _BumpScale;
        //     float _AlbedoSmoothness;
        //     float _MaterialID; // 添加材质ID变量
        //     float4 _ShadowColor; // 添加阴影颜色变量
        //     float4 _ShadowColor2;
        //     float4 _ShadowColor3;
        //     float4 _ShadowColor4;
        //     float4 _ShadowColor5;
        //     float4 _ShallowColor;
        //     float4 _ShallowColor2;
        //     float4 _ShallowColor3;
        //     float4 _ShallowColor4;
        //     float4 _ShallowColor5;
        //     float4 _PostShadowFadeTint; // 添加后阴影淡化色调变量
        //     float4 _PostShadowTint;
        //     float4 _PostShallowFadeTint;
        //     float4 _PostShallowTint;
        //     float4 _PostSSSTint;
        //     float4 _PostFrontTint;
        //     float4 _PostForwardTint;
        //     float _ScreenSpaceShadowWidth;
        //     float _ScreenSpaceShadowFadeout;
        //     float _ScreenSpaceShadowThreshold;
        //     sampler2D _CameraDepthTexture;
        //     //SAMPLER(sampler_CameraDepthTexture);
        //     //float4 _ZBufferParams;
        //     //float4 _ScaledScreenParams;
            
            
        //     float AverageColor(float3 color)
        //     {
        //         return dot(color,float3(1.0,1.0,1.0))/3.0;
        //     }

        //     float3 NormalizeColorByAverage(float3 color)
        //     {
        //         float average = AverageColor(color);
        //         return color / max(average,1e-5);
        //     }

        //     float3 ScaleColorByMax(float3 color)
        //     {
        //         float maxComponent = max3(color.r,color.g,color.g);
        //         maxComponent = min(maxComponent,1.0);
        //         return float3(color * maxComponent);
        //     }
        //     float LoadSceneDepth(float2 uv)
        //     {
        //         // 从深度纹理中采样深度值
        //         float rawDepth = tex2D(_CameraDepthTexture, uv).r;
        //         return rawDepth;
        //     }

        //     CBUFFER_END

        //     Varyings vert(Attributes IN)
        //     {
        //         Varyings OUT;

        //         OUT.positionCS = TransformObjectToHClip(IN.positionOS.xyz);
        //         OUT.uv = TRANSFORM_TEX(IN.uv, _BaseMap);

        //         OUT.positionWSAndFogFactor = float4(TransformObjectToWorld(IN.positionOS.xyz), ComputeFogFactor(OUT.positionCS.z));
        //         OUT.normalWS = normalize(TransformObjectToWorldNormal(IN.normalOS));
        //         OUT.tangentWS = float4(normalize(TransformObjectToWorldNormal(IN.tangentOS.xyz)), IN.tangentOS.w);
        //         OUT.viewDirWS = GetWorldSpaceViewDir(OUT.positionWSAndFogFactor.xyz);

        //         return OUT;
        //     }

        //     float4 frag(Varyings IN, bool isFrontFace : SV_IsFrontFace) : SV_Target
        //     {
        //         float4 texel = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, IN.uv);
        //         float3 normalWS = normalize(IN.normalWS);
        //         float3 pixelNormalWS = normalWS;
        //         float  diffuseBias = 0;

        //         float baseAlpha = 1.0;
                
        //         float3 positionWS = IN.positionWSAndFogFactor.xyz;

        //         float4 shadowCoord = TransformWorldToShadowCoord(positionWS);
        //         Light mainLight = GetMainLight(shadowCoord);
        //         float3 lightDirWS = normalize(mainLight.direction);
        //         float3 lightColor = mainLight.color;
        //         float sgn = IN.tangentWS.w;
        //         float3 tangentWS = normalize(IN.tangentWS.xyz);
        //         float3 bitangentWS = cross(normalWS, tangentWS) * sgn;
                

        //         // 根据 MaterialID 选择使用自身法线还是贴图法线
        //         if (_MaterialIDUSE == 0)
        //         {
        //             // 使用自身法线
        //             pixelNormalWS = normalWS;
        //         }
        //         else
        //         {
        //             // 使用法线贴图

        //         float4 lightData = SAMPLE_TEXTURE2D(_NormalMap,sampler_NormalMap, IN.uv);
        //         lightData = lightData * 2 - 1;
        //         diffuseBias = lightData.z * 2;

        //         float3 pixelNormalTS = float3(lightData.xy,0.0);
        //         pixelNormalTS.xy *= _BumpScale;
        //         pixelNormalTS.z = sqrt(1.0 - min(0.0, dot(pixelNormalTS.xy, pixelNormalTS.xy)));
        //         pixelNormalWS = TransformTangentToWorld(pixelNormalTS,float3x3(tangentWS,bitangentWS,normalWS));
        //         pixelNormalWS = normalize(pixelNormalWS);
        //     }

        //         float4 otherData = SAMPLE_TEXTURE2D(_OtherDataTex, sampler_OtherDataTex, IN.uv);
        //         int materialid = max(0,4 - floor(otherData.x *5)); // 将 x 通道值映射到 0-5的整数范围 
               

        //         normalWS *= isFrontFace ? 1 : -1;
        //         pixelNormalWS *= isFrontFace ? 1 : -1;

        //         float4 cameraDepthTex = tex2D(_CameraDepthTexture, IN.uv);


        //         float shadowAttenuation = 1.0;
                
        //         #if _SCREEN_SPACE_SHADOW
        //         {
        //             float linearEyeDepth = IN.positionCS.w;
        //             float perspective = 1.0 / linearEyeDepth;
        //             float offsetMul = _ScreenSpaceShadowWidth * 5.0 * perspective / 100.0;

        //             float3 lightDirectionVS = TransformWorldToViewDir(lightDirWS);
        //             float2 offset =  lightDirectionVS.xy * offsetMul;
        //             float2 coord = IN.positionCS.xy + offset * _ScaledScreenParams.xy;
        //             coord = min(max(0,coord), _ScaledScreenParams.xy - 1);
        //             float offsetSceneDepth = LoadSceneDepth(coord);
        //             float offsetSceneLinearEyeDepth = LinearEyeDepth(offsetSceneDepth, _ZBufferParams);

        //             float fadeout = max(1e-5,_ScreenSpaceShadowFadeout);
        //             shadowAttenuation = saturate((offsetSceneLinearEyeDepth - (linearEyeDepth - _ScreenSpaceShadowThreshold)) * 50 / fadeout);
        //         }
        //         #endif

        //         float3 baseAttenuation = 1.0;
        //         {
        //             float NoL = dot(pixelNormalWS, lightDirWS);
        //             baseAttenuation = NoL;
        //             baseAttenuation += diffuseBias;
        //         }

        //         float albedoSmoothness = max(1e-5, _AlbedoSmoothness);

        //         float albedoShadowFade = 1.0;
        //         float albedoShadow = 1.0;
        //         float albedoShallowFade = 1.0;
        //         float albedoShallow = 1.0;
        //         float albedoSSS = 1.0;
        //         float albedoFront = 1.0;
        //         float albedoForward = 1.0;
        //         {
        //             float attenuation = baseAttenuation * 1.5;
        //             float s0 = albedoSmoothness * 1.5; 
        //             float s1 = 1.0 - s0;

        //             float aRamp[6] = {
        //                 (attenuation + 1.5) / s1 + 0.0,
        //                 (attenuation + 0.5) / s0 + 0.5,
        //                 (attenuation + 0.0) / s1 + 0.5,
        //                 (attenuation - 0.5) / s0 + 0.5,
        //                 (attenuation - 0.5) / s0 - 0.5,
        //                 (attenuation - 2.0) / s1 + 1.5,

        //             };

        //             albedoShadowFade = saturate(1 - aRamp[0]);
        //             albedoShadow = saturate(min(1 - aRamp[1], aRamp[0]));
        //             albedoShallowFade = saturate(min(1 - aRamp[2], aRamp[1]));
        //             albedoShallow = saturate(min(1 - aRamp[3], aRamp[2]));
        //             albedoSSS = saturate(min(1 - aRamp[4], aRamp[3]));
        //             albedoFront = saturate(min(1 - aRamp[5], aRamp[4]));
        //             albedoForward = saturate(aRamp[5]);                   
        //         }

        //         float3 shadowFadeColor = 1.0;
        //         float3 shadowColor = 1.0;
        //         float3 shallowFadeColor = 1.0;
        //         float3 shallowColor = 1.0;
        //         float3 sssColor = 1.0;
        //         float3 frontColor = 1.0;
        //         float3 forwardColor = 1.0;
        //         {
        //             float zFade = saturate(IN.positionCS.w + 0.43725);

        //             shadowColor = select(materialid,
        //                 _ShadowColor,
        //                 _ShadowColor2,
        //                 _ShadowColor3,
        //                 _ShadowColor4,
        //                 _ShadowColor5
        //                 );

        //                 shadowColor = lerp(NormalizeColorByAverage(shadowColor), shadowColor, zFade);
        //                 shadowFadeColor = shadowColor * _PostShadowFadeTint;
        //                 shadowColor = shadowColor * _PostShadowTint;

        //                 shallowColor = select(materialid,
        //                     _ShallowColor,
        //                     _ShallowColor2,
        //                     _ShallowColor3,
        //                     _ShallowColor4,
        //                     _ShallowColor5
        //                     );
    
        //                     shallowColor = lerp(NormalizeColorByAverage(shallowColor), shallowColor, zFade);
        //                     shallowFadeColor = shallowColor * _PostShallowFadeTint;
        //                     shallowColor = shallowColor * _PostShallowTint;

        //                     sssColor = _PostSSSTint;
        //                     frontColor = _PostFrontTint;
        //                     forwardColor = 1.0;
        //         }

        //         float3 lightColorScaledBymax = ScaleColorByMax(lightColor);
        //         float3 albedo = (albedoForward * forwardColor + albedoFront * frontColor + albedoSSS * sssColor) * lightColor;
        //         albedo += (albedoShadowFade * shadowFadeColor + albedoShadow * shadowColor + albedoShallowFade * shallowFadeColor + albedoShallow * shallowColor) * lightColorScaledBymax;
               
        //         float a = abs(albedoShadowFade + albedoShadow + albedoShallowFade + albedoShallow + albedoSSS + albedoFront + albedoForward - 1.0) < 0.01;



        //         return float4(albedo * texel, baseAlpha);
        //         //return float4(shadowAttenuation.xxx, baseAlpha);

        //     }
        //     ENDHLSL
        // }
        
        Pass
        {
            Name"UniversalForwardOnly"
            Tags
            {
                "LightMode" = "UniversalForwardOnly"
            }
            Cull Front
            ZWrite On

            HLSLPROGRAM
            #pragma shader_feature_local _OUTLINE_PASS

            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
             // 定义 select 函数
             float3 select(int id, float3 e0, float3 e1, float3 e2, float3 e3, float3 e4)
             {
                 return id == 0 ? e0 : (id == 1 ? e1 : (id == 2 ? e2 : (id == 3 ? e3 : e4)));
             }
            // If your project has a faster way to get camera fov in shader, you can replace this slow function to your method.
            // For example, you write cmd.SetGlobalFloat("_CurrentCameraFOV",cameraFOV) using a new RendererFeature in C#.
            // For this tutorial shader, we will keep things simple and use this slower but convenient method to get camera fov
            float GetCameraFOV()
            {
                //https://answers.unity.com/questions/770838/how-can-i-extract-the-fov-information-from-the-pro.html
                float t = unity_CameraProjection._m11;
                float Rad2Deg = 180 / 3.1415;
                float fov = atan(1.0f / t) * 2.0 * Rad2Deg;
                return fov;
            }
            float ApplyOutlineDistanceFadeOut(float inputMulFix)
            {
                //make outline "fadeout" if character is too small in camera's view
                return saturate(inputMulFix);
            }
            float GetOutlineCameraFovAndDistanceFixMultiplier(float positionVS_Z)
            {
                float cameraMulFix;
                if(unity_OrthoParams.w == 0)
                {
                    ////////////////////////////////
                    // Perspective camera case
                    ////////////////////////////////

                    // keep outline similar width on screen accoss all camera distance       
                    cameraMulFix = abs(positionVS_Z);

                    // can replace to a tonemap function if a smooth stop is needed
                    cameraMulFix = ApplyOutlineDistanceFadeOut(cameraMulFix);

                    // keep outline similar width on screen accoss all camera fov
                    cameraMulFix *= GetCameraFOV();       
                }
                else
                {
                    ////////////////////////////////
                    // Orthographic camera case
                    ////////////////////////////////
                    float orthoSize = abs(unity_OrthoParams.y);
                    orthoSize = ApplyOutlineDistanceFadeOut(orthoSize);
                    cameraMulFix = orthoSize * 50; // 50 is a magic number to match perspective camera's outline width
                }

                return cameraMulFix * 0.00005; // mul a const to make return result = default normal expand amount WS
            }
            // Push an imaginary vertex towards camera in view space (linear, view space unit), 
            // then only overwrite original positionCS.z using imaginary vertex's result positionCS.z value
            // Will only affect ZTest ZWrite's depth value of vertex shader

            // Useful for:
            // -Hide ugly outline on face/eye
            // -Make eyebrow render on top of hair
            // -Solve ZFighting issue without moving geometry
            float4 NiloGetNewClipPosWithZOffset(float4 originalPositionCS, float viewSpaceZOffsetAmount)
            {
                if(unity_OrthoParams.w == 0)
                {
                    ////////////////////////////////
                    //Perspective camera case
                    ////////////////////////////////
                    float2 ProjM_ZRow_ZW = UNITY_MATRIX_P[2].zw;
                    float modifiedPositionVS_Z = -originalPositionCS.w + -viewSpaceZOffsetAmount; // push imaginary vertex
                    float modifiedPositionCS_Z = modifiedPositionVS_Z * ProjM_ZRow_ZW[0] + ProjM_ZRow_ZW[1];
                    originalPositionCS.z = modifiedPositionCS_Z * originalPositionCS.w / (-modifiedPositionVS_Z); // overwrite positionCS.z
                    return originalPositionCS;    
                }
                else
                {
                    ////////////////////////////////
                    //Orthographic camera case
                    ////////////////////////////////
                    originalPositionCS.z += -viewSpaceZOffsetAmount / _ProjectionParams.z; // push imaginary vertex and overwrite positionCS.z
                    return originalPositionCS;
                }
            }

            struct Attributes
            {
                float4 positionOS   : POSITION;
                float4 tangentOS    : TANGENT;
                float3 normalOS     : NORMAL;
                float2 texcoord     :TEXCOORD0;
                float2 texcoord1    :TEXCOORD1;
                float2 uv: TEXCOORD0;
            };

            struct Varyings
            {
                float4 positionCS  : SV_POSITION;
                float fogFactor    : TEXCOORD1;
                float2 uv: TEXCOORD0;
            };

            TEXTURE2D(_BaseMap);
            SAMPLER(sampler_BaseMap);
            float _OutLineWidth;
            float _MaxOutlineZoffset;
            float4 _OutlineColor;
            float _MaterialIDUSE; // 添加材质ID变量
            float4 _OutlineColor2;
            float4 _OutlineColor3;
            float4 _OutlineColor4;
            float4 _OutlineColor5;
            TEXTURE2D(_OtherDataTex);
            SAMPLER(sampler_OtherDataTex);
            
            //CBUFFER_START(UnityPerMaterial)
            //float4 _Color;
            //float4 _BaseMap_ST;
            //CBUFFER_END

            Varyings vert(Attributes input)
            {   
                //#if !_OUTLINE_PASS
                //return (Varyings)0;
                //#endif

                VertexPositionInputs positionInputs = GetVertexPositionInputs(input.positionOS.xyz);
                VertexNormalInputs normalInputs = GetVertexNormalInputs(input.normalOS,input.tangentOS);

                float width = _OutLineWidth;
                width *= GetOutlineCameraFovAndDistanceFixMultiplier(positionInputs.positionVS.z);

                float3 positionWS = positionInputs.positionWS.xyz;
                positionWS += normalInputs.normalWS * width;

                Varyings output = (Varyings)0;
                output.positionCS = NiloGetNewClipPosWithZOffset(TransformWorldToHClip(positionWS),_MaxOutlineZoffset);
                output.uv = input.texcoord;
                output.fogFactor = ComputeFogFactor(positionInputs.positionCS.z);

                //Varyings OUT;

                //OUT.positionCS = TransformObjectToHClip(IN.positionOS.xyz);
                //OUT.uv = TRANSFORM_TEX(IN.uv, _BaseMap);

                return output;
            }

            float4 frag(Varyings input) : SV_Target
            {
                //float4 texel = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, IN.uv);
                float3 outlineColor = 0;

                outlineColor = _OutlineColor.rgb;

                // 使用 _OtherDataTex 的 x 通道选择描边颜色
                float4 otherData = SAMPLE_TEXTURE2D(_OtherDataTex, sampler_OtherDataTex, input.uv);
                int materialid = max(0,4 - floor(otherData.x *5)); // 将 x 通道值映射到 0-5的整数范围
                outlineColor = select(materialid, _OutlineColor.rgb, _OutlineColor2.rgb, _OutlineColor3.rgb, _OutlineColor4.rgb, _OutlineColor5.rgb);
                

                float4 baseMapColor = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, input.uv);
                outlineColor *= 0.2 * baseMapColor.rgb;

                float4 color = float4(outlineColor,1);
                color.rgb = MixFog(color.rgb, input.fogFactor);

                return color;
            }
            ENDHLSL
        }
    }
    FallBack "Diffuse"
}
