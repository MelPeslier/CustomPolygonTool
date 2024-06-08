# ![](addons/custom_polygon_tool/icons/cpt_icon.png) CustomPolygonTool
- It was made with the intent of reusing the already existing nodes in Godot.
- It have the goal to be customizable by the user.
- It adopt a new approach to mapping your material to your polygons.

![](git_images/scene_examples/demo_01.png)

## ![](addons/custom_polygon_tool/icons/cpt_icon.png) CPT
**Don't** instantiate it, it's only the base class, nothing will happen.
### Features
- Use the regular polygon tools provided by Godot to edit the shape
![](git_images/cpt_examples/modify.png)

| Main Options | Description |
|-|-|
| ![](git_images/cpt_examples/cpt_options_00.png) |   |

### ![](addons/custom_polygon_tool/icons/cpt_terrain_icon.png) CPT_Terrain
Create **how many** you want per scenes, create your shape, customize it by adding your own shader or modifying the existing one, and there you have a static ground !

### ![](addons/custom_polygon_tool/icons/cpt_craft_icon.png) CPT_Craft
![](git_images/cpt_examples/cpt_craft_setup.png)
- **Only one** per scene, it's used to be added as a child of an ObjectCollision2D (CharacterBody, StaticBody, AnimatableBody)
- Add your own scripts to the parent, and customize his behavior !

## Material

- There is a lot of usefull options in the shader.
- I encourage you to test them out to see what they do !

### Features

#### Use the power of SDF
> Using the generated signed distance field from every [LightOccluder2D](https://docs.godotengine.org/en/stable/classes/class_lightoccluder2d.html#lightoccluder2d) by Godot.
Here, there is 4 different polygons, but yes, thanks to distance fields, they fit each others, and the outline stay where it need !

![](git_images/mat_examples/use_sdf.png)

#### Map any images to your terrain
| Like this | Not like this |
|-|-|
| ![](git_images/scene_examples/demo_02.png) | ![](git_images/scene_examples/demo_03.png)



