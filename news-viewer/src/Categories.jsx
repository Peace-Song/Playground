import React from 'react';
import cx from 'classnames';

import { categories } from './const';

import './Categories.css'

const Categories = ({ category, setCategory }) => {
  return (
    <div className={'categories'}>
      {categories.map((aCategory) => (
        <div 
          key={aCategory.name} 
          className={cx('category', category === aCategory && 'active')}
          onClick={() => setCategory(aCategory)}
        >
          {aCategory.text}
        </div>
      ))}
    </div>
  );
};

export default Categories;
