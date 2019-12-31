import React, { Component } from 'react';
import { Link } from 'react-router-dom'; 
import axios from 'axios';

class Tweets extends Component {
  state = { tweets: [] }

  componentDidMount() {
    axios.get('/api/tweets')
      .then( res => {
        this.setState({ tweets: res.data })
      })
      .catch( err => {
        console.log(err)
      })
  }

  render() {
    const { tweets } = this.state
    return(
      <>
        {
          tweets.map( tweet => 
             <div>
               <h1>
                <Link to={{
                  pathname: `/${tweet.id}/comments`,
                  state: {...tweet}
                }}>
                  {tweet.author}
                </Link>
                </h1>
               <h1>{tweet.title}</h1>
               <h1>{tweet.body}</h1>
             </div>
          )
        }
      </>
    )
  }
}

export default Tweets;