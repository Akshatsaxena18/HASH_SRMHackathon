// Import the functions you need from the SDKs you need
import Firebase from "firebase/compat/app"
// import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import "firebase/auth";
import "firebase/compat/firestore";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyChBkTawNDTxNnLo13KMsV79dD4eisaAX0",
  authDomain: "sih-hashd.firebaseapp.com",
  databaseURL: "https://sih-hashd-default-rtdb.firebaseio.com",
  projectId: "sih-hashd",
  storageBucket: "sih-hashd.appspot.com",
  messagingSenderId: "488686909629",
  appId: "1:488686909629:web:10d1f91e3c1cf3f6955fd4",
  measurementId: "G-K2GJLJCJ71"
};

// Initialize Firebase
// const app = initializeApp(firebaseConfig);
// const analytics = getAnalytics(app);
const firebase = Firebase.initializeApp(firebaseConfig);

const db = firebase.firestore();

export {firebase ,db}