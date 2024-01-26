import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const Employee = () => {

    const [employeeData, setEmployeeData] = useState([])
    const navigate = useNavigate();

    useEffect( () => {
        let processing = true
        fetchData(processing)
        return () => {
            processing = false
        }
    },[])

    const fetchData = async(processing) => {
        axios.get('http://localhost:8000/api/employees')
        .then(function(response) {
            if(response.data){
                setEmployeeData(response.data)
            }
        })
        .catch(function(error){
            console.log(error, "error")
        })
    }

    const editEmployeeData = (id) => {
        console.log("Id::" + id)
        console.log("Clicked: " + id)
    }

    const handleSubmit = (e) => {
        e.preventDefault()
        console.log('clicked register new employee')
        navigate("/register-employee")

    }

    const EmployeeData = () => {
        return (
            <div className="pageContainer">
                <h3>Employee Data List</h3>
                {
                    employeeData.map( (item) =>
                    <div className="pageContainer">
                        <label>Name:</label>
                        <input type="text" id="name" name="name" value={item.name} disabled></input>

                        <label>Address:</label>
                        <input type="text" id="address" name="address" value={item.address} disabled></input>

                        <label>BirthDate:</label>
                        <input type="text" id="birthdate" name="birthdate" value={item.birthdate} disabled></input>

                        {/* <button type="submit" onSubmit={editEmployeeData(item.id)}>Edit Data</button> */}
                    </div>)
                }
            </div>
        )
    }
    return (
        <div className="pageContainer">
            <EmployeeData />
            <button type="submit" onClick={handleSubmit}>Register New Employee</button>
        </div>
    )
}

export default Employee