import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.state = {
      num1: "",
      num2: "",
      result: "",
    };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    e.preventDefault();
    if (e.target.value === "") {
      return;
    } else {
      let num = parseInt(e.target.value);
      this.setState({num1: num});
    }
  }

  setNum2(e) {
    e.preventDefault();
    if (e.target.value === "") {
      return;
    } else {
      let num = parseInt(e.target.value);
      this.setState({num2: num});
    }
  }

  add(e) {
    let total = this.state.num1 + this.state.num2;
    if (total !== null) {
      this.setState({result: total});
    }
  }

  subtract(e) {
    let total = this.state.num1 - this.state.num2;
    if (total !== null) {
      this.setState({result: total});
    }
  }

  clear(e) {
    this.setState({num1: "", num2: "", result: ""});
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={this.state.num1}/>
        <input onChange={this.setNum2} value={this.state.num2}/>
        <button onClick={this.clear}>Clear</button>

        <br/>
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>

      </div>
    );
  }
}

export default Calculator;
