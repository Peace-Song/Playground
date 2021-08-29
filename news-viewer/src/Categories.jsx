import React from 'react';
import { NavLink } from 'react-router-dom';


import { categories } from './const';

import './Categories.css'

const Categories = () => {
  return (
    <div className={'categories'}>
      {categories.map((category) => (
        <NavLink 
          key={category.name} 
          className={'category'}
          activeClassName={'active'}
          exact={category === categories[0]}
          to={category === categories[0] ? `/` : `/${category.name}`}
        >
          {category.text}
        </NavLink>
      ))}
    </div>
  );
};

export default Categories;
