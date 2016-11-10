module Servidor
    ( Servidor.run
    ) where

import Control.Concurrent
import Control.Monad

import Jugador

run :: Int -> Chan String -> Chan movimiento ->  IO ()
run cantJugadores connectionChan movesChan = do
	putStrLn ("Corriendo Servidor")
	putStrLn ("Cant jugadores: " ++ (show cantJugadores))
	putStrLn ("Agregando jugadores al juego.")
	forever $ do
		-- TODO: Leer datos de jugador de pipe
		line <- readChan connectionChan
		putStrLn line
		putStrLn ("Agregando nuevo jugador.")
		idJugador <- forkIO(Jugador.run movesChan)
		threadDelay	5000000
	putStrLn "Finalizando Servidor"