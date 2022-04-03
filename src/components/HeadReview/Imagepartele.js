import styled from "styled-components";

export const ImageContainer = styled.div`
    display: grid;
    grid-template-columns: repeat(3, 33%);
    margin: 20px;
    padding: 20px;
    border-radius:10px;
    @media screen and (max-width:760px){
        grid-template-columns: repeat(1,100%);
    }
`
export const Imagesegment = styled.div`
    padding: 20px;
    margin: 20px;
    // border: 5px solid lightgreen;
    box-shadow: 10px 10px 10px 10px grey;
    border-radius:10px;
    display: flex;
    width: fit-content;
    .modal-image{
        // max-height: 150px !important;
      }
`;
export const Downloadbtn = styled.div`
    display: flex;
    align-items: center;
    justify-content: center;
`;
export const Downloadbtncomp = styled.div`
    
    // button{
    //     text-decoration: none;
    //     height: 50px;
    //     cursor: pointer;
    //     border: none;
    //     width: 100px;
    //     font-size: 20px;
    //     background-color: lightgrey;
    //     border-radius: 10px;
    //     padding; 10px;
    //     margin: 15px;
    // }
`
export const Imagesubseg = styled.div`
    display: flex;
    flex-direction: column;
`;
export const ImageShow = styled.div`
    width: 700px;
    height: 100vh;
    padding: 40px;
    margin: 40px;
`
export const Closebtn =styled.button`
    background: grey:
    color: black;

`
export const ImageAlt = styled.div`
    width: 800px;
    height: 100vh;
`