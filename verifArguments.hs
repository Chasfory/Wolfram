module VerifArgs where

import Control.Exception

data Wolfram = Wolfram {
    rule :: Int,
    line_tmp :: String,
    string :: String,
    line :: Int,
    start :: Int,
    window :: Int,
    move :: Int
} deriving (Show)

instance Exception Wolfram

help :: IO ()
help = mapM_ putStrLn [ "Usage:",
                        "\t./wolfram -h",
                        "\t./wolfram --rule nbr, --start nbr, --lines nbr, --window nbr, --move nbr",
                        "Description:",
                        "\tThe goal of this project is to implement Wolfram’s elementary cellular ",
                        "\tautomaton in the terminal." ]

putRule :: Wolfram -> Int -> Wolfram
putRule wolfram a = wolfram {rule = a}

putMove :: Wolfram -> Int -> Wolfram
putMove wolfram a = wolfram {move = a}

putWindow :: Wolfram -> Int -> Wolfram
putWindow wolfram a = wolfram {window = a}

putStart :: Wolfram -> Int -> Wolfram
putStart wolfram a = wolfram {start = a}

putLines :: Wolfram -> Int -> Wolfram
putLines wolfram a = wolfram {line = a}

myIsDigit :: String -> Bool
myIsDigit [] = True
myIsDigit a
    | (head a < '0' || head a > '9') = False
    | otherwise = myIsDigit (tail a)

handleArgs :: String -> Int
handleArgs number
        | myIsDigit(number) == False = -84
        | otherwise = read(number)

verifArgs :: [ String ] -> Wolfram -> Wolfram
verifArgs [] wolfram = wolfram
verifArgs ("--rule":number:args) wolfram = (verifArgs args (putRule wolfram (handleArgs number)))
verifArgs ("--lines":number:args) wolfram = (verifArgs args (putLines wolfram (handleArgs number)))
verifArgs ("--start":number:args) wolfram = (verifArgs args (putStart wolfram (handleArgs number)))
verifArgs ("--window":number:args) wolfram = (verifArgs args (putWindow wolfram (handleArgs number)))
verifArgs ("--move":number:args) wolfram = (verifArgs args (putMove wolfram (handleArgs number)))
verifArgs (_:args) wolfram = (verifArgs args wolfram)