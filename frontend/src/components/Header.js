import logo from '../logo.svg';
import { useContext } from 'react';
import Context from './Context';

const Header = (props) => {
  const userData = useContext(Context)
    return (
      <nav className="nav-bar">
         <p><img src={logo} alt="logo" height="50"/></p>
         <ul>
           <li>
             <a href="/">Home</a>
           </li>
         </ul>
      </nav>
    )
}

export default Header