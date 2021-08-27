var crypto = require('crypto');

//Create class and timestamp method
class Customer {
    constructor(name, age, id) {
        this.name = name;
        this.age = age;
        this.id = id;
    }

    getTimeStamp() {
        var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        var d = new Date();
        var day = days[d.getDay()];
        var hr = d.getHours();
        var min = d.getMinutes();
        if (min < 10) {
            min = "0" + min;
        }
        var ampm = "am";
        if (hr > 12) {
            hr -= 12;
            ampm = "pm";
        }
        var date = d.getDate();
        var month = months[d.getMonth()];
        var year = d.getFullYear();
        return day + " " + hr + ":" + min + ampm + " " + date + " " + month + " " + year;
    }
}

const randomId = Math.random().toString(36).slice(2)

const name = new Customer('Ralia', 24, randomId);
console.log('Ralia', name)

let stringed = JSON.stringify(name);
console.log('STRINGED', stringed);

console.log('Time', name.getTimeStamp());

const j = 'joy';

let jHash = crypto.createHash('sha1').update(stringed).digest('hex');

console.log('JHASH', jHash);