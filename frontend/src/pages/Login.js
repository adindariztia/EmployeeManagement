import { useState, useEffect } from "react"
import { useNavigate } from "react-router";
import { fetchToken, setToken } from "../components/Auth";
import axios from "axios";

const Login = () => {

    const [username, setUsername] = useState('')
    const [password, setPassword] = useState('')
    const [errorUsername, setErrorUsername] = useState('')
    const [errorPassword, setErrorPassword] = useState('')
    const navigate = useNavigate();

    const handleSubmit = (e) => {
        e.preventDefault()
        if(!username){
            setErrorUsername(<p className="required">Username is required</p>)
        } else if (!password) {
            setErrorPassword(<p className="required">Password is required</p>)
        } else {
            setErrorPassword('')
            setErrorUsername('')
            axios.post("http://localhost:8000/api/login",
            {
                username: username,
                password: password
            }).then(function(response) {
                if(response.data.token){
                    setToken(response.data.token);
                    navigate("/all-employees");
                }
            })
            .catch(function(error){
                console.log(error, "error")
            })
        }
    }

    return (
        <div className="Login">
            <form className="loginForm">
                <label>Username</label>
                <input type="text" id="username" name="username" value={username} onChange={ (e) => setUsername(e.target.value)}></input>
                { errorUsername }

                <label>Password</label>
                <input type="text" id="password" name="password" value={password} onChange={ (e) => setPassword(e.target.value)}></input>
                { errorPassword }
                <button type="submit" onClick={handleSubmit}>Login</button>
            </form>
        </div>
    )
}

export default Login