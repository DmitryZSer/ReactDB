import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';

import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Login from './pages/Login';
import SignUp from './pages/SignUp';
import Home from './pages/Home';
import ArticlesList from './pages/ArticlesList';
import ArticleView from './pages/ArticleView';
import { AuthProvider } from './modules/AuthContex';
import Header from './pages/Header';
import Profile from './pages/Profile';

function App() {
  return (
    <AuthProvider>
    <BrowserRouter>
    <Header></Header>
      <Routes>
        <Route path='/ArticlesList' element={<ArticlesList></ArticlesList>}></Route>
        <Route path="/article/:id" element={<ArticleView />} /> {/* Dynamic route for article */}
        <Route path='/Login' element={<Login></Login>}></Route>
        <Route path='/SignUp' element={<SignUp></SignUp>}></Route>
        <Route path='/Profile' element={<Profile></Profile>}></Route>
        <Route path='/' element={<Home></Home>}></Route>
      </Routes>
    </BrowserRouter>
    </AuthProvider>
  );
}

export default App;
