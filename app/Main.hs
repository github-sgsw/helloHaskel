convertIntToString :: Int -> String
convertIntToString x = "Number: " ++ show x

data Box a = Box a deriving Show

instance Functor Box where
  fmap function (Box value) = Box (function value)

box10 :: Box Int
box10 = Box 10

add a b = a + b

main :: IO ()
main = do
  print (fmap convertIntToString box10)
  print ("teet")
