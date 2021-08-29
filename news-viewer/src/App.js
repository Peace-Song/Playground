import React, { useState } from 'react';
import Categories from './Categories';
import NewsList from './NewsList';

import { categories } from './const'

const App = () => {
  const [category, setCategory] = useState(categories[0]);
  
  return (
    <>
      <Categories {...{category, setCategory}} />
      <NewsList category={category} />
    </>
  );
};

export default App;
