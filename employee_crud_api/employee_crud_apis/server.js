const express=require('express');
const employeeRouter=require('./router/employeeRouter');
const db=require('./config/db');

const app=express();
app.use(express.json());
app.use('/employees',employeeRouter);

app.listen(4000, () => {
    console.log(`Server started on port 4000`);
});