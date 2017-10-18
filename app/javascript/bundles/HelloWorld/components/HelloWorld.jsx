import PropTypes from 'prop-types';
import React from 'react';

export default class HelloWorld extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  constructor(props) {
    super(props);

    this.state = {
      name: this.props.name
    };
  }

  handleNameChange = (e) => {
    this.setState({
      name: e.target.value
    });
  };

  render() {
    return (
      <div>
        <h3>
          Hello, {this.state.name}! This is React v{React.version}....
        </h3>
        <hr />
        <form >
          <label htmlFor="name">
            Say hello to:
          </label>
          <input
            id="name"
            type="text"
            value={this.state.name}
            onChange={this.handleNameChange}
          />
        </form>
      </div>
    );
  }
}
