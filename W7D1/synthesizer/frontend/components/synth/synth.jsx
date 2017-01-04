import React from 'react';
import {TONES, NOTE_NAMES} from '../../util/tones.js';
import Note from '../../util/note.js';

import $ from 'jquery';
import jQuery from 'jquery';

class Synth extends React.Component {
  constructor(props) {
    super(props);
    // this.notes = NOTE_NAMES.map((note) => {return new Note(TONES[note])});
    this.notes = NOTE_NAMES.map(note => new Note(TONES[note])); // array of Note instances
  }

  onKeyDown(e) {
    console.log('keyDown')
    this.props.keyPressed(e.key);
  }

  onKeyUp(e) {
    console.log('keyUp')
    this.props.keyReleased(e.key);
  }

  componentDidMount() {
    $(document).on('keydown', e => this.onKeyDown(e));
    $(document).on('keyup', e => this.onKeyUp(e));
  }

  playNotes() {
    NOTE_NAMES.forEach((note, idx) => {
      if (this.props.notes.indexOf(note) !== -1) { // play notes present in state
        this.notes[idx].start();
      } else {
        this.notes[idx].stop();
      }
    });
  }

  render() {
    this.playNotes();

    return (
      <div>

      </div>
    )
  }
}

export default Synth;
