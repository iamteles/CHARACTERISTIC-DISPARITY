package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import openfl.Assets;
import editors.MasterEditorMenu;

using StringTools;

class MainMenuState extends MusicBeatState
{
	var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	var menuItemsDescription:FlxTypedGroup<FlxText>;

	public static var psychEngineVersion:String = '0.6.3';
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		#if MODS_ALLOWED 'mods', #end
		#if ACHIEVEMENTS_ALLOWED 'awards', #end
		'credits',
		'options'
	];
	
	var optionShitDescription:Array<String> = ['PLAY THE STORY MODE WEEKS', 'PLAY ANY SONG IN THE MOD', 'THE PEOPLE WHO MADE THE MOD', 'CHANGE STUFF IN THE GAME'];
	
	
	var rightArrow:FlxSprite;
	var leftArrow:FlxSprite;

	var logoBl:FlxSprite;

	var bg:FlxSprite;

	var text:FlxText;

	//var newColorForBG:FlxColor;
	

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;
		
		//newColorForBG = new FlxColor();

		bg = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.18;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

		// magenta.scrollFactor.set();

		logoBl = new FlxSprite(0, 70);
		logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
		logoBl.antialiasing = true;
		logoBl.animation.addByPrefix('bump', 'logo', 24);
		logoBl.animation.play('bump');
		logoBl.setGraphicSize(Std.int(logoBl.width * 0.825));
		logoBl.updateHitbox();
		logoBl.screenCenter(X);
		add(logoBl);

		leftArrow = new FlxSprite(282, 562);
		leftArrow.frames = Paths.getSparrowAtlas('campaign_menu_UI_assets');
		leftArrow.animation.addByIndices('idle', "arrow left", [0], "", 24, true);
		leftArrow.animation.addByIndices('pressed', "arrow push left", [0], "", 24, true);
		leftArrow.animation.play('idle');
		add(leftArrow);

		rightArrow = new FlxSprite(940, 562);
		rightArrow.frames = Paths.getSparrowAtlas('campaign_menu_UI_assets');
		rightArrow.animation.addByIndices('idle', "arrow right", [0], "", 24, true);
		rightArrow.animation.addByIndices('pressed', "arrow push right", [0], "", 24, true);
		rightArrow.animation.play('idle');
		add(rightArrow);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite(0, 538);
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.7));
			menuItem.screenCenter(X);
			menuItems.add(menuItem);
			menuItem.scrollFactor.set();
			menuItem.antialiasing = true;
			menuItem.alpha = 0;			
		}

		var versionShit:FlxText = new FlxText(5, FlxG.height - 36, 0, "Funkin v" + Application.current.meta.get('version') , 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		var engineVersionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, "Psych Engine v0.6.3", 12);
		engineVersionShit.scrollFactor.set();
		engineVersionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(engineVersionShit);

		

		//curWacky = FlxG.random.getObject(getIntroTextShit());

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		super.create();
	}


	var selectedSomethin:Bool = false;

	override function beatHit()
	{
		super.beatHit();

		if(logoBl != null)
			logoBl.animation.play('bump', true);
	}

	override function update(elapsed:Float)
	{

		//bg.color = newColorForBG;

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (!selectedSomethin)
		{
			if (FlxG.keys.justPressed.LEFT)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), 1, false);

				changeItem(-1);
			}

			if (FlxG.keys.justPressed.RIGHT)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), 1, false);
				changeItem(1);
			}

			if (FlxG.keys.justPressed.SEVEN)
			{
				MusicBeatState.switchState(new MasterEditorMenu()); //COMMENT THIS LATER 
			}

			if(FlxG.keys.pressed.LEFT)
			{
				leftArrow.animation.play("pressed");
			}
			else
			{
				leftArrow.animation.play("idle");
			}

			if(FlxG.keys.pressed.RIGHT)
			{
				rightArrow.animation.play("pressed");
			}
			else
			{
				rightArrow.animation.play("idle");
			}

			if (controls.BACK)
			{
				FlxG.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									#if MODS_ALLOWED
									case 'mods':
										MusicBeatState.switchState(new ModsMenuState());
									#end
									case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										LoadingState.loadAndSwitchState(new options.OptionsState());
								}
							});
						}
					});
				
			}
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.screenCenter(X);
			
		});
		
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected)
			{

				spr.animation.play('selected');
				spr.alpha = 1;

			}
			else
			{
				spr.alpha = 0;
			}

			spr.updateHitbox();
		});
		
	}
}