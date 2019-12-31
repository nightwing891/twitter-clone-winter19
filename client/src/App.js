import React from 'react';
import { Route, Switch } from 'react-router-dom';
import NoMatch from './components/shared/NoMatch';
import Tweets from './components/tweets/Tweets';
import Comments from './components/comments/Comments';

const App = () => (
  <Switch>
    <Route exact path='/' component={Tweets} />
    <Route exact path='/:tweet_id/comments' component={Comments} />
    <Route component={NoMatch} />
  </Switch>
)

export default App;