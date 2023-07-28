module Rules where

rule30 :: String -> String -> String
rule30 ('*':'*':'*':args) string = (rule30 ('*':'*':args) (string ++ " "))
rule30 ('*':'*':' ':args) string = (rule30 ('*':' ':args) (string ++ " "))
rule30 ('*':' ':'*':args) string = (rule30 (' ':'*':args) (string ++ " "))
rule30 ('*':' ':' ':args) string = (rule30 (' ':' ':args) (string ++ "*"))
rule30 (' ':'*':'*':args) string = (rule30 ('*':'*':args) (string ++ "*"))
rule30 (' ':'*':' ':args) string = (rule30 ('*':' ':args) (string ++ "*"))
rule30 (' ':' ':'*':args) string = (rule30 (' ':'*':args) (string ++ "*"))
rule30 (' ':' ':' ':args) string = (rule30 (' ':' ':args) (string ++ " "))
rule30 _ string = "  " ++ string ++ "  "

rule90 :: String -> String -> String
rule90 ('*':'*':'*':args) string = (rule90 ('*':'*':args) (string ++ " "))
rule90 ('*':'*':' ':args) string = (rule90 ('*':' ':args) (string ++ "*"))
rule90 ('*':' ':'*':args) string = (rule90 (' ':'*':args) (string ++ " "))
rule90 ('*':' ':' ':args) string = (rule90 (' ':' ':args) (string ++ "*"))
rule90 (' ':'*':'*':args) string = (rule90 ('*':'*':args) (string ++ "*"))
rule90 (' ':'*':' ':args) string = (rule90 ('*':' ':args) (string ++ " "))
rule90 (' ':' ':'*':args) string = (rule90 (' ':'*':args) (string ++ "*"))
rule90 (' ':' ':' ':args) string = (rule90 (' ':' ':args) (string ++ " "))
rule90 _ string = "  " ++ string ++ "  "

rule110 :: String -> String -> String
rule110 ('*':'*':'*':args) string = (rule110 ('*':'*':args) (string ++ " "))
rule110 ('*':'*':' ':args) string = (rule110 ('*':' ':args) (string ++ "*"))
rule110 ('*':' ':'*':args) string = (rule110 (' ':'*':args) (string ++ "*"))
rule110 ('*':' ':' ':args) string = (rule110 (' ':' ':args) (string ++ " "))
rule110 (' ':'*':'*':args) string = (rule110 ('*':'*':args) (string ++ "*"))
rule110 (' ':'*':' ':args) string = (rule110 ('*':' ':args) (string ++ "*"))
rule110 (' ':' ':'*':args) string = (rule110 (' ':'*':args) (string ++ "*"))
rule110 (' ':' ':' ':args) string = (rule110 (' ':' ':args) (string ++ " "))
rule110 _ string = "  " ++ string ++ "  "