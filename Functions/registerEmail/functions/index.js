const functions = require('firebase-functions');
const admin = require("firebase-admin")
const nodemailer = require('nodemailer');

admin.initializeApp();

// admin.initializeApp({
//     credential: admin.credential.applicationDefault()
// });

var transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 465,
    secure: true,
    auth: {
        user: 'esp32mrdoorbell@gmail.com',
        pass: 'esp32mrmr'
    }
});

var emailsRef = admin.firestore().collection('emails');

exports.registerEmail = functions.firestore
    .document('emails/{emailId}')
    .onCreate((snap, context) => {
        const mailOptions = {
            from: `esp32mrdoorbell@gmail.com`,
            to: snap.data().email,
            subject: 'Email Registered',
            html: `<h1>Your email was successfully registered on MRDoorbell system.</h1>`
        };        
        return transporter.sendMail(mailOptions, (error, data) => {
            if (error) {
                console.log(error)
                return
            }
            console.log("Sent!")
        });  
    });

  



// exports.sendEmail = functions.firestore
//     .document('pictures/{picturesId}')
//     .onCreate((snap, context) => {
//         var allEmails = emailsRef.get()
//             .then(snapshot => {
//                 snapshot.forEach(doc => {
//                     console.log(doc.id, '=>', doc.data());
//                     const mailOptions = {
//                         from: `esp32mrdoorbell@gmail.com`,
//                         to: doc.data().email,
//                         subject: 'Notification ESP32 Doorbell',
//                         html: `<h1>Someone rang your doorbell.</h1>
//                                 <p>                                    
//                                     <b>Name: </b>${snap.data().name}<br>
//                                     <b>Date: </b>${snap.data().date}<br>
//                                     <img src="${snap.data().imageURL}" />
//                                 </p>`
//                     };        
//                     return transporter.sendMail(mailOptions, (error, data) => {
//                         if (error) {
//                             console.log(error)
//                             return
//                         }
//                         console.log("Sent!")
//                     });
//                 });
//                 return doc.data();
//             })
//             .catch(err => {
//                 console.log('Error getting documents', err);
//             });        
//     });

