export default function Validation(values) {
    let error = {};

    //const email_pattern = /^[*\s@]+0[~\s@]+\.[*\s@]+$/
    //const password_pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9][8,]$/

    if (!values.email.trim()) {
        error.email = "Почта не должен быть пустой";
    }
    // else if (!email_pattern.test(values.email)) {
    //     error.email = "Email didn't match the format";
    // }

    if (!values.password.trim()) {
        error.password = "Пароль не должен быть пустым";
    }
    // else if (!password_pattern.test(values.password)) {
    //     error.password = "Password didn't match the requirements";
    // }

    return error; // Возвращаем ошибки
}