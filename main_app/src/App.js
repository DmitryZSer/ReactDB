import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';

import Login from './pages/Login';
import SignUp from './pages/SignUp';
import Home from './pages/Home';
import {BrowserRouter, Routes, Route} from 'react-router-dom';
 
function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path = '/Login' element={<Login></Login>}></Route>
        <Route path = '/SignUp' element={<SignUp></SignUp>}></Route>
        <Route path = '/' element={<Home></Home>}></Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
