import React, { StrictMode } from 'react';
import { createRoot } from 'react-dom/client'; // Corrige la importación de createRoot
import './styles/index.css';
import App from './App';

// Asegúrate de que el elemento con id 'root' exista en tu HTML
const rootElement = document.getElementById('root');
if (rootElement) {
  createRoot(rootElement).render(
    <StrictMode>
      <App />
    </StrictMode>
  );
} else {
  console.error("No se encontró un elemento con el id 'root'.");
}
