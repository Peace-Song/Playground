import React from 'react';

import NewsItem from './NewsItem';
import useArticlesFetch from './useArticlesFetch';
import './NewsList.css';

const NewsList = ({ category }) => {
  const [loading, articles, error] = useArticlesFetch(category);

  return (
    <div className={'newsLists'}>
      {loading && 'Loading...'}
      {error && 'Error'}
      {!loading && !error && articles?.map((article) => <NewsItem article={article} key={article.publishedAt} />)}
    </div>
  );
};

export default NewsList;
