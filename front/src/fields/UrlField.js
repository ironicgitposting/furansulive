import * as React from "react";
import { useRecordContext } from "react-admin";
import { makeStyles } from '@material-ui/core/styles';
import LaunchIcon from '@material-ui/icons/Launch';


const useStyles = makeStyles({
    link: {
        textDecoration: 'none',
    },
    icon: {
        width: '0.5em',
        height: '0.5em',
        paddingLeft: 2,
    }
});

export const UrlField = (props) => {
    console.log(props);
    const classes = useStyles();
    const { source } = props;
    const record = useRecordContext();
    return record ? (
        <a href={record[source]} className={classes.link}>
            {record[source]}
            <LaunchIcon className={classes.icon}></LaunchIcon>
        </a>
    ) : null;
}
