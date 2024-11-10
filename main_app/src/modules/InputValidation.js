function Validation(values) {
    let error = {};

    //const email_pattern = /^[*\s@]+0[~\s@]+\.[*\s@]+$/
    //const password_pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9][8,]$/

    if (!values.name.trim()) {
        error.name = "Name should not be empty";
    }

    if (!values.email.trim()) {
        error.email = "Email should not be empty";
    }
    // else if (!email_pattern.test(values.email)) {
    //     error.email = "Email didn't match the format";
    // }

    if (!values.password) {
        error.password = "Password should not be empty";
    }
    // else if (!password_pattern.test(values.password)) {
    //     error.password = "Password didn't match the requirements";
    // }

    return error; // Возвращаем ошибки
}

export default Validation;