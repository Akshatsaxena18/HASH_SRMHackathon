import React from 'react'
import { Link } from 'react-router-dom'
import styled from 'styled-components'
import Formpage from '../components/Logincomp/Formpage'

const Login = () => {
  return (
    <>
        <LoginContainer>
            {/* <Aboveform><SignUp><Link to='/' style={{textDecoration: 'none' ,color: 'black'}}>Signup</Link></SignUp></Aboveform> */}
            <Formpage/>
        </LoginContainer>
    </>
  )
}

export default Login

const LoginContainer = styled.div`
background-size: cover;
    background-image:url("https://images.pexels.com/photos/1213859/pexels-photo-1213859.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260");
    background-position: center ;
    width: 100%;
    height: 100vh;
    overflow: hidden;
    justify-content: center;
    align-items: center;
    display: flex;
    flex-direction: column;
    
`
const Aboveform = styled.div`
    
    display: flex;
    width: 100%;
    justify-content: right;
    marging: 20px;
    padding: 10px;
`

const SignUp = styled.div`
    font-size: 20px;
    color: black;
    font-weight: 500;
    display: flex;
    align-items:center;
    justify-content: left;
    background: lightgreen;
    padding: 10px;
    marging: 10px;
    border-radius:10px; 

    Link{
        text-decoration: none;
    }
`