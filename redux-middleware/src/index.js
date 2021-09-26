import React from 'react'
import ReactDOM from 'react-dom'
import { createStore, applyMiddleware } from 'redux'
import { Provider } from 'react-redux'
import ReduxThunk from 'redux-thunk'

import App from './App'
import rootReducer from './modules'
// import loggerMiddleware from './lib/loggerMiddleware'
import { createLogger } from 'redux-logger'

import './index.css'

const store = createStore(rootReducer, applyMiddleware(createLogger(), ReduxThunk))

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
);
