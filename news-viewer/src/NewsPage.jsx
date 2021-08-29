import React from 'react';
import Categories from './Categories';
import NewsList from './NewsList';
import { categories } from './const'

const NewsPage = ({ match }) => {
  const category = match.params.category || categories[0].name;

  return (
    <>
      <Categories />
      <NewsList category={category} />
    </>
  );
};

export default NewsPage;
