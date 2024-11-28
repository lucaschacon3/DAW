import React from 'react';

const ListItem = ({ nombre, posicion }) => {
  return (
    <li>
      <strong>{nombre}</strong>: {posicion}
    </li>
  );
};

export default ListItem;
