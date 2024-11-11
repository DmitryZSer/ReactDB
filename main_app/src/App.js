import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';

import Login from './pages/Login';
import SignUp from './pages/SignUp';
import Home from './pages/Home';
import ArticlesList from './pages/ArticlesList';
import ArticleView from './pages/ArticleView';
import { BrowserRouter, Routes, Route } from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path='/ArticlesList' element={<ArticlesList></ArticlesList>}></Route>
        <Route path="/article/:id" element={<ArticleView />} /> {/* Dynamic route for article */}
        <Route path='/Login' element={<Login></Login>}></Route>
        <Route path='/SignUp' element={<SignUp></SignUp>}></Route>
        <Route path='/' element={<Home></Home>}></Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
