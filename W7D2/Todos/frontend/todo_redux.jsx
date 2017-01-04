import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// function addLoggingToDispatch(store) {
  // let oldDispatch = store.dispatch;
  // return (action) => {
  //   console.log(store.getState());
  //   console.log(action);
  //   oldDispatch(action);
  //   console.log(store.getState());
//   }
// }

// const addLoggingToDispatch = (store) => (next) => (action) => {
//   let oldDispatch = store.dispatch;
//   console.log(store.getState());
//   console.log(action);
//   let result = oldDispatch(action);
//   console.log(store.getState());
//   return result
// }
//
// function applyMiddlewares(store, ...middlewares) {
//   let dispatch = store.disatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch)
//   })
//   return Object.assign({}, store, { dispatch });
// }

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  // store.dispatch = addLoggingToDispatch(store);
  // let newStore = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
