import React, { Component } from 'react';

class PhoneInfo extends Component{
    static defaultProps = {
        info: {
            name: "name",
            phone_number: "010-0000-0000",
            id: 0
        },
    };

    state = {
        editing: false,
        name: "",
        phone_number: ""
    }

    handleRemove = () => {
        const { info, onRemove } = this.props;
        onRemove(info.id);
    }

    handleToggleEdit = () => {
        const { editing } = this.state;
        this.setState({
            editing: !editing
        });
    }

    handleChange = (event) => {
        const { name, value } = event.target;

        this.setState({
            [name]: value
        });
    }

    shouldComponentUpdate(nextProps, nextState){
        if(!this.state.editing
            && !nextState.editing
            && nextProps.info === this.props.info){
                return false;
            }

        return true;
    }

    componentDidUpdate(prevProps, prevState){
        const {info, onUpdate } = this.props;

        if(!prevState.editing && this.state.editing){
            this.setState({
                name: info.name,
                phone_number: info.phone_number
            });
        }

        if(prevState.editing && !this.state.editing){
            onUpdate(info.id, {
                name: this.state.name,
                phone_number: this.state.phone_number
            });
        }
    }

    render(){
        console.log("render PhoneInfo " + this.props.info.id);

        const style = {
            border: "1px solid black",
            padding: "8px",
            margin: "8px"
        };

        const { editing } = this.state;

        if(editing){
            return (
                <div style={style}>
                    <div>
                        <input
                            value={this.state.name}
                            name="name"
                            placeholder="Name"
                            onChange={this.handleChange}
                        />
                    </div>
                    <div>
                        <input  
                            value={this.state.phone_number}
                            name="phone"
                            placeholder="Phone_number"
                            onChange={this.handleChange}
                        />
                    </div>
                    <button onClick={this.handleToggleEdit}>Apply</button>
                    <button onClick={this.handleRemove}>Delete</button>
                </div>
            );
        }

        const {
            name, phone_number
        } = this.props.info;

        return (
            <div style={style}>
                <div><b>{name}</b></div>
                <div>{phone_number}</div>
                <button onClick={this.handleToggleEdit}>Edit</button>
                <button onClick={this.handleRemove}>Delete</button>
            </div>
        );
    }
}

export default PhoneInfo;