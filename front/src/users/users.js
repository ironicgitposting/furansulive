import * as React from "react";
import { List, Datagrid, TextField, EmailField } from 'react-admin';

// Custom Fields
import { UrlField } from "../fields/UrlField";

export const UserList = props => (

    < List {...props}>
        <Datagrid rowClick="edit">
            <TextField source="id" />
            <TextField source="name" />
            <TextField source="username" />
            <EmailField source="email" />
            <TextField source="address.street" />
            <TextField source="phone" />
            <UrlField source="website" />
            <TextField source="company.name" />
        </Datagrid>
    </List >
);