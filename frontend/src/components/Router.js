import Header from './Header'
import Footer from './Footer'
import Login from '../pages/Login'
import Employee from '../pages/Employee';
import { BrowserRouter, Routes, Route, Outlet } from 'react-router-dom';
import { RequireToken } from './Auth';

export default function Router(props) {

    const Layout = () => {
        return (
        <>
            <Header/>
            <Outlet />
            <Footer />
        </>
        )
    }

    const BrowserRoutes = () => {
        return (
            <BrowserRouter>
                <Routes>
                    <Route path="/" element={<Layout />} >
                        <Route path="/" element={<Login />}/>
                        <Route path="/all-employees" 
                        element={
                        <RequireToken>
                            <Employee />
                        </RequireToken>} />
                        {/* <Route path="/register-employee" 
                        element={
                        <RequireToken>
                            <RegisterEmployee />
                        </RequireToken>} /> */}
                    </Route>
                </Routes>
            </BrowserRouter>
        )
    }

    return (
        <BrowserRoutes />
    )
}