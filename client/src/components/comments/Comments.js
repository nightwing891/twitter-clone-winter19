import React, { Component } from 'react';
import axios from 'axios';

class Comments extends Component {
  state = { comments: [] }

  componentDidMount() {
    const { id } = this.props.location.state
    let tweetId = id
    axios.get(`/api/tweets/${tweetId}/comments`)
      .then( res => {
        this.setState({ comments: res.data })
      })
      .catch(err => {
        console.log(err)
      })
  }

  render() {
    const { comments } = this.state
    return(
      <>
        {
          comments.map( comment => 
            <div>
              <h1>{comment.author}</h1>
              <h1>{comment.body}</h1>
            </div>  
          )
        }
      </>
    )
  }
}

export default Comments;