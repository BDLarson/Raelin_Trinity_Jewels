;;;; -*- Mode: LISP; Syntax: Common-lisp; Package: USER; Base: 10 -*-
;;;; Name: Blake Larson    Date: 4/12/17
;;;; Course: ICS313        Assignment: 6 (Project)
;;;; File: Blake76.lisp

;;; This parameter creates the nodes based on each room.
(defparameter *nodes* '((Home (you are in your tree-house home.
                           Birds are chirping songs but a dark storm is approaching.
                           You pickup your sword as well as your shield.))
                        (Village (you are in your home village.
                           The dark storm lingers in the distance.))
                        (Sisters-Home (you are in your sisters home.
                           The place looks ransacked with a her journal torn open.
                           You can see a note scribbled on the inside of the journal.
                           The note explains that your sister has been kidnapped
                           by the shadowy king!))
                        (Village-Gate (you are at the front gate of the village.
                           Guards are standing by as the gate seems to be broken in.))
                        (Forest-Path (you are in the forest outside the village.
                           Animals are running in what seems to be a panic.))

                        (Forest-Fork (you have come to a fork in the road.
                           There are some bandits roaming around.))

                        (Deep-Forest (you are in a deep dark forest behind the village.
                           Spiders can be seen roaming the canopy.
                           A giant old tree lays before you.))
                        (Old-Tree (you are at the face of the giant old tree.
                           As you approach the tree an opening emerges.))
                        (Tree-Atrium (You are in the dark atrium of the old tree.
                           You can see what looks to be a giant door with a lock on it.))
                        (Tree-Dungeon (You are in the creepy dungeon.
                           You fight off some spiders to reach a tiny bronze chest.))
                        (Bronze-Chest (You open the chest to find a slingshot!
                           You pickup some small rocks around you.))
                        (Tree-Upstairs (You walk up the stairs to find a large spider.
                           You defeat the spider using your slingshot.
                           You see a chest behind the spiders web.))
                        (Tree-MChest (you hack away the spiders web.
                           You open the chest to reveal a master key!))
                        (Tree-Boss (you have reached a very dark chamber.
                           A massive spider reveals itself!))
                        (Green-Chest (You lift open the giant green chest.
                           A glimmering green jewel appears!))

                        (Winding-Road (you are making the trek up the large volcano.
                           The heat is extremely hot!
                           Large birds are circling the top of the mountain.))
                        (Dark-Cave (you are in a very hot dark cave.
                           Lava is flowing along the side of the cave.
                           There is a large spiral staircase behind a tall rodiron gate.))
                        (Volcano-Falls (you are in a large section of the volcano.
                           A huge lava falls is present.
                           You see a swarm of bats defeating them with your sword.
                           A small silver chest lies on a lone rock.))
                        (Silver-Chest (you open the chest to find some bombs!
                           The earth trembles from the volcanic activity.))
                        (Stepping-Stones (you are on a large rock in the middle of the falls.
                           Multiple rocks lead to a chest on the otherside.))
                        (Volcano-MChest (you leap onto the final rock to lift open the chest.
                           You find a master key lying inside!))
                        (Volcano-Boss (you climb to the top of the volcano to bubbling lava with open air.
                           A molten dragon appears spewing rocks off the mountain!))
                        (Red-Chest (You lift open the giant red chest.
                           A glimmering red jewel appears!))

                        (Sandy-Road (you are walking through the sandy path that leads to the ocean.
                           Seagulls are flying in the opposite direction.
                           A large pipe is sticking out of the water.))
                        (Underwater-Tunnel (you are walking through the tunnel to a giant dome.
                           There is a porthole on the ground with a massive lock on it.))
                        (Ocean-Dome (you enter the underwater dome.
                           Large pirahnas are circling a small gold chest.
                           You toss bombs into the water killing them.))
                        (Gold-Chest (you open the chest to find a bow n arrow!
                           You grab some arrows that are floating nearby.))
                        (Underwater-Cavern (you have swam down below the surface into a cavern.
                           You defeat some large eels with your bow.
                           A chest is spotted sitting at the bottom.))
                        (Ocean-MChest (you swim to the bottom of the caver to lift open the chest.
                           You find a mster key lying inside!))
                        (Ocean-Boss (You climb into what looks to be a giant fishbowl.
                           A huge shark leaps out of the water eatting the smaller fish in sight!))
                        (Blue-Chest (You lift open the giant blue chest.
                           A glimmering blue jewel appears!))

                        (Shadowy-Path (you are walking on a path that looks like dark clouds.
                           A large temple is present.
                           A dark Castle is seen in the distance.))
                        (Temple-Alter (you are in the temple standing at the alter.
                           Three carved spots are present on the alter.))
                        (Dark-Castle (you have entered the dark castle.
                           The shadow king has made his presense known!))))

;;; This parameter creates the edges of the room paths.
(defparameter *edges* '((Home (Village outfront door))
                        (Village (Home west front-door)
                                 (Sisters-Home east front-door)
                                 (Village-Gate north path))
                        (Sisters-Home (Village outfront door))
                        (Village-Gate (Village south path))
                        (Forest-Path (Forest-Fork north path))

                        (Forest-Fork (Forest-Path south path)
                                     (Deep-Forest south-west path)
                                     (Winding-Road west path)
                                     (Sandy-Road east path)
                                     (Shadowy-Path north path))

                        (Deep-Forest (Forest-Fork north-east path)
                                     (Old-Tree ahead path))
                        (Old-Tree (Deep-Forest behind path)
                                  (Tree-Atrium ahead opening))
                        (Tree-Atrium (Old-Tree behind opening)
                                     (Tree-Dungeon west door)
                                     (Tree-Upstairs upstairs staircase))
                        (Tree-Dungeon (Tree-Atrium east door)
                                      (Bronze-Chest ahead path))
                        (Bronze-Chest (Tree-Dungeon behind path))
                        (Tree-Upstairs (Tree-Atrium downstairs staircase)
                                       (Tree-MChest ahead path))
                        (Tree-MChest (Tree-Upstairs behind path))
                        (Tree-Boss)
                        (Green-Chest)

                        (Winding-Road (Forest-Fork east path)
                                      (Dark-Cave ahead path))
                        (Dark-Cave (Winding-Road behind path)
                                   (Volcano-Falls west path))
                        (Volcano-Falls (Dark-Cave east path)
                                       (Silver-Chest ahead path)
                                       (Stepping-Stones west path))
                        (Silver-Chest (Volcano-Falls behind path))
                        (Stepping-Stones (Volcano-Falls east path)
                                         (Volcano-MChest ahead path))
                        (Volcano-MChest (Stepping-Stones behind path))
                        (Volcano-Boss)
                        (Red-Chest)

                        (Sandy-Road (Forest-Fork west path)
                                    (Underwater-Tunnel ahead tunnel))
                        (Underwater-Tunnel (Sandy-Road behind tunnel)
                                           (Ocean-Dome west path))
                        (Ocean-Dome (Underwater-Tunnel east path)
                                    (Underwater-Cavern underwater path)
                                    (Gold-Chest ahead path))
                        (Gold-Chest (Ocean-Dome behind path))
                        (Underwater-Cavern (Ocean-Dome up path)
                                           (Ocean-MChest ahead path))
                        (Ocean-MChest (Underwater-Cavern behind path))
                        (Ocean-Boss)
                        (Blue-Chest)

                        (Shadowy-Path (Forest-Fork south path)
                                      (Temple-Alter west temple-door)
                                      (Dark-Castle north road))
                        (Temple-Alter (Shadowy-Path east temple-door))
                        (Dark-Castle (Shadowy-Path south road))))

;;; This parameter is used to track the user current position in the game.
(defparameter *location* 'Home) ; Sets starting location to your home.

;;; This parameter creates the objects.
(defparameter *objects* '(note slingshot forest-key emerald-jewel
                          mini-bombs volcano-key ruby-jewel bow ocean-key
                          sapphire-jewel))

;;; This parameter links objects to their respective location.
(defparameter *object-locations* '((note Sisters-Home)
                                   (slingshot Bronze-Chest)
                                   (forest-key Tree-MChest)
                                   (emerald-jewel Green-Chest)
                                   (mini-bombs Silver-Chest)
                                   (volcano-key Volcano-MChest)
                                   (ruby-jewel Red-Chest)
                                   (bow Gold-Chest)
                                   (ocean-key Ocean-MChest)
                                   (sapphire-jewel Blue-Chest)))

;;; This parameter defines the commands that are allowed in the game.
(defparameter *allowed-commands* '(look walk pickup inventory help h ?))

;;; this macro will add a path from two different locations in the world.
(defmacro add-path (newPath exLocation1 exLocation2 wayType dirTo &optional dirFrom)
  ;Add to 2 locations (Do the locations exist?)
  ;Define 1 way path and 2 way paths
  `(cond
      ((member ,exLocation1 (mapcar #'car *nodes*));If: first exists
        (cond
          ((member ,exLocation2 (mapcar #'car *nodes*)) ;If: second exists
            (cond
              ((eql 1 ,wayType) ;(princ "One way path selected!")
                (progn (pushnew (list ,exLocation2 ,dirTo ,newPath) (cdr (assoc ,exLocation1 *edges*)))))
              ((eql 2 ,wayType) ;(princ "Two way path selected!")
                (and
                  (progn (pushnew (list ,exLocation2 ,dirTo ,newPath) (cdr (assoc ,exLocation1 *edges*))))
                  (progn (pushnew (list ,exLocation1 ,dirFrom ,newPath) (cdr (assoc ,exLocation2 *edges*))))))
              (t (princ "Path type isn't correct"))
            )
          )
          (t (princ "The second location doesn't exist!")) ;Else second doesn't exist
        )
      )
      (t (princ "The first location doesn't exist!")) ; Else: first doesn't exist
   )
)



;;; This function describes each location that the user is currently in.
(defun describe-location (location nodes)
    (cadr (assoc location nodes)))

;;; This function describes each edge the user can use from their location.
(defun describe-path (edge)
    `(there is a ,(caddr edge) going ,(cadr edge) from here.))

;;; This function describes multiple edges from the user's current location.
(defun describe-paths (location edges)
    (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

;;; This function lists the objects visible at a given location.
(defun objects-at (loc objs obj-locs)
    ;; Following: lists the objects at the specific location.
    (labels ((at-loc-p (obj)
        (eq (cadr (assoc obj obj-locs)) loc)))
    (remove-if-not #'at-loc-p objs)))

;;; This function describes the objects visible at a given location.
(defun describe-objects (loc objs obj-loc)
    ;; Following: lists the description of objects at the specific location.
    (labels ((describe-obj (obj)
        `(you see a ,obj on the floor.)))
    (apply #'append (mapcar #'describe-obj (objects-at loc objs obj-loc)))))
    ;; Above: appends multiple objects to the output

;;; This function will be used to describe the location, paths, and objects.
(defun look()
    ;; Following: Output for location, paths, and objects for specific location.
    (append (describe-location *location* *nodes*)
            (describe-paths *location* *edges*)
            (describe-objects *location* *objects* *object-locations*)))

;;; This function allows the user to walk to different locations.
(defun walk (direction)                 ; Parameter is a specific direction.
  (let ((next (find direction           ; Locates path with specific direction.
    (cdr (assoc *location* *edges*))    ; Locates paths in edges table.
    :key #'cadr)))
  (if next                              ; The next variable isn't nill.
    (progn (setf *location* (car next)) ; Set location to new location.
           (look))
    '(you cannot go that way.))))       ; Wrong location throws error.

;;; This function allows the user to pickup objects in different locations.
(defun pickup (object)
  (cond ((member object                 ; Checks whether the object is present.
                (objects-at *location* *objects* *object-locations*))
                ; Above: Generates the objects at the current location.
        (push (list object 'body) *object-locations*) ; Push new item on list.
         `(you are now carrying the ,object))         ; Success statement!
        (t '(you cannot get that.))))                 ; Fail statement!

;;; This function allows the user to check their inventory of picked-up items.
(defun inventory()
  ;; Lists inventory "items- (object)"
  (cons 'items- (objects-at 'body *objects* *object-locations*)))

;;; This function checks whether user has a specified object in their inventory.
(defun have (object)
  (member object (cdr (inventory)))) ; Checks if object is member of inventory.

;;; This function defines the REPL of the game.
(defun game-repl ()
  (let ((cmd (game-read)))
    (unless (eq (car cmd) 'quit)
      (game-print (game-eval cmd))
      (game-repl))))

;;; This function reads in the user's commands via a REPL.
;;; This allows users to not need parentheses when inputting commands.
(defun game-read()
  (let ((cmd (read-from-string (concatenate 'string "(" (read-line) ")"))))
    (flet ((quote-it (x)
          (list 'quote x)))
      (cons (car cmd) (mapcar #'quote-it (cdr cmd))))))

;;; This function evaluates the given command with the allowed commands.
(defun game-eval (sexp)
  (if (member (car sexp) *allowed-commands*)
    (eval sexp)
    '(i do not know that command.)))

;;; This function does something.
(defun tweak-text (lst caps lit)
  (when lst
    (let ((item (car lst))
          (rest (cdr lst)))
      (cond ((eql item #\space) (cons item (tweak-text rest caps lit)))
            ((member item '(#\! #\? #\.)) (cons item (tweak-text rest t lit)))
            ((eql item #\") (tweak-text rest caps (not lit)))
            (lit (cons item (tweak-text rest nil lit)))
            (caps (cons (char-upcase item) (tweak-text rest nil lit)))
            (t (cons (char-downcase item) (tweak-text rest nil nil)))))))

;;; This function displays output to the REPL.
(defun game-print (lst)
  (princ (coerce (tweak-text (coerce (string-trim "() " (prin1-to-string lst)) 'list) t nil) 'string))
  (fresh-line))

  ;;; This function displays the valid commands.
  (defun help ()
   (format t "The valid game commands are: ~a ~%" *allowed-commands*) ; Print out valid commands
  )

  ;;;This function calls help function which displays valid commands.
  (defun h ()
    (help)  ; Call help function
  )

  ;;;This function calls help function which displays valid commands.
  (defun ? ()
    (help)  ; Call help function
  )

  ;;; This macro deals with the front gate and speaking with the guards
  ;;; Users will specify the action with one object needed to running
  ;;; Else the path will remain closed until objects are collected
  (defmacro speak-action (command place &body body)
    `(progn (defun ,command ()
              (if (eq *location* ',place)
                  ,@body
              '(i cant ,command like that.)))
            (pushnew ',command *allowed-commands*)))

  (speak-action speak Village-Gate
                (cond ((have 'scribbled-note)
                       (add-path 'gateway 'Village-Gate 'Forest-Path '2 'north 'south)
                       '(The guards take the note reading it diligently. They cant
                         believe your sister was taken by the shadowy king. They
                         immediately let you pass through the gates.))
                       (t '(The guards are all scratching their heads wondering
                            what has happened. They are not letting anyone through
                            for the time being. Maybe there is a clue around the
                            village.))))

  ;;; This macro deals with every locked boss door.
  ;;; The place is the initial check
  ;;; The master key needs to be obtained in order to create a path to the boss
  (defmacro unlock-action (command place &body body)
    `(progn (defun ,command ()
              (if (eq *location* ',place)
                  ,@body
              '(i cant ,command like that.)))
            (pushnew ',command *allowed-commands*)))

  ;;; This macro defines the items needed to unlock the first boss room
  ;;; In this unlock action the user needs to obtain the forest-key
  ;;; A path to to boss room is created
  (unlock-action unlock-door Tree-Atrium
                (cond ((have 'forest-key)
                       (add-path 'doorway 'Tree-Atrium 'Tree-Boss '2 'north 'south)
                       '(You take the large master key and place it in the door
                         lock. Turning the key the door suddenly shifts open to
                         reveal a large dark pathway!))
                       (t '(Looks like you need a key to unlock the large door.
                            Maybe you should try another path.))))

  ;;; This macro defines the items needed to unlock the first boss room
  ;;; In this unlock action the user needs to obtain the forest-key
  ;;; A path to to boss room is created
  (unlock-action unlock-gate Dark-Cave
                (cond ((have 'volcano-key)
                       (add-path 'spiral-staircase 'Dark-Cave 'Volcano-Boss '2 'north 'south)
                       '(You take the large master key and place it in the gate
                         lock. Turning the key the gate suddenly shifts open to
                         reveal the large spiral staircase!))
                       (t '(Looks like you need a key to unlock the large rodiron gate.
                            Maybe you should try another path.))))

  ;;; This macro defines the items needed to unlock the first boss room
  ;;; In this unlock action the user needs to obtain the forest-key
  ;;; A path to to boss room is created
  (unlock-action unlock-porthole Underwater-Tunnel
                (cond ((have 'ocean-key)
                       (add-path 'ladder 'Underwater-Tunnel 'Ocean-Boss '2 'north 'south)
                       '(You take the large master key and place it in the porthole
                         lock. Turning the key the porthole suddenly opens to
                         reveal a ladder down into darkness!))
                       (t '(Looks like you need a key to unlock the porthole.
                            Maybe you should try another path.))))

  ;;; Just a simple command based on the place the user is currently
  ;;; Anything else that needs to be specified for an action results
  ;;; in the action itself.
  (defmacro fight-action (command place &body body)
    `(progn (defun ,command ()
              (if (eq *location* ',place)
                  ,@body
              '(i cant ,command like that.)))
            (pushnew ',command *allowed-commands*)))

  ;;; This action is used to kill the Tree-Boss specifically.
  ;;; User must have a slingshot or else lose the game.
  ;;; If used then a call to the add-path macro is made.
  (fight-action fight-spider Tree-Boss
              (cond ((have 'slingshot)
                     (add-path 'passageway 'Tree-Boss 'Green-Chest '2 'ahead 'ahead)
                     '(You use your slingshot to stun the many
                       eyes of the spider stunning it to the
                       ground! You then hack away at it with
                       your sword killing it! A secret
                       passageway is revealed leading to a
                       large green chest!))
                    (t '(The spider sprays webbing all over you creating a human
                         coccoon! You suffocate under the extreme pressure and
                         die - you were not able to save your sister and lose!
                         The end.))))

  ;;; This action is used to kill the Volcano-Boss specifically.
  ;;; User must have mini-bombs or else lose the game.
  ;;; If used then a call to the add-path macro is made.
  (fight-action fight-dragon Volcano-Boss
              (cond ((have 'mini-bombs)
                      (add-path 'secret-path 'Volcano-Boss 'Red-Chest '2 'ahead 'ahead)
                      '(You toss a couple of bombs at the
                        dragon stunnning him on the ground.
                        One more bomb sends him crumbling into
                        the center of the volcano never to be
                        seen again! A secret path is revealed
                        to a large red chest!))
                    (t '(The dragon spews out lava and you are submerged under
                         the surface you are not able to survive the extreme
                         heat and die - you were not able to save your sister
                         and lose! The end.))))

  ;;; This action is used to kill the Ocean-Boss specifically.
  ;;; User must have a bow or else lose the game.
  ;;; If used then a call to the add-path macro is made.
  (fight-action fight-shark Ocean-Boss
              (cond ((have 'bow)
                     (add-path 'pathway 'Ocean-Boss 'Blue-Chest '2 'ahead 'ahead)
                     '(You stay as far away from the shark dodging
                       all attacks thrown at you. You start shooting
                       arrows at the shark hitting every shot. Soon
                       the shark cannot leap anymore. You finish it
                       off with your sword and a pathway appears
                       revealing a large blue chest!))
                    (t '(The shark leaps out of the water and swallows you hole!
                         You are unable to get out and die in the process - you
                         were not able to save your sister and lose! The end.))))

  ;;; Set the action status to false
  (defparameter *jewels-set* nil)

  ;;; This macro defines simple actions that utilize a place only
  ;;; This macro specifically is used for placing the jewels at the alter
  (defmacro set-jewels (command place &body body)
    `(progn (defun ,command ()
              (if (eq *location* ',place)
                  ,@body
              '(i cant ,command like that.)))
            (pushnew ',command *allowed-commands*)))

  ;;; This action uses the current location as an initial check.
  ;;; The user must have all 3 jewels in order to make the Master-Sword.
  ;;; They need this to defeat the shadowy king and save their sister.
  (set-jewels use-alter Temple-Alter
                (if (and (have 'emerald-jewel) (have 'ruby-jewel) (have 'sapphire-jewel) (not *jewels-set*))
                    (progn (setf *jewels-set* 't)
                           '(The Trinity Jewels have been combined!
                             The temple alter starts to open.
                             A glimmering sword lies before you!
                             You have gained the power of the Master-Sword!))
                    '(you do not have some items for the alter!)))

(fight-action fight-king Dark-Castle
                (cond ((not *jewels-set*) '(Your beginner sword is no match for
                                          the shadowy king! He strikes you with
                                          his powers and kills you immediately!
                                          - you were not able to save your
                                          sister and lose! The end.))
                     (t '(The power of the Master-Sword is too strong for the
                          shadowy king to handle! He throws everything he has at
                          you but you volley them right back at him. He is
                          finally stunned and you take this chance to slash away
                          at him! One last slash of the master sword defeats
                          him! The darkness fades away from the region and your
                          sister is finally released from her dark prison. you
                          saved your sister! - the end.))))
