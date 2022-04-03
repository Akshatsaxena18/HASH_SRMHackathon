import styled from "styled-components";

export const ContainerMain = styled.div`
    display: grid;
    grid-template-columns: repeat(3, 33%);
    @media screen and (max-width: 760px){
        grid-template-columns: repeat(1,100%);
    }
    background-image: url('https://farmer.gov.in/imagedefault/containerbg.jpg');
`