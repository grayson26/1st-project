package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var box:FlxSprite;

	var ground:FlxSprite;

	var note:FlxSprite;

	override public function create()
	{
		trace("coolmessage"); // adds message to console

		box = new FlxSprite(200, 200); // moves sprite (x, y)
		box.loadGraphic('assets/images/sonic.png'); // loads sonic oo
		add(box); // puts box on da screen babyyy

		ground = new FlxSprite(0, 400); // ground pos
		ground.makeGraphic(FlxG.width, 10); // makes graphic of ground and how long it will be
		ground.color = FlxColor.BLUE;
		add(ground); // adds the ground to the game

		ground.immovable = true; // the object will not be 'pushed' if another object collides with it

		FlxG.sound.playMusic('assets/music/hello.mp3');

		trace(FlxG.height); // tells me the height of the box
		trace(FlxG.width); // tells me the width of the box

		box.angularDrag = 500;
		box.maxAngular = 1000;
		// box.acceleration.y = 600; // ! add slash!!!!!!!

		super.create();
	}

	override public function update(elapsed:Float)
	{
		bgColor = 0xFFFF0000; // 0x, FF, FF, 00, 00

		// 0 1 2 3 4 5 6 7 8 9 (10 bit) 0 1 2 3 4 5 6 7 8 9 A B C D E F (16 bit)

		super.update(elapsed);

		FlxG.collide(box, ground); // checks if 2 objects collided, and calls the function `callback` if they do

		// 1 x 2 = 2
		// 1 * 2 = 2
		// 4 devide 2 = 2
		// 4 / 2 = 2

		FlxG.watch.addQuick("music time!", FlxG.sound.music.time);

		if (FlxG.keys.justPressed.P)
		{
			FlxG.sound.music.pause();
		}

		if (FlxG.keys.justPressed.O)
		{
			FlxG.sound.music.play();
		}

		if (FlxG.keys.pressed.SPACE)
		{
			box.angularAcceleration = 200;
		}
		else
		{
			box.angularAcceleration = 0;
		}

		movement();

		if (box.x > FlxG.width * 0.4) // if the box is pass 300? if chages to blue
		{
			box.color = FlxColor.BLUE;
		}
		else // if the box is not pass 300 then it is white
		{
			box.color = FlxColor.WHITE;
		}
	}
}

function movement():Void // why wont function work i give up here i guedssd lmaoo
{
	// if (FlxG.keys.justPressed.UP)
	//	box.velocity.y -= 300;

	if (FlxG.keys.pressed.RIGHT) // if i press right arrow it makes da box move right
	{
		moveBox(1);
		box.flipX = false;
	}

	if (FlxG.keys.pressed.LEFT) // if i press left arrow it makes the box move left
	{
		moveBox(-1);
		box.flipX = true;
	}
}

function moveBox(xPosition:Float = 0)
{
	// trace(xPosition);
	box.x += xPosition;
}
} // what we want to dooooo
//
// make scrolling note and sync with MUSIC
//
//
//
// INT
// Int is a whole number, and it has to be a whole number can't be 4.1
// 1, 23, -3000, -903840938, 893084093 --INT
// Float
// Float is something that has decimal place, long story short.
// 0.3, 1.4545445, 485948594859.1, 1, 984839 -- Float
// Bool
// Bool is on/off
// true, false --bool
// Update
// Update runs every frame if game runs 60 fps it would run 60 time per sec
//
// kinda confused rn uhgurwhgiudsjgoiufdsjgoiufoiufdg
