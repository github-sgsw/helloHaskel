module Chapter12 where

import Control.Applicative
import Data.Char

newtype Parser a = P (String -> [(a, String)])

instance Functor Parser where
  -- fmap :: (a -> b) -> Parser a -> Parser b
  fmap fn parser =
    P
      ( \input -> case parse parser input of
          [] -> []
          [(parsedVal, restStr)] -> [(fn parsedVal, restStr)]
      )

instance Applicative Parser where
  -- pure :: a -> Parser a
  pure val = P (\input -> [(val, input)])

  -- (<*>) :: Parser (a -> b) -> Parser a -> Parser b
  fnParser <*> valParser =
    P
      ( \input -> case parse fnParser input of
          [] -> []
          [(transform, restStr)] -> parse (fmap transform valParser) restStr
      )

instance Monad Parser where
  -- (>>=) :: Parser a -> (a -> Parser b) -> Parser b
  parser >>= nextParserFn =
    P
      ( \input -> case parse parser input of
          [] -> []
          [(parsedVal, restStr)] -> parse (nextParserFn parsedVal) restStr
      )

instance Alternative Parser where
  -- empty :: Parser a
  empty = P (\_input -> [])

  -- (<|>) :: Parser a -> Parser a -> Parser a
  firstParser <|> fallbackParser =
    P
      ( \input -> case parse firstParser input of
          [] -> parse fallbackParser input
          [(parsedVal, restStr)] -> [(parsedVal, restStr)]
      )

parse :: Parser a -> String -> [(a, String)]
parse (P runParser) input = runParser input

item :: Parser Char
item =
  P
    ( \input -> case input of
        [] -> []
        (firstChar : restChars) -> [(firstChar, restChars)]
    )

sat :: (Char -> Bool) -> Parser Char
sat p = do
  x <- item
  if p x then return x else empty

digit :: Parser Char
digit = sat isDigit

lower :: Parser Char
lower = sat isLower

upper :: Parser Char
upper = sat isUpper

letter :: Parser Char
letter = sat isAlpha

alphanum :: Parser Char
alphanum = sat isAlphaNum

char :: Char -> Parser Char
char x = sat (== x)

{- string :: String -> Parser String
string [] = return []
string (x : xs) = do
  char x
  string xs
  return (x : xs) -}

three :: Parser (Char, Char)
three = do
  firstChar <- item
  item
  thirdChar <- item
  return (firstChar, thirdChar)
