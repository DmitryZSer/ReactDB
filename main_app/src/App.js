import 'bootstrap/dist/css/bootstrap.min.css';

import { BrowserRouter, Routes, Route } from 'react-router-dom';
import ArticlesList from './gui_elements/ArticlesList';
import ArticleView from './gui_elements/ArticleView';
import Header from './gui_elements/components/Header';
import ArticleEdit from './gui_elements/ArticleEdit';
import {PrivateRoute} from "./components/auth/PrivateRoute";

function App() {
  return (
        <BrowserRouter>
          <Header></Header>
          <Routes>
            <Route path='/' element={<ArticlesList></ArticlesList>}></Route>
            <Route path="/articles/:id" element={<ArticleView />} />
            {/*<Route path='/Login' element={<Login></Login>}></Route>*/}
            {/*<Route path='/SignUp' element={<SignUp></SignUp>}></Route>*/}
            {/*<Route path='/Profile' element={<Profile></Profile>}></Route>*/}
            {/*<Route path='/Home' element={<Home></Home>}></Route>*/}
            <Route path='/articles/new' element={<PrivateRoute element={<ArticleEdit/>} roles={['Administrator', 'Creator']}/>}/>
            <Route path='/articles/:id/edit' element={<PrivateRoute element={<ArticleEdit/>} roles={['Administrator', 'Creator']}/>}/>

            <Route path='*' element={<ArticlesList></ArticlesList>}></Route>
          </Routes>
        </BrowserRouter>
  );
}

export default App;