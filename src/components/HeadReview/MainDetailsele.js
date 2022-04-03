import styled from 'styled-components';
import { Link as LinkR } from 'react-router-dom';

export const Mdcontainer = styled.div`
    display:flex;
    flex-direction: row;
    justify-content: center;
    margin: 30px;
    padding: 40px;
    background-color: white;
    border-radius: 20px;
    box-shadow: 10px 10px 5px grey;
    @media screen and (max-width:760px){
        flex-direction: column;
        padding: 10px;
        margin: 10px;
    }
`
export const Leftcontainer = styled.div`
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-width:50%;
    padding: 20px;
    // padding-right: 20%;

`
export const Rightcontainer = styled.div`
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: 20px;
    // padding-right: 240px;
`
export const Ptext = styled.div`
    margin: 10px;
    padding: 5px;
    font-family: 'IBM Plex Mono', monospace;
    font-size: 20px;
    font-weight: 500;
    border-radius: 10px;
    background-color: white;
    


`
export const Vtext = styled.div`
    font-size: 40px;
    @media screen and (max-width:760px){
        font-size: 30px;
    }
`