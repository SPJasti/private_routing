times3 :: [TurtleCommand] -> [TurtleCommand]
times3 x = x ++ x ++ x

koch :: Int -> Double -> [TurtleCommand]
--koch depth d = times3 ( (func (fromIntegral depth) d ) ++ [Turn(-(2*pi/3))] )
koch depth d
    | depth == 0 = times3 ( (func (fromIntegral 1 ) d ) ++ [Turn(-(2*pi/3))] )
    | depth == 1 = times3 ( (func2 3 d ) )
    | depth == 3 = times3 ( (func3 9 d ) )
    -- | depth == 2 = times3 ( (func4 d ) )


func :: Double -> Double -> [TurtleCommand]
func dep d = [Forward (d/(3*dep)) , Turn ((pi/3)) ,
              Forward (d/(3*dep)) ,Turn (-(2*pi/3)) ,
              Forward (d/(3*dep)) , Turn ((pi/3)),
              Forward (d/(3*dep)) ]

func2 ::Double -> Double -> [TurtleCommand]
func2 dep d =  l1 ++ l2 ++ l1 ++ l2
           where
            l1 = func dep d ++ [ Turn (pi/3) ]
            l2 = func dep d ++ [ Turn (-(2*pi/3)) ]
{-
func3' :: Double -> Double -> [TurtleCommand]
func3' dep d = l2  ++ [Turn (-(2*pi/3)) ] ++ l1
    where
        l1 = func2 dep d -- ++ [ Turn (-(2*pi/3)) ]
        l2 = func2 dep d -- ++ [ Turn (pi/3) ]
-}

func3 ::Double -> Double -> [TurtleCommand]
func3 dep d = l2 ++ l2
          where
            l = func dep d ++[Turn (pi/3) ] ++ func dep d ++[Turn (-(2*pi/3)) ] ++
                func dep d ++[Turn (pi/3) ] ++ func dep d
            l2 = l ++[Turn (pi/3) ] ++ l ++[ Turn (-(2*pi/3)) ]

