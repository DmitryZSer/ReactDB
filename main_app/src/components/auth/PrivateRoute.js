// PrivateRoute.js
import { Navigate } from 'react-router-dom';
import { useContext } from 'react';
import { KeycloakContext} from "./KeycloakContext";

export const PrivateRoute = ({ element, roles, ...rest }) => {
    const { user_roles } = useContext(KeycloakContext);

    const isAuthorized = () => {
        return roles.some(role => user_roles.includes(role));
    };

    return isAuthorized() ? element : <Navigate to="/" />;
};