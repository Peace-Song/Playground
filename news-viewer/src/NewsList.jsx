import React, { useState, useEffect, useCallback } from 'react';
import axios from 'axios';
import { url, apiKey, country, categories } from './const';

import NewsItem from './NewsItem';

import './NewsList.css';

const getUrlParamsFromObj = (obj) => {
  return Object.keys(obj).reduce((prev, curr, idx) => {
    const url = prev + `${curr.toString()}=${obj[curr]}`
    if (idx + 1 !== Object.keys(obj).length) {
      return url + '&'
    }
    return url
  }, '');
};

const NewsList = ({ category }) => {
  const [articles, setArticles] = useState(null);
  const [loading, setLoading] = useState(false);

  const fetchArticles = useCallback(async () => {
    setLoading(true);
    
    try {
      const params = {
        country,
        apiKey,
        ...(category !== categories[0] && { category: category.name })
      }
      const response = await axios.get(url + getUrlParamsFromObj(params));
      setArticles(response?.data?.articles);
    } catch (e) {
      console.log(e);
    } finally {
      setLoading(false);
    };
  }, [setArticles, setLoading, category]); 

  useEffect(() => {
    fetchArticles();
  }, [category, fetchArticles]);

  if (loading) {
    return (
      <div className={'newsLists'}>
        Loading...
      </div>
    );
  }

  return (
    <div className={'newsLists'}>
      {articles?.map((article) => <NewsItem article={article} key={article.publishedAt} />)}
    </div>
  );
};

export default NewsList;
