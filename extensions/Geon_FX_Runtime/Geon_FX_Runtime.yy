{
    "id": "fce837eb-2646-4bbc-ba65-320a6b5ee558",
    "modelName": "GMExtension",
    "mvc": "1.2",
    "name": "Geon_FX_Runtime",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": -1,
    "date": "2018-30-30 05:04:06",
    "description": "",
    "exportToGame": true,
    "extensionName": "",
    "files": [
        {
            "id": "e41b22fc-1827-46ed-8140-2b6967b28a43",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": -1,
            "filename": "geon_fx_runtime.gml",
            "final": "geon_system_destroy",
            "functions": [
                {
                    "id": "f02e49ad-25ef-416e-9952-a95206dec274",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        1,
                        2,
                        2,
                        2
                    ],
                    "externalName": "",
                    "help": "geon_effect_add(fname, ps, [sprite_array], [ps_add])",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_effect_add",
                    "returnType": 2
                },
                {
                    "id": "f2476590-b52a-4b91-a671-73dccaa9f43e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "",
                    "help": "geon_effect_add_to_list(effect_map)",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_effect_add_to_list",
                    "returnType": 2
                },
                {
                    "id": "2958c73a-8e93-494b-b4c3-c01425be1882",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "",
                    "help": "geon_effect_burst(effect_ind, x, y, [dir, gravdir, speed, gravity])",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_effect_burst",
                    "returnType": 2
                },
                {
                    "id": "3a75d598-0a6a-4a77-8ffc-9cf21cf0a864",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "",
                    "help": "geon_effect_delete(effect_ind, clear_pt)",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_effect_delete",
                    "returnType": 2
                },
                {
                    "id": "24d1ffb8-a5e8-4704-b80b-1d75fdf0d872",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "",
                    "help": "geon_effect_id(fname)",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_effect_id",
                    "returnType": 2
                },
                {
                    "id": "ac22b0bc-66f3-4035-9740-0a693fe46773",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "",
                    "help": "geon_effect_init(effect_system_map, effect_map, effect_index, ps)",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_effect_init",
                    "returnType": 2
                },
                {
                    "id": "ac75b6ad-f7c8-4dba-84e9-4d474ae66d6e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "",
                    "help": "geon_effect_is_streamed(effect_ind)",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_effect_is_streamed",
                    "returnType": 2
                },
                {
                    "id": "4dfc5ec0-aad4-4175-8eee-3fc0f36e8e69",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "",
                    "help": "geon_effect_read(fname, ps)",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_effect_read",
                    "returnType": 2
                },
                {
                    "id": "6964926c-6cc0-439f-82af-c61789b0e53f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "",
                    "help": "geon_effect_stream(effect_ind, x, y, enable, [dir,gravdir,speed,grav]);",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_effect_stream",
                    "returnType": 2
                },
                {
                    "id": "b1845944-f090-4dc9-90db-b2c3dc83a0bc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1,
                        2
                    ],
                    "externalName": "",
                    "help": "geon_string_parse(string, delimiter, part)",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_string_parse",
                    "returnType": 1
                },
                {
                    "id": "fb6210ef-ee8d-419a-865c-0ea0ba563104",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "",
                    "help": "geon_system_destroy()",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_system_destroy",
                    "returnType": 2
                },
                {
                    "id": "d712b243-a8dd-496e-880d-26d09d9f7b7a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        2
                    ],
                    "externalName": "",
                    "help": "geon_system_init([ps])",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_system_init",
                    "returnType": 2
                },
                {
                    "id": "c49f24a7-e4a6-4d6d-9c75-7d816c8c6504",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "",
                    "help": "geon_sin_shift(amplitude, period, phase, half)",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_sin_shift",
                    "returnType": 2
                },
                {
                    "id": "7ca46af1-3acc-4337-8899-a929c9a3f0df",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "",
                    "help": "geon_effect_copy(effect_ind, [ps]);",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_effect_copy",
                    "returnType": 2
                },
                {
                    "id": "f29731f9-8d1e-4ba3-af1d-96fb91f2f3c6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "",
                    "help": "geon_real(value)",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_real",
                    "returnType": 2
                },
                {
                    "id": "2819c0d9-790b-4dc1-9066-4dba577b1341",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "",
                    "help": "geon_tracel(value,...)",
                    "hidden": false,
                    "kind": 2,
                    "name": "geon_trace",
                    "returnType": 1
                }
            ],
            "init": "geon_system_init",
            "kind": 2,
            "order": [
                "d712b243-a8dd-496e-880d-26d09d9f7b7a",
                "fb6210ef-ee8d-419a-865c-0ea0ba563104",
                "f02e49ad-25ef-416e-9952-a95206dec274",
                "f2476590-b52a-4b91-a671-73dccaa9f43e",
                "2958c73a-8e93-494b-b4c3-c01425be1882",
                "3a75d598-0a6a-4a77-8ffc-9cf21cf0a864",
                "24d1ffb8-a5e8-4704-b80b-1d75fdf0d872",
                "ac22b0bc-66f3-4035-9740-0a693fe46773",
                "ac75b6ad-f7c8-4dba-84e9-4d474ae66d6e",
                "4dfc5ec0-aad4-4175-8eee-3fc0f36e8e69",
                "6964926c-6cc0-439f-82af-c61789b0e53f",
                "b1845944-f090-4dc9-90db-b2c3dc83a0bc",
                "c49f24a7-e4a6-4d6d-9c75-7d816c8c6504",
                "7ca46af1-3acc-4337-8899-a929c9a3f0df",
                "f29731f9-8d1e-4ba3-af1d-96fb91f2f3c6",
                "2819c0d9-790b-4dc1-9066-4dba577b1341"
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": null,
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "options": null,
    "optionsFile": "options.json",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "supportedTargets": -1,
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": null,
    "tvosdelegatename": null,
    "tvosmaccompilerflags": null,
    "tvosmaclinkerflags": null,
    "tvosplistinject": null,
    "version": "1.0.0"
}