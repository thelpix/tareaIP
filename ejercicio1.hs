mismoIntervalo :: Float -> Float -> String
mismoIntervalo x y | x <= 3 && y <= 3 = "Mismo Intervalo"
                   | (x > 3 && x <= 7) && (y > 3 && y <= 7) = "Mismo Intervalo"
                   | x > 7 && y > 7 = "Mismo Intevalo"
                   | otherwise = "No"

