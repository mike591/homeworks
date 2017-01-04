import React, { Component } from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {

  constructor(props) {
    super(props)
    this.state = {searchTerm: ""}

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    e.preventDefault()
    this.setState({searchTerm: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault()
    this.props.fetchSearchGiphys(this.state.searchTerm);
  }

  render() {
    return (
      <div>
        <form>
          Search Term: <input onChange={this.handleChange} type="text" value={this.state.searchTerm} />
          <br></br>
          <button onClick={this.handleSubmit}>Search</button>
        </form>
        <GiphysIndex giphys={this.props.giphys}/>
      </div>
    )
  }

}

export default GiphysSearch;
