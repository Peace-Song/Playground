import { useState, useEffect, useCallback } from "react";
import axios from 'axios';

import { url, apiKey, country, categories } from './const';

const getUrlParamsFromObj = (obj) => {
  return Object.keys(obj).reduce((prev, curr, idx) => {
    const url = prev + `${curr.toString()}=${obj[curr]}`
    if (idx + 1 !== Object.keys(obj).length) {
      return url + '&'
    }
    return url
  }, '');
};

const useArticlesFetch = (category) => {
  const [loading, setLoading] = useState(false);
  const [articles, setArticles] = useState(null);
  const [error, setError] = useState(null);

  const fetchArticles = useCallback(async () => {
    setLoading(true);
    
    try {
      const params = {
        country,
        apiKey,
        ...(category !== categories[0].name && { category })
      }
      const response = await axios.get(url + getUrlParamsFromObj(params));
      setArticles(response?.data?.articles);
    } catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    };
  }, [setArticles, setLoading, setError, category]); 

  useEffect(() => {
    fetchArticles();
  }, [fetchArticles]);

  return [loading, articles, error];
};

export default useArticlesFetch;
