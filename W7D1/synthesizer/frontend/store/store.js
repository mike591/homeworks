import { createStore } from 'redux';
import reducer from '../reducers/root_reducer.js';

const preloadedState = {notes : []};

const configureStore = () => (
  createStore(reducer, preloadedState)
);

export default configureStore;
