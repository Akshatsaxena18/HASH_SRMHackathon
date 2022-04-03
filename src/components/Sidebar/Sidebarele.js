import styled from 'styled-components';
import {FaTimes} from 'react-icons/fa';
import { Link as LinkR } from 'react-router-dom';
import { Link as LinkS } from 'react-scroll';



export const Counter = styled.span`
    color: #5ff1d0;
`

export const SidebarContainer = styled.aside`
    position: fixed;
    z-index: 999;
    width: 60%;
    height:100vh;
    background: green;
    box-shadow: 0 0 1rem 0 rgba(0,0,0,0.2);
    display: grid;
    align-items: center;
    justify-content: center;
    top:0;
    right: 0;
    transition: 0.3s ease-in-out;
    opacity: ${({isOpen}) => (isOpen ? '100%' : '0%')};
    right: ${({isOpen}) => (isOpen ? '0' : '-100%')}; 
    
    overflow:${({isOpen}) => (isOpen ? 'hidden' : 'scroll')};
     /* &:before {
        position: absolute;
        background: inherit;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        box-shadow: inset 0 0 2000px rgba(255,255,255,.5);
        filter: blur(10px);
    } */
    
`

export const CloseIcon = styled(FaTimes)`
    color: #fff
`

export const Icon = styled.div`
    position:absolute;
    top: 1.2rem;
    right: 1.5rem;
    background: transparent;
    font-size: 2rem;
    cursor: pointer;
    outline: none;
`

export const SidebarWrapper = styled.div`
    
    color: #fff;
    
`



export const SidebarMenu = styled.ul`
    display: flex;
    flex-direction: column;
    gap:30px;
    height: 100vh;
    justify-content: center;

    text-align: left;
    // grid-template-columns: 1fr;
    // grid-template-rows: repeat(6, 80px);
    // text-align: center;
    
`

export const SidebarLink = styled(LinkR)`
    display: flex;
    align-items: center;
    justify-content: left;
    font-family: 'Fira Code', monospace;
    font-weight: 300;
    font-size: 40px;
    text-decoration: none;
    list-style: none;
    transition: 0.2s ease-in-out;
    text-decoration: none;
    color: #fff;
    cursor: pointer;
    &:hover {
        color: #01bf71;
        transition: 0.2s ease-in-out;
        text-decoration: underline;
    }
`

export const SideBtnWrap = styled.div`
    display: flex;
    justify-content: center;
`

export const SidebarRoute = styled(LinkR)`
    border-radius: 50px;
    background:  #01bf71;
    white-space: nowrap;
    padding: 16px 64px;
    color: #010606;
    font-size: 16px;
    outline: none;
    border: none;
    cursor: pointer;
    transition: 0.2s ease-in-out;
    text-decoration: none;
    &:hover {
        transition: 0.2s ease-in-out;
        background:#fff;
        color: #010606;
    }
`