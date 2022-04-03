import logo from './logo.svg';
import './App.css';
import Home from './pages/Home';
import { BrowserRouter as Router, Routes, Route} from "react-router-dom";
import Review from './pages/Review';
import Feedback from './pages/Feedback';
import React from 'react';
import Login from './pages/Login';

// import { initializeApp } from "firebase/app";
// import { getAnalytics } from "firebase/analytics";
// // TODO: Add SDKs for Firebase products that you want to use
// // https://firebase.google.com/docs/web/setup#available-libraries

// // Your web app's Firebase configuration
// // For Firebase JS SDK v7.20.0 and later, measurementId is optional
// const firebaseConfig = {
//   apiKey: "AIzaSyChBkTawNDTxNnLo13KMsV79dD4eisaAX0",
//   authDomain: "sih-hashd.firebaseapp.com",
//   projectId: "sih-hashd",
//   storageBucket: "sih-hashd.appspot.com",
//   messagingSenderId: "488686909629",
//   appId: "1:488686909629:web:10d1f91e3c1cf3f6955fd4",
//   measurementId: "G-K2GJLJCJ71"
// };

// // Initialize Firebase
// const app = initializeApp(firebaseConfig);
// const analytics = getAnalytics(app);

// import ContactUs component
class App extends React.Component{
  // constructor(props){
  //   super(props);
  //   this.state = {apiResponse:""}
  // }
  // callAPI(){
  //   fetch("http://localhost:9000/testAPI")
  //   .then(res => res.text())
  //   .then(res => this.setState({apiResponse: res}))
  // }
  // componentWillMount(){
  //   this.callAPI();
  // }
render() {
  // console.log(this.state.apiResponse)
  return (
    <Router className="App">
      <Routes>
          {/* This route is for home component 
          with exact path "/", in component props 
          we passes the imported component*/}
          <Route path="/" element={<Login/>} />
          <Route path="/home" element={<Home/>} />
            
          {/* This route is for about component 
          with exact path "/about", in component 
          props we passes the imported component*/}
          <Route path="/review" element={<Review/>} />
          <Route path="/feedback" element={<Feedback/>} />
            
          {/* This route is for contactus component
          with exact path "/contactus", in 
          component props we passes the imported component*/}
            
          {/* If any route mismatches the upper 
          route endpoints then, redirect triggers 
          and redirects app to home component with to="/" */}
          {/* <Redirect to="/" /> */}
        </Routes>
    </Router>
  );
}
}

export default App;
