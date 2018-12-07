# RoombaAttack
The main project for the semester: A game built in Godot that is a 2D, maze-like, Pac-Man-like Game.

How to Run:

Download or Clone our project (From the development branch (to see current work) or main (for the most recent 'stable' build).

Option 1: 
         
         1.) Install Godot from: https://godotengine.org/download/windows (select the tab for which OS you're running)
             NOTE: we've been using MAC OS and Windows for our project -- both of those have been confirmed to work.

         2.) Once installed, run the Godot.exe
         3.) When Godot opens, select "Import project" or "Import"
         4.) Navigate to where our project has been downloaded (and unzipped if necessary), then select the "project.godot" file.
         5.) Once the project has loaded, you can press the "Play button" at the top of the Godot Window to run the project.
         
Option 2:
         
         1.) In the location that the project has been downloaded, run the .exe file of the game -- should be the most recent, "stable" build.

                                                         Project Status
    Note: These are Project based Tasks, any tasks done that are not in the project will not be listed (ex. Research/ProjectPlanning).

Sprint 1: ---------------------------------------------------------------------------------------------------------------------------------

          Completed Tasks:
                  1.) Added Basic Player/Mob Assets (Sprite/Spritesheet) -- Porter (Merged in PlayerAnimation branch due to dev        
                                                                                    complications).
                  2.) Implemented Player Animation -- Ramsey
                  3.) Implementd Player Hitbox -- Ramsey
                  4.) Added Basic Scene asset(s) -- Brianna
                  5.) Implemented Play Area Bounds -- Brianna
                  6.) Implemented Timer and Positioning -- Nash
                  7.) Implemented Pause Feature -- Ian
                  8.) Implemented Close Game Feature -- Ian
                  
          Future Tasks:
                  1.) Implement Player Health -- Porter
                  2.) Implement Enemy(Hitbox/Movement)  -- Ramsey
                  3.) Create Additional Levels -- Brianna
                  4.) Add additional assets (SFX/BGM/Consumables) -- Nash
                  5.) Create Game Manager(Lose Condition/Level Transitioning) -- Ian
                  
                  
                  
Sprint 3(for last assignment : --------------------------------------------------------------------------------------------------------------------------------
                  Completed Tasks:
                  1.) I added a sound effect for when the player eats/gets to the cookie. I also added the background soundtrack and sound                       for collision with the roomba(however the collision detection did not work so this sound did not play). The work I                         did is included in the EndPosition.tscn and EndPosition.gd. Some of these aditions also went into the main.gd and                           main.tscn. Lastly, I added code to the Player.tscn and Player.gd. All of these edits and changes were pushed to the                         Audio branch. I improved from sptint 2 primarily in time managment. I was more aware of the lack of documentation on 		       Godot so I was more prepared to spend a larger amount of time on research. I think the only thing that showd this 		       improvement was my ability to get more tasks in progress or finished earlier in the sprint than in sprint two.                             --Ramsey 
                  
Completed Tasks: - Nash
2.) For sprint three I helped implement the food item into the game and added two separate labels to the player scene, one that indicated the players health and one that indicated the players score. The players score decreases the longer that it takes the player to complete each level, thus creating an incentive to complete every level as fast as possible. The food item, when picked up by the player, increases the players health by one, giving the player an extra life against the Roomba. This all included additions to the main.tscn and main.gd, as well as additions to the Player.tscn and Player.gd. Additions were also made to the finalPosition.gd and .tscn to attempt to accumulate the final score however this functionality has been unsuccessful thus far.

Completed Tasks- Ian: For sprint three, I built the Roomba Mob in RoombaMob.tcsn, I then fleshed out the scripts in both RoombaMob and Base Roomba mob, to add flexibility and features as movement and pathing. I then added the script of roomba operation into main, and placed roombas in the varios levels

Completed Tasks: Brianna
For sprint three I created the design of the 5 different levels and implemented the changing between each level when the player gets to the cookie. I created collision boxes for items in each room so that the player and roombas had increasingly more difficult areas to move around. I also made sure the pause button feature was working on every level of the game. The majority of my additions are in the PausePanel.gd, LevelMap.tscn, EntryWayLevel.tscn, Kitchen Level.tscn, and Living Room Level.tscn. Sprint three was much smoother than sprint two because most of the research had been done and the majority of my hours were implementing code instead of reasearching.

Porter(Dec. 6, 2018): Implemented PlayerHealth, Foodhealth, and Collision detection for the player.
	Branch: PlayerHealth (this ended several different features to do patches that needed to be
		done for continuous development)
		***All of these changes are also in the development branch and master branch***
	SourceCode: res/Scripts/EntityClass.gd
-	This is the base class that other entities, like the player and the FoodItem, inherit from. Contains health variables and getter/setter functionality
res/Scripts/Player.gd 
-	This is the script attached to the player gameObject (aka the player the user plays as). This script contains functionality for detecting other tagged gameobjects (food/Roomba), functionality for incrementing and decrementing their health, and the necessary functions that GoDot requires (_ready()/_process()/etc).
         Rest/Scripts/BasicFoodClass.gd
-	This class is the BaseFood class. It inherits from the BasicEntity class and specializes it for Food Items by adding a food “TYPE” and Intialization methods for the food item(s).








TEAM QUESTIONS/ANSWERS:
What went well?
— We got several new level maps up and a full story line 
— We have game audio.
— We have a end game scene added to the end of the game. 
— Pause functionality is fully working
— There is a “working” moving roomba enemy.
— There is a health bar and score counter included after this sprint. 

What is impeding us from doing better?
— Godot does not have much documentation available. This made much of the tasks we hoped to complete harder to fo because we did not have an easy access to information. 

What can we do to mprove?
— We could improve on the roomba’s movement seeing as it is sporadic. 
— Fixing the hitbox on the roomba so that the collisions would be registered and the health would be lowered and the collision sound would play. 
