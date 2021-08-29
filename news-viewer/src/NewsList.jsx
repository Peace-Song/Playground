import React from 'react';
import NewsItem from './NewsItem';

const NewsList = ({ articles }) => {
  return (
    <div className={'newsLists'}>
      {articles.map((article) => <NewsItem article={article} key={article.publishedAt} />)}
    </div>
  );
};

export default NewsList;
