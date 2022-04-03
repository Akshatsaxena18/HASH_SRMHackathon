import styled from 'styled-components';
import { Link as LinkR } from 'react-router-dom';

export const HeroContainer = styled.div`

`;
export const HeroCards = styled.div`
    margin: 30px;
    padding: 5px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    background-color: #9ab451;
    border-radius: 15px;
    color: black;
    box-shadow: 10px 10px 5px grey;
    &:hover {
        transition: all 0.2s ease-in-out;
        transform: scale(1.05);
    }
     
`;
export const Heroleft = styled.div`
    display: flex;
    flex-direction: column;
`
export const Dtitle = styled.div`
    font-size: 40px;
    font-family: 'IBM Plex Mono', monospace;
    margin: 10px;
    @media screen and (max-width: 760px){
        margin: 8px;
        font-size: 20px
    }
    @media screen and (max-width: 900px){

        font-size: 20px
    }
`;
export const RIDNO = styled.p`
    font-size: 15px;
    font-family: 'IBM Plex Mono', monospace;
    margin: 3px 5px;
    padding: 2px;
    @media screen and (max-width: 760px){
        font-size: 16px
    }
`
export const Verify =styled.div`
    
    height: 50px;
    background-color: #fff;
    width: 100px;
    border-radius: 20px;
    font-family: 'IBM Plex Mono', monospace;
    font-weight: 700;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
    color: black;
    @media screen and (max-width: 900px){
        width: 60px;
        height: 30px;
    }
    

`;
export const Anch = styled.a`
    cursor: pointer;
    text-decoration: none;
    color: white;
`;
export const Rtitle = styled.p`
    
`;
export const Heroright = styled.div`
    display: flex;
    justify-content: space-between;
    align-item: center;
    margin: 10px;
    padding: 5px;
    left: 90%;
`;
export const HeaderTitle = styled.div`
    width: fit-content;
    

    font-family: 'IBM Plex Mono', monospace;
    font-size: 40px;
    font-weight: 600;
    margin: 20px;
    padding: 10px;
    border-radius: 20px;
`
export const HeaderContainer = styled.div`
    
    height: 70px;
    border-bottom: 1px solid grey;
    margin: 18px;
    justify-content: left;
    align-items: center;
`



