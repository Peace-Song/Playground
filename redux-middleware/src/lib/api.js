import axios from "axios"

const url = 'https://jsonplaceholder.typicode.com'

export const getPost = (id) => axios.get(`${url}/posts/${id}`)
export const getUsers = (id) => axios.get(`${url}/users`)
