import React, { Component } from 'react';

class PhoneForm extends Component{
    state = {
        name: "",
        phone_number: ""
    }

    handleChange = (event) => {
        this.setState({
            [event.target.name]: event.target.value
        });
    }

    handleSubmit = (event) => {
        event.preventDefault();
        this.props.onCreate(this.state);
        this.setState({
            name: "",
            phone_number: ""
        });
    }

    render(){
        return (
            <form onSubmit={this.handleSubmit}>
                <input
                    placeholder="Name"
                    value={this.state.name}
                    onChange={this.handleChange}
                    name="name"
                />
                <input
                    placeholder="Phone_Number"
                    value={this.state.phone_number}
                    onChange={this.handleChange}
                    name="phone_number"
                />
                <button type="submit">Submit!</button>
            </form>
        );
    }
}

export default PhoneForm;