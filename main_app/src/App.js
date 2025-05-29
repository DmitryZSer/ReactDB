import 'bootstrap/dist/css/bootstrap.min.css';

import { BrowserRouter, Routes, Route } from 'react-router-dom';
import ArticlesList from './pages/ArticlesList';
import ArticleView from './pages/ArticleView';
import Header from './pages/components/Header';
import ArticleEdit from './pages/ArticleEdit';

import { KeycloakProvider} from "./modules/KeycloakContext";

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
            <Route path='/articles/:id/edit' element={<ArticleEdit></ArticleEdit>}></Route>
            <Route path='/articles/new' element={<ArticleEdit></ArticleEdit>}></Route>
          </Routes>
        </BrowserRouter>
  );
}

export default App;