import React, { useState } from 'react';
import axios from 'axios';

const url = 'https://newsapi.org/v2/top-headlines?';
const apiKey = 'c311c58398d342c5b7be86d81885fabc';
const country = 'kr';

const getUrlParamsFromObj = (obj) => {
  return Object.keys(obj).reduce((prev, curr, idx) => {
    const url = prev + `${curr.toString()}=${obj[curr]}`
    if (idx + 1 !== Object.keys(obj).length) {
      return url + '&'
    }
    return url
  }, '')
}

const App = () => {
  const [data, setData] = useState();
  const onClick = async () => {
    const params = {
      country,
      apiKey
    };
    
    try {
      const response = await axios.get(url + getUrlParamsFromObj(params));
      setData(response?.data);
    } catch (e) {
      console.log(e);
    };
  };

  return (
    <div>
      <button onClick={onClick}>Load</button>
      {data && (
        <textarea rows={7} value={JSON.stringify(data, null, 2)} />
      )}
    </div>
  )

};

export default App;
