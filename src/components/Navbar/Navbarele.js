import styled from 'styled-components';
import { Link as LinkR } from 'react-router-dom';

export const Nav = styled.nav`
    z-index: 10;
    position: sticky;
    height: 150px;
    width: 100%;
    top:0px;
    background: #587308;
    // border-bottom-left-radius: 30px;
    // border-bottom-right-radius: 30px;
    display: flex;
    justify-column: center; 
    align-items:center;

`
export const MobileIcon = styled.div`
      display: block;
      position: absolute;
      top: 0;
      right: 0;
      transform: translate(-100%, 60%);   
      font-size: 1.8rem;
      cursor: pointer;
      color: #fff
    
`
export const NavContainer = styled.div`
    display: flex;
    justify-content: space-between;
    width: 100%;


    
`;

export const Navheading = styled.div`
    // border: solid black 2px;
    font-family: 'IBM Plex Mono', monospace;
    font-size: 50px;
    font-weight: 800;
    text-align: center;
    margin: 0 20px;
    letter-spacing: 2px;
    color: #fff;
    @media screen and (max-width: 760px){
        font-size: 30px;
        margin: 20px 2px;
        img{
            width:200px;
        }

    }

`
export const NavLogo = styled.div`

    justify-content: center;
    align-items: center;

    margin: 0 50px;
    cursor: pointer;
    @media screen and (max-width: 760px){
        margin: 0 10px;

    }
`;
export const NavMenu = styled.div`
    display: flex;
    align-items: center;
    text-align: center;
    font-size: 30px;
    padding: 0 30px;
    @media screen and (max-width: 760px){
        padding: 0 15px;

    }
`;
export const NavItems = styled.div`
    font-family: 'IBM Plex Mono', monospace;

    
`
export const Image = styled.div`
    background-image: url('./kisanseva.png');
    z-index: 2;
`;