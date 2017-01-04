import union from 'lodash/union';
import {KEY_PRESSED, KEY_RELEASED} from '../actions/notes_actions.js';
import {NOTE_NAMES} from '../util/tones';

const notesReducer = (state = [], action) => {
  Object.freeze(state);
  if (typeof action === 'undefined' || !NOTE_NAMES.includes(action.key)) {
    return state;
  }

  switch (action.type) {
    case KEY_PRESSED:
      let result = union(state, [action.type]);
      return result;
    case KEY_RELEASED:
      let idx = state.indexOf(action.key);
      if (idx === -1) {
        return state;
      } else {
        return [
          ...state.slice(0, idx),
          ...state.slice(idx + 1)
        ];
      }
      break;
    default:
      return state;
  }
};

export default notesReducer;
