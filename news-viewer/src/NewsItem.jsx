import React from 'react';

const NewsItem = ({ article }) => {
  const { title, description, url, urlToImage } = article;

  return (
    <div className={'newsItem'}>
      {urlToImage && (
        <div className={'thumbnail'}>
          <a href={url}>
            <img src={urlToImage} alt="thumbnail" />
          </a>
        </div>
      )}
      <div className={'contents'}>
        <h2>
          <a href={url}>
            {title}
          </a>
        </h2>
        <p>
          {description}
        </p>
      </div>
    </div>
  );
};

export default NewsItem;