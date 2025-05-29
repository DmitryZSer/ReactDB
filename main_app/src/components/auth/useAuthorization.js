import { useContext } from 'react';
import { KeycloakContext} from "./KeycloakContext";

export const useAuthorization = () => {
    const { user_roles } = useContext(KeycloakContext);

    const userHasRole = (requiredRoles) => {
        return requiredRoles.some(role => user_roles.includes(role));
    };

    return { userHasRole };
};