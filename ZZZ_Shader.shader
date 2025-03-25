Shader "Unlit/pbr"
{
    Properties
    {
        _BaseColorTex("Base Color Tex", 2D) = "white"{}
        _Color("Color", Color) = (1,1,1,1)
        _NormalTex("Normal Tex", 2D) = "bump" {}
        _BumpScale("Bump Scale", Range(-5,5)) = 1
        _ILMTex("ILM Tex", 2D) = "white" {}
        _RampTex ("Ramp Texture", 2D) = "white" {}
        _RampTex2 ("Ramp Texture2", 2D) = "white" {}
        _ShadowThreshold ("Shadow Threshold", Range(0,1)) = 0.5
        _ShadowSmoothness ("Shadow Smoothness", Range(0,1)) = 0.1
        _RampThreshold ("Ramp Threshold", Range(0,1)) = 0.5
        _MaterialIDUSE("Material ID USE", Range(0,4)) = 0
        _OcclusionIntensity("Occlusion Intensity", Range(0,1)) = 0
        _MetallicIntensity("Metallic Intensity", Range(0,1)) = 0
        _RoughnessIntensity("Roughness Intensity", Range(0,1)) = 0
        _SmoothnessIntensity("Smoothness Intensity", Range(0,1)) = 0
        _SpecularTintIntensity("Specular Tint Intensity", Range(0,1)) = 0
        _ShadowIntensity("Shadow Intensity", Range(0,1)) = 0
        _ShaodwColor("Shadow Color", Color) = (0,0,0,1)
        _SHIntensity("SH Intensity", Range(0,1)) = 0
        _aoUsage("AO Usage", Range(0,1)) = 0
        _AmbientIntensity("Ambient Intensity", Range(0,1)) = 0
        _Ambientpower("Ambient Power", Range(0,1)) = 0
        //_EmissionIntensity("Emission Intensity", Range(0,1)) = 0

        //_Roughness("Roughness", Range(0,1)) = 0
        //_Metallic("Metallic", Range(0,1)) = 0
        //_Smoothness("Smoothness", Range(0,1)) = 0.5
        _SpecularTint("Specular Tint", Color) = (1,1,1,1)
        _Emission("Emission", Color) = (0,0,0,0)
        _EmissionIntensity("Emission Intensity", Range(0,1)) = 0
        //_EmissionIntensity("Emission Intensity", Range(0,1)) = 0
        _AlphaClip("Alpha Clip", Range(0,1)) = 0.333
        _OutLineWidth("Outline Width", Range(0,1)) = 0.01
        _MaxOutlineZoffset("Max Outline Zoffset", Range(0,1)) = 0.01
        _OutlineColor("Outline Color", Color) = (0,0,0,1)


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
        Tags { "RenderType"="Opaque" "RenderPipeline"="UniversalPipeline" }
        LOD 300

        
        HLSLINCLUDE
        
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS_SCREEN

        #pragma multi_compile_fragment _ _LIGHT_LAYERS
        #pragma multi_compile_fragment _ _LIGHT_COOKIES
        #pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
        #pragma multi_compile_fragment _ _SHADOWS_SOFT
        #pragma multi_compile_fragment _ _ADDITIONAL_LIGHTS_SHADOWS
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION

               
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/BRDF.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/BSDF.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonMaterial.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Deprecated.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceData.hlsl"

        //#define PI 3.141592654

        #define kDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) // standard dielectric reflectivity coef at incident angle (= 4%)
        
        float3 CalculateAmbientLighting(
        BRDFData brdfData, 
        float3 normalWS, 
        float3 viewDirectionWS, 
        float occlusion
    ) {
        // 1. 漫反射环境光（球谐函数）
        float3 indirectDiffuse = SampleSH(normalWS) * brdfData.diffuse * occlusion;

        // 2. 镜面反射环境光（基于反射探针或环境贴图）
        float3 reflectVector = reflect(-viewDirectionWS, normalWS);
        float3 indirectSpecular = GlossyEnvironmentReflection(
            reflectVector,
            brdfData.perceptualRoughness,
            occlusion
        );

    return indirectDiffuse + indirectSpecular;
}

        CBUFFER_START(UnityPerMaterial)

            //sampler2D _BaseColorTex;
            float4 _BaseColorTex_ST;
            float4 _Color;
            TEXTURE2D(_NormalTex);
            SAMPLER(sampler_NormalTex);
            
            TEXTURE2D(_BaseColorTex);
            //TEXTURE2D(_NormalTex);
            //TEXTURE2D(_OcclusionTex);
            TEXTURE2D(_ILMTex);
            SAMPLER(sampler_ILMTex);
            TEXTURE2D( _RampTex);
            SAMPLER(sampler_RampTex);
            TEXTURE2D( _RampTex2);
            SAMPLER(sampler_RampTex2);
            //float4 _Color;
            float _RampThreshold;
            float _ShadowThreshold;
            float _ShadowSmoothness;
            float _ShadowIntensity;
            float4 _ShaodwColor;
            float _SHIntensity;
            float _aoUsage;
            float _AmbientIntensity;
            float _Ambientpower;

            
            //SAMPLER(sampler_LinearRepeat);
            
            //sampler2D _OcclusionTex;
            float _BumpScale;
            float _OcclusionIntensity;
            float _MetallicIntensity;
            float _RoughnessIntensity;
            float _SmoothnessIntensity;
            float _SpecularTintIntensity;
            //float4 _OcclusionTex_ST;
            //float4 _ILMTex;
            //float _Roughness;
            //float _Smoothness;
            float _SpecularTint;
            //float _Metallic;
            float4 _Emission;
            float _EmissionIntensity;
            float _AlphaClip;
            float _MaterialIDUSE;

        CBUFFER_END

        //SAMPLER(sampler_LinearRepeat);

        struct UniversalAttributes
        {
            float4 positionOS : POSITION;
            float3 normalOS : NORMAL;
            float4 tangentOS : TANGENT;
            float2 texcoord : TEXCOORD0;
        };

        struct UniversalVaryings
        {
            float2 uv                      : TEXCOORD0;
            float4 positionWSAndFogFactor  : TEXCOORD1;
            float3 normalWS                : TEXCOORD2;
            float4 tangentWS               : TEXCOORD3;
            float3 bitangentWS             : TEXCOORD4;
            float3 viewDirWS                : TEXCOORD5;
            float4 positionCS              : SV_POSITION;
            float3 SH                      : TEXCOORD6;               
        };

        UniversalVaryings MainVS(UniversalAttributes input)
        {
            VertexPositionInputs positionInputs = GetVertexPositionInputs(input.positionOS.xyz);
            VertexNormalInputs normalInputs = GetVertexNormalInputs(input.normalOS, input.tangentOS);


            UniversalVaryings output;
            output.positionCS = positionInputs.positionCS;
            output.positionWSAndFogFactor = float4(positionInputs.positionWS,ComputeFogFactor(positionInputs.positionCS.z));

            output.normalWS = normalInputs.normalWS;
            output.tangentWS.xyz = normalInputs.tangentWS;
            output.tangentWS.w = input.tangentOS.w * GetOddNegativeScale();
            output.bitangentWS = normalInputs.bitangentWS;
            output.viewDirWS = unity_OrthoParams.w == 0 ? GetCameraPositionWS() - positionInputs.positionWS : GetWorldToViewMatrix()[2].xyz;
            output.uv = input.texcoord;
            output.SH = SampleSH(lerp(normalInputs.normalWS,float3(0,0,0),_SHIntensity));
            return output;
        }

        float4 MainPS(UniversalVaryings input) : SV_Target
        {
            
            float4 mainTex = SAMPLE_TEXTURE2D(_BaseColorTex, sampler_LinearRepeat, input.uv);
            float3 baseColor = mainTex.rgb * _Color.rgb;
            float baseAlpha = 1.0;

            
            float3 normalWS = normalize(input.normalWS); 
            
            float3 pixelNormalWS = normalWS;
            if (_MaterialIDUSE == 0)
                {
                    // 使用自身法线
                    pixelNormalWS = normalWS;
                }
                else
                {
                    // 使用法线贴图

                float4 lightData = SAMPLE_TEXTURE2D(_NormalTex,sampler_NormalTex, input.uv);
                lightData = lightData * 2 - 1;
                //diffuseBias = lightData.z * 2;

                float sgn = input.tangentWS.w;
                float3 tangentWS = normalize(input.tangentWS.xyz);
                float3 bitangentWS = cross(normalWS, tangentWS) * sgn;

                float3 pixelNormalTS = float3(lightData.xy,0.0);
                pixelNormalTS.xy *= _BumpScale;
                pixelNormalTS.z = sqrt(1.0 - min(0.0, dot(pixelNormalTS.xy, pixelNormalTS.xy)));
                pixelNormalWS = TransformTangentToWorld(pixelNormalTS,float3x3(tangentWS,bitangentWS,normalWS));
                pixelNormalWS = normalize(pixelNormalWS);
            }

                //float3 baseColor = mainTex.rgb * _Color.rgb;
                 // 3. 定义 SurfaceData
                 SurfaceData surfaceData = (SurfaceData)0;
                surfaceData.albedo = baseColor;
                surfaceData.metallic = SAMPLE_TEXTURE2D(_ILMTex, sampler_ILMTex, input.uv).x * _MetallicIntensity;
                surfaceData.specular = kDielectricSpec.rgb;
                surfaceData.smoothness =  1 - SAMPLE_TEXTURE2D(_ILMTex, sampler_ILMTex, input.uv).y * _RoughnessIntensity;
                surfaceData.occlusion = SAMPLE_TEXTURE2D(_ILMTex, sampler_ILMTex, input.uv).z * _OcclusionIntensity;
                surfaceData.alpha = baseAlpha;
                surfaceData.emission = _Emission.rgb * _EmissionIntensity;
                surfaceData.clearCoatMask = 0.0;
                surfaceData.clearCoatSmoothness = 0.0;

                // URP 12+ 兼容
                #if defined(UNIVERSAL_PIPELINE_12_OR_NEWER)
                    surfaceData.diffuseAlpha = 1.0;
                #endif

                // URP 14+ 兼容
                #if defined(UNIVERSAL_PIPELINE_14_OR_NEWER)
                    surfaceData.geomNormalWS = input.normalWS;
                #endif

                BRDFData brdfData; // ✅ 正确声明
                InitializeBRDFData(surfaceData, brdfData);


            float3 positionWS = input.positionWSAndFogFactor.xyz;

            float4 shadowCoord = TransformWorldToShadowCoord(positionWS);
            Light mainLight = GetMainLight(shadowCoord);
            float3 lightDirWS = normalize(mainLight.direction);
            float3 lightDirectionWSFloat3 = lightDirWS;
            float3 halfDirWS = SafeNormalize(lightDirectionWSFloat3 + input.viewDirWS);
            //float NoH = saturate(dot(pixelNormalWS, halfDir));
            //half LoH = half(saturate(dot(lightDirectionWSFloat3, halfDir)));
            

            float3 lightColor = mainLight.color;
            float  NoL = saturate(dot(pixelNormalWS, halfDirWS));
            float stepNoL = smoothstep(0.0, 1, NoL);
            float HalfLambert = saturate(0.5 + 0.5 * stepNoL);
            //HalfLambert = pow(HalfLambert, 2.0);

            float ao = surfaceData.occlusion;
            //float3 ambient = CalculateAmbientLighting(brdfData, pixelNormalWS, input.viewDirWS, surfaceData.occlusion);
            //float HalfLambert = saturate(0.5 + 0.5 * stepNoL);


            float shadowMask = smoothstep(
            _ShadowThreshold - _ShadowSmoothness,
            _ShadowThreshold + _ShadowSmoothness,
            HalfLambert
        );

        //float  HalfLambertStep = smoothstep(0.2, 0.9, HalfLambert);
            // 
            float rampU = HalfLambert;
            float rampV = _RampThreshold;
            float3 rampColor = SAMPLE_TEXTURE2D(_RampTex, sampler_LinearClamp, float2(rampU, rampV)).rgb;

            float rampU2 = HalfLambert;
            //float2 rampUV2 = float2(step(HalfLambert , (1 - shadowMask)), 0.5);
            float rampV2 = _RampThreshold;
            float3 rampColor2 = SAMPLE_TEXTURE2D(_RampTex2, sampler_LinearClamp, float2(rampU, rampV)).rgb;

            float shadow = 1 - smoothstep(
    (1 - shadowMask) - _ShadowSmoothness, 
    (1 - shadowMask) + _ShadowSmoothness, 
    HalfLambert
);
            
            rampColor2 = lerp(rampColor2, float3(1,1,1), 0.7);
            rampColor2 *= shadow * 0.6;
            
            //rampColor2 = step(rampColor2,shadowMask);


            //half3 shadowColor = lerp(baseColor, baseColor * rampColor2, 1);

            half3 finRampColor = rampColor + rampColor2;

            //finRampColor = saturate(0.5 + 0.5 * finRampColor);

            



            //half3 shadowColor = lerp(baseColor, baseColor * finRampColor, _ShadowIntensity) * _ShaodwColor.rgb;
            //计算漫反射项
            //half3 diffuse = lerp(shadowColor, baseColor, HalfLambertStep);//明部到阴影是在0.423到0.460之间过渡的
            //diffuse = lerp(shadowColor, diffuse, );//将ILM贴图的g通道乘2 用saturate函数将超过1的部分去掉，混合常暗区域（AO）
            //diffuse = lerp(diffuse, baseColor, 1);//将ILM贴图的g通道减0.5乘2 用saturate函数将小于0的部分去掉，混合常亮部分（眼睛）
            //diffuse = diffuse + diffuse;
            float3 ambient = input.SH.rgb * _Ambientpower;
            ambient *= lerp(1, ao, _aoUsage);
            ambient = lerp(ambient, baseColor, _AmbientIntensity);

            float3 diffuse = finRampColor * baseColor * mainLight.color / PI;
            

            //float quantizedNdotL = floor(stepNoL * _RampThreshold * 4) / (_RampThreshold * 4);
            //float stepquantizedNdotL = smoothstep(0.0, 0.9 , quantizedNdotL);
            //float2 rampUV = float2(stepquantizedNdotL, 0.5);
            //float3 rampColor = SAMPLE_TEXTURE2D(_RampTex, sampler_LinearClamp, rampUV).rgb;

            //float3 directDiffuse = brdfData.diffuse * mainLight.color * finRampColor / PI;
            float3 directSpecular = DirectBRDF(brdfData, pixelNormalWS, -lightDirWS, input.viewDirWS) * mainLight.color * saturate(dot(pixelNormalWS, lightDirWS));

            //float3 ambient = UNITY_LIGHTMODEL_AMBIENT.rgb * baseColor;
            //float3 diffuse = directDiffuse + ambient;
            float3 specular = directSpecular;



            //float NoL = saturate(dot(pixelNormalWS, lightDirWS));
            //float HalfLambert = saturate(0.5 + 0.5 * NoL);
            //float3 diffuse = baseColor * HalfLambert * lightColor;


            //float3 diffuse = baseColor * NoL * lightColor;
            

            return float4(ambient,baseAlpha);
        }

        ENDHLSL

        Pass
        {
            Name "ShadowCaster"
            Tags { "LightMode" = "ShadowCaster" }
            ZWrite On
            ZTest LEqual
            Cull [_Cull]

            HLSLPROGRAM

            #pragma multi_compile_instancing
            #pragma multi_compile_DOTS_INSTANCING_ON

            #pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

            #pragma vertex vert
            #pragma fragment frag

            float3 _LightDirWS;
            float3 _LightPositionWS;
            //float _AlphaClip;

            //#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
           // #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"

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
                float3 positionWS = TransformObjectToWorld(IN.positionOS.xyz);
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

            Varyings vert(Attributes input)
            {
                Varyings output;
                output.uv = input.texcoord;
                output.positionCS = TransformObjectToHClip(input.positionOS.xyz);
                return output;
            }

            float4 frag(Varyings input) : SV_TARGET
            {
                clip(1.0 - _AlphaClip);
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

            #pragma multi_compile_instancing
            #pragma multi_compile_DOTS_INSTANCING_ON

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
            };

            struct Varyings
            {
                float4 positionCS : SV_POSITION;
            };

            //float _AlphaClip;

            Varyings vert(Attributes input)
            {
                Varyings output;
                output.positionCS = TransformObjectToHClip(input.positionOS.xyz);
                return output;
            }

            float4 frag(Varyings input) : SV_TARGET
            {
                clip(1.0 - _AlphaClip);
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

            #pragma multi_compile_instancing
            #pragma multi_compile_DOTS_INSTANCING_ON

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

            //float _AlphaClip;

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
                ZWrite On
                ZTest LEqual
                Cull [_Cull]
                //  Stencil
                //  {
                //      Ref [_StencilRef]
                //      Comp [_StencilComp]
                //      Pass [_StencilPassOp]
                //      Fail [_StencilFailOp]
                //      ZFail [_StencilZFailOp]
                //  }

            HLSLPROGRAM

            #pragma shader_feature_local _SCREEN_SPACE_RIM
            #pragma shader_feature_local _SCREEN_SPACE_SHADOW
            #pragma shader_feature_local _MATCAP_ON

            #pragma vertex MainVS
            #pragma fragment MainPS

            #pragma multi_compile_fog

            ENDHLSL
            }

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

            //sampler2D _BaseColorTex;;
            float _OutLineWidth;
            float _MaxOutlineZoffset;
            float4 _OutlineColor;
            //float _MaterialIDUSE; // 添加材质ID变量
            //float4 _OutlineColor2;
            //float4 _OutlineColor3;
            //float4 _OutlineColor4;
            //float4 _OutlineColor5;
            //TEXTURE2D(_OtherDataTex);
            //SAMPLER(sampler_OtherDataTex);
            
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
                // float4 otherData = SAMPLE_TEXTURE2D(_OtherDataTex, sampler_OtherDataTex, input.uv);
                // int materialid = max(0,4 - floor(otherData.x *5)); // 将 x 通道值映射到 0-5的整数范围
                // outlineColor = select(materialid, _OutlineColor.rgb, _OutlineColor2.rgb, _OutlineColor3.rgb, _OutlineColor4.rgb, _OutlineColor5.rgb);
                

                //float3 baseMapColor = SAMPLE_TEXTURE2D(_BaseColorTex, sampler_LinearRepeat, input.uv);
                outlineColor *= 0.4;

                float4 color = float4(outlineColor,1);
                color.rgb = MixFog(color.rgb, input.fogFactor);

                return color;
                //return float4(baseMapColor,1);
            }
            ENDHLSL
        }

            
        }
        Fallback "Diffuse"
    }

        
