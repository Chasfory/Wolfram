import VerifArgs
import Rules
import System.Exit
import System.Environment

dataSet :: Wolfram
dataSet = Wolfram {
    rule = 0,
    line_tmp = "  *  ",
    string = "",
    line = 0,
    start = 0,
    window = 0,
    move = 0
}

putByRule :: Int -> IO ()
putByRule 30 = return ()
putByRule 90 = return ()
putByRule 110 = return ()
putByRule rule
    | rule >= 0 && rule <= 255 = return ()
    | otherwise = exitWith (ExitFailure 84)

displayResult :: Int -> Int -> String -> IO ()
displayResult compt move string
    | move > 0 = print ((replicate (compt) ' ') ++ (replicate (move) ' ') ++ string)
    | otherwise = print ((replicate compt ' ') ++ string ++ (replicate compt ' '))

displayResultWindow :: String -> Int -> IO ()
displayResultWindow string move
    | move > 0 = print ((replicate move ' ') ++ string)
    | otherwise = print string

resultWindow :: Int -> Int -> Int -> String -> IO ()
resultWindow compt tmp move string
    | tmp > 0 = (resultWindow compt (tmp - 1) move (tail string))
    | otherwise = (displayResultWindow string move)

appel :: Int -> String -> String -> String
appel 30 start_string tmp_string = (rule30 start_string tmp_string)
appel 90 start_string tmp_string = (rule90 start_string tmp_string)
appel 110 start_string tmp_string = (rule110 start_string tmp_string)
appel _ _ _ = ""

recursiveWindow :: Int -> Int -> Int -> Int -> Int -> String -> String -> IO ()
recursiveWindow start compt rule tmp move start_string tmp_string
    | start > 0 = (recursiveWindow (start - 1) (compt - 1) rule tmp move (appel rule start_string tmp_string) tmp_string)
    | compt > 1 = (resultWindow compt tmp move ((replicate ((tmp) `div` 2) ' ') ++ (appel rule start_string tmp_string) ++ (replicate ((tmp) `div` 2) ' '))) >> (recursiveWindow start (compt - 1) rule tmp move (appel rule start_string tmp_string) tmp_string)
    | otherwise = return ()

recursive :: Int -> Int -> Int -> Int -> String -> String -> IO ()
recursive start compt rule move start_string tmp_string
    | start > 0 = (recursive (start - 1) (compt - 1) rule move (appel rule start_string tmp_string) tmp_string)
    | compt > 1 = (displayResult compt move (appel rule start_string tmp_string)) >> (recursive start (compt - 1) rule move (appel rule start_string tmp_string) tmp_string)
    | otherwise = return ()

main :: IO ()
main = do
    args <- getArgs
    let optStr = (verifArgs args dataSet)
    (putByRule (rule optStr))
    if (window optStr > 0)
        then if (start optStr == 0)
            then (displayResultWindow ((replicate ((window optStr) `div` 2) ' ') ++ (line_tmp optStr) ++ (replicate ((window optStr) `div` 2) ' ')) (move optStr)) >> (recursiveWindow (start optStr) (line optStr + start optStr) (rule optStr) (window optStr) (move optStr) (line_tmp optStr) (string optStr))
        else do
            (recursiveWindow (start optStr) (line optStr + start optStr) (rule optStr) (window optStr) (move optStr) (line_tmp optStr) (string optStr))
    else do
        if (start optStr == 0)
            then (displayResult (line optStr + 1) (move optStr) (line_tmp optStr)) >> (recursive (start optStr) (line optStr + start optStr) (rule optStr) (move optStr) (line_tmp optStr) (string optStr))
        else do
            (recursive (start optStr) (line optStr + start optStr) (rule optStr) (move optStr) (line_tmp optStr) (string optStr))
    exitSuccess