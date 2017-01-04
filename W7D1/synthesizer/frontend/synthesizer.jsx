import React from 'react';
import ReactDOM from 'react-dom';

import Note from './util/note.js';
import configureStore from './store/store';

import Root from './components/root.jsx';

window.Note = Note;

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);

  window.store = store; // for testing
});
