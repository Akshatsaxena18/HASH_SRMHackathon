import { QuerySnapshot } from '@firebase/firestore';
import React, {useState,useEffect} from 'react'
import Loading from '../components/Hero/Loading';
import Maincontainer from '../components/Hero/Maincontainer'
import Navbar from '../components/Navbar/Navbar';
import {db} from '../config' 
import HamIcon2 from '../components/Navbar/HamIcon';
import Sidebar from '../components/Sidebar/Sidebar';


// var JSONdetails = db.collection('reports').
var details = `{
  "details":{
      "123456781":{
          "desc":"potato potato",
          "rid":"123456781",
          "date":"1-2-2022",
          "crop":"potato",
          "noofcases":3,
          "location":"bangalore",
          "soil":"red soil",
          "noofimages":6,
          "lock":0
      },
      "123456782":{
          "desc":"potato potato",
          "rid":"123456782",
          "date":"1-2-2022",
          "crop":"potato",
          "noofcases":3,
          "location":"bangalore",
          "soil":"red soil",
          "noofimages":6,
          "lock":0
      },
      "123456783":{
          "desc":"potato potato",
          "rid":"123456783",
          "date":"1-2-2022",
          "crop":"potato",
          "noofcases":3,
          "location":"bangalore",
          "soil":"red soil",
          "noofimages":6,
          "lock":0
      },
      "123456784":{
          "desc":"potato potato",
          "rid":"123456784",
          "date":"1-2-2022",
          "crop":"potato",
          "noofcases":3,
          "location":"bangalore",
          "soil":"red soil",
          "noofimages":6,
          "lock":0
      },
      "123456785":{
          "rid":"123456785",
          "date":"1-2-2022",
          "crop":"potato",
          "noofcases":3,
          "location":"bangalore",
          "soil":"red soil",
          "noofimages":6,
          "desc":"potato potato",
          "lock":0
      },
      "123456786":{
          "desc":"potato potato",
          "rid":"123456786",
          "date":"1-2-2022",
          "crop":"potato",
          "noofcases":3,
          "location":"bangalore",
          "soil":"red soil",
          "noofimages":6,
          "lock":0
      },
      "123456787":{
          "desc":"potato potato",
          "rid":"123456787",
          "date":"1-2-2022",
          "crop":"potato",
          "noofcases":3,
          "location":"bangalore",
          "soil":"red soil",
          "noofimages":6,
          "lock":0
      },
      "123456788":{
        "desc":"potato potato",
        "rid":"123456788",
        "date":"1-2-2022",
        "crop":"potato",
        "noofcases":3,
        "location":"bangalore",
        "soil":"red soil",
        "noofimages":6,
        "lock":0
    }

  }
}`;
var obj = JSON.parse(details);
const Home = () => {
    const [isOpen,setIsOpen] = useState(false)

    const toggle = () => {
      setIsOpen(!isOpen)
      if(isOpen === true){
  
        document.body.classList.remove('noscroll')
        document.body.classList.add('scrollallow')
      }else{
  
        document.body.classList.remove('scrollallow')
        document.body.classList.add('noscroll')
      }
    }
    
    const [loading,setLoading] = useState(true);
    const [posts,setPosts] = useState([]);
    useEffect(() =>
    {
        const getPostsFromFirebase = [];
        const subscriber = db.collection('reports').onSnapshot((querySnapshot) => {
            querySnapshot.forEach((doc) => {
                // console.log("doc data is",doc.data());
                // var obj = JSON.parse(doc.);
                // console.log("doc is" + obj);
                getPostsFromFirebase.push({...doc.data(),key:doc.id});
                // console.log(doc.id," ",doc.data().RID);

            });
            setPosts(getPostsFromFirebase);
            setLoading(false); 
        });
        return () => subscriber(); 
    }, []);
    if(loading){
        return <Loading></Loading>
    }
    // const [loading,setLoading] = useState(true);
    // const [posts,setPosts] = useState([]);



    // var obj1 = [];
    // // eslint-disable-next-line react-hooks/exhaustive-deps
    // useEffect(  () => {
        
    //     const reports = db.collection('reports');
    // const snapshot =  reports.get();
    //     const getpost = [];
    // // console.log(snapshot);
    // snapshot.forEach((doc) => {
    //     getpost.push(...doc.data());
    //     // console.log("this is the type" ,typeof doc.data())
    //     // console.log(doc.id , "=>" , doc.data());
    //     // obj1.push(doc.data());

    // });
    // setPosts(getpost);
    // setLoading(false);
    // return () => reports();
    // }, []);
    
    console.log("Posts is ",posts);

  return (<>
    <Navbar toggle={toggle} isOpen={isOpen}></Navbar>
    <HamIcon2 toggle={toggle} isOpen={isOpen}/>
    <Sidebar isOpen = {isOpen} toggle={toggle}/>
    <Maincontainer obj = {posts}/>
    </>
  )
}

export default Home