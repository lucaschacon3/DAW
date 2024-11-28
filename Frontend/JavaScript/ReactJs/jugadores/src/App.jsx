import React from 'react';
import './App.css';
import ListItem from './components/ListItem'; // Ruta correcta al componente

function App() {
  const jugadores = new Map([
    ["Lionel Messi", "Delantero"],
    ["Kevin De Bruyne", "Centrocampista"],
    ["Virgil van Dijk", "Defensa"],
    ["Thibaut Courtois", "Portero"]
  ]);

  return (
    <div className="App">
      <h1>Mejores Jugadores de la Historia</h1>
      <ul>
        {Array.from(jugadores.entries()).map(([nombre, posicion]) => (
          <ListItem key={nombre} nombre={nombre} posicion={posicion} />
        ))}
      </ul>
    </div>
  );
}

export default App;
