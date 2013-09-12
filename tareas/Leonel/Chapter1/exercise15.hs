showMaybe :: Show a => Maybe a -> String
showMaybe Nothing = []
showMaybe (Just a) = show a