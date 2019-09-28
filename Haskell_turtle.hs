module Turtle where

import CodeWorld hiding (polygon)

type Radians = Double

-- | The commands that we can send to our turtle.
data TurtleCommand
  = Forward Double -- ^ Drive forward the given number of units, and
                   -- draw a line.
  | Jump Double -- ^ Move forward the given number of units, but do
                -- not draw a line.
  | Turn Radians -- ^ Turn the turtle. Positive values are
                 -- anticlockwise; negative values are clockwise.
  deriving (Eq, Show)
  
  
  
  
  
type Angle = Double
type CurrentPoint = Point
type TurtleState = (Angle, CurrentPoint, [Point])

-- Initial state defines the turtle state before any turtle commands
initialState :: TurtleState
initialState = ((pi/2), (0,0), [(0,0)])

-- c is command and cs is commands
getPoints :: TurtleState -> [TurtleCommand] -> [[Point]]
getPoints (angle, (x, y), points) [] = getelement3 (angle, (x, y), points)
getPoints (angle, (x, y), points) (c:cs) = case c of
  Jump d        -> getPoints (angle, newpoint d, points++[newpoint d] ) cs -- getPoints (angle, newpoint d , points) cs -- getPoints (angle, newpoint d, points++[newpoint d] ) cs
  Turn radians  -> getPoints ((angle+radians), (x,y), points) cs
  Forward d     -> getPoints (angle, newpoint d, points++[newpoint d] ) cs
  where
    newpoint d = ( x+d*(cos angle), y+d*(sin angle) )

getelement3 :: TurtleState -> [[Point]]
getelement3 (_,_,c) = [c]

runTurtle :: [TurtleCommand] -> Picture
-- runTurtle = undefined -- TODO
runTurtle x = runTurtle' (getPoints initialState x)
  where
    runTurtle' []     = blank
    runTurtle' (points:xs) = polyline points & runTurtle' xs
