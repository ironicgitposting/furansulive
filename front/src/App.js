// in src/App.js
import * as React from "react";
import { Admin, ListGuesser, Resource } from 'react-admin';
import jsonServerProvider from 'ra-data-json-server';
// Components
import { UserList } from './users/users';
import { PostList } from './posts/posts';




const dataProvider = jsonServerProvider('https://jsonplaceholder.typicode.com');
const App = () => <Admin dataProvider={dataProvider}>
  <Resource name="posts" list={PostList} />
  <Resource name="users" list={UserList} />
</Admin>;

export default App;