const functions = require('firebase-functions');
const admin = require("firebase-admin")
const nodemailer = require('nodemailer');

admin.initializeApp()

var transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 465,
    secure: true,
    auth: {
        user: 'esp32mrdoorbell@gmail.com',
        pass: 'esp32mrmr'
    }
});

exports.sendEmail = functions.firestore
    .document('emails/{emailsId}')
    .onCreate((snap, context) => {
        const mailOptions = {
            from: `esp32mrdoorbell@gmail.com`,
            to: snap.data().email,
            subject: 'Notification ESP32 Doorbell',
            html: `<h1>Your e-mail has been registered.</h1>
                    <p>
                        <b>Email: </b>${snap.data().email}<br>
                        <b>Name: </b>Picture 04<br>
                        <b>Date: </b>22/Oct/2019 07:00 AM<br>                                  
                        <img src="https://firebasestorage.googleapis.com/v0/b/notification-mrdoorbell.appspot.com/o/pictures%2F4.jpg?alt=media&token=f158ffa8-6234-4b07-8eb8-da5bcb84ac70" />
                    </p>`
        };        
        return transporter.sendMail(mailOptions, (error, data) => {
            if (error) {
                console.log(error)
                return
            }
            console.log("Sent!")
        });
    });