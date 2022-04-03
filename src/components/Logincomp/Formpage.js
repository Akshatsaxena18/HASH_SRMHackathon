import React,{useState,useEffect} from 'react'
import styled from 'styled-components';
import { Link } from 'react-router-dom';
import Loading from '../Hero/Loading';
import {db} from '../../config'; 

var mp = new Map();

function mapping(posts){
    posts.map((post,key) => {
        return mp.set(post.expertId,post.password);
    });
    
}

const Formpage = () => {
    const [expId, setId] = useState('');
  const [pass, setPass] = useState('');
  var ans = "/";

  const [loading,setLoading] = useState(true);
  const [posts,setPosts] = useState([]);
  useEffect(() =>
  {
      const getPostsFromFirebase = [];
      const subscriber = db.collection('experts').onSnapshot((querySnapshot) => {
          querySnapshot.forEach((doc) => {
              // console.log("doc data is",doc.data());
              // var obj = JSON.parse(doc.);
              // console.log("doc is" + obj);
              getPostsFromFirebase.push({...doc.data(),key:doc.id});
              // console.log(doc.id," ",doc.data().RID);

          });
          setPosts(getPostsFromFirebase);
          setLoading(false); 
          mapping(getPostsFromFirebase);
      });
      return () => subscriber(); 
  }, []);
  if(loading){
      return <Loading></Loading>
  }
//   console.log(posts);
//   console.log(mp);
  if(mp.get(expId) === pass){
      ans = "/home";
  }
  else{
      ans = "/";
  }
  console.log(posts);
  console.log(ans);
  return (
    <>
        <FormContainer>
            
            <Formlogin>
            <HeadingForm>WELCOME</HeadingForm>
            <div className="form-group">
          <label >
            <PText>
            Expert ID
            </PText>
            <input type="text" 
              autoComplete="off"
              placeholder="Enter the Password"
              id="expId"
              name="expId"
              value={expId}
              onChange={(e) => setId(e.target.value)}
            />
          </label>
        </div>
        <div className="form-group">
          <label>
            <PText>
            Password
            </PText>
            <input type="password" 
              autoComplete="off"
              placeholder="Enter the password"
              id="pass"
              name="pass"
              value={pass}
              onChange={(e) => setPass(e.target.value)}
            />
          </label>
        </div>
        <div className="btn">
        <button type="submit"><Link to={ans} style={{textDecoration: 'none' ,color: 'black'}}>Submit</Link></button>
        <button type="button"><Link to='/' style={{textDecoration: 'none' ,color: 'black'}}>Signup</Link></button>
        </div>

            </Formlogin>
        </FormContainer>
    </>
  )
}

export default Formpage
const FormContainer = styled.div`
    flex-direction: column;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
`

const Formlogin = styled.form`
    width: 40%;
    height:480px;
    margin: 20px;
    background:white;
    opacity: 80%;
    padding:10px;
    overflow:hidden;
  
  .form-group {
    width: 100%;
    margin-bottom: 2rem;
  }
  label {

    // padding: 50px;
    width: 100%;
    font-size: 1.8rem;
    display: flex;
    justify-content: center;
    align-items:  center;
    flex-direction: column;
  }
  input,
  textarea {
    width: 70%;
    font-size: 18px;
    padding: 10px;
    color: #04293A;
    font-weight: 800;
    background-color: #e8f6ef;
    outline: none;
    border: none;
    border-radius: 8px;
    // margin-top: 1rem;
    font-family: 'Fira Code', monospace;
  }
  textarea {
    min-height: 280px;
    width: 70%;
    resize: none;
    font-family: 'Fira Code', monospace;
  }
  .btn{
    display: flex;
    justify-content: center;

  }
  button {
      margin:15px;
    background-color: darkgreen;
    color: black;
    font-size: 15px;
    font-weight:600;
    display: inline-block;
    outline: none;
    border: none;
    padding: 1rem 4rem;
    border-radius: 8px;
    cursor: pointer;
  }
  @media screen and (max-width: 760px){
    width: 90%;
}
`;
const PText = styled.p`
text-align: left;
color: #000;
font-size: 30px; 
font-family: 'Fira Code', monospace;


`
const HeadingForm = styled.p`
  text-align: center;
  color: #000;
  font-size: 50px;
  font-weight: 700;
  font-family: 'IBM Plex Mono', monospace;
`