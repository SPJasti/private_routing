/*
import React,{Component} from 'react'
// import Table from './Table'
import {
BrowserRouter as Router ,
Route,
Link,
Redirect
} from 'react-router-dom'


export default App
-------------------------------------------------------------------------
*/

/*
class App extends Component {
  render() {
    return (
      <div className="container">
       <Table />
      </div>
    )
  }
}

export default App
-------------------------------------------------------------------------------
 */
/*  ______________________________________________
    |                                             |
    V                                             |
  base page -> public -> protected -> X           |
    |                                             |
    |                                             |
  protected -> X                                  |
    |                                             |
  login-> protected -> public/protected ->logout -' 

    X is login page redirected 
*/

import React from 'react'
import {
  BrowserRouter as Router,
  Route,
  Link,
  Redirect,
  withRouter
} from 'react-router-dom'


// we will change the below function once you are ok with the routing 
const fakeAuth = {
  isAuthenticated: false,
  authenticate(cb) {
    this.isAuthenticated = true
    setTimeout(cb, 100)
  },
  signout(cb) {
    this.isAuthenticated = false
    setTimeout(cb, 100)
  }
}

const Public = () => <h4>Public</h4>
const Protected = () => <h4>Protected</h4>

class Login extends React.Component {
  state = {
    redirectToReferrer: false
  }
  login = () => {
    fakeAuth.authenticate(() => {
      this.setState(() => ({
        redirectToReferrer: true
      }))
    })
  }
  render() {
    const { from } = this.props.location.state || { from: { pathname: '/' } }
    const { redirectToReferrer } = this.state

    if (redirectToReferrer === true) {
      return <Redirect to={from} />
    }

    return (
      <div>
        <p>You must log in to view the page</p>
        <button onClick={this.login}>Log in</button>
      </div>
    )
  }
}

// sir here you can see using authetication we give acess to the protected page 

const PrivateRoute = ({ component: Component, ...rest }) => (
  <Route {...rest} render={(props) => (
    fakeAuth.isAuthenticated === true
      ? <Component {...props} />
      : <Redirect to={{
          pathname: '/login',
          state: { from: props.location }
        }} />
  )} />
)

const AuthButton = withRouter(({ history }) => (
  fakeAuth.isAuthenticated ? (
    <p>
      Welcome! <button onClick={() => {
        fakeAuth.signout(() => history.push('/'))
      }}>Sign out</button>
    </p>
  ) : (
    <p>You are not logged in.</p>
  )
))

export default function AuthExample () {
  return (
    <Router>
      <div>
        <AuthButton/>
        <ul>
          <li><Link to="/public">Public Page</Link></li>
          <li><Link to="/protected">Protected Page</Link></li>
        </ul>
        <Route path="/public" component={Public}/>
        <Route path="/login" component={Login}/>
        <PrivateRoute path='/protected' component={Protected} />
      </div>
    </Router>
  )
}

/*-----------------------------------------------------------------------------------*/

